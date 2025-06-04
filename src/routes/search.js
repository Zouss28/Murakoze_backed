const express = require('express');
const router = express.Router();
const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();
const {getInstitutionsOpenNow} = require('../filter/openNow');
const Fuse = require('fuse.js'); 

/**
 * @swagger
 * /api/search/institutions:
 *   get:
 *     summary: Search institutions with pagination
 *     description: Search for institutions by name. Supports pagination and returns total count.
 *     tags:
 *       - Search
 *     parameters:
 *       - in: query
 *         name: q
 *         schema:
 *           type: string
 *         description: Search term (name).
 *       - in: query
 *         name: page
 *         schema:
 *           type: integer
 *           default: 1
 *         description: Page number (1-based index).
 *       - in: query
 *         name: pageSize
 *         schema:
 *           type: integer
 *           default: 5
 *         description: Number of items per page.
 *     responses:
 *       200:
 *         description: Successful search with paginated results
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 data:
 *                   type: array
 *                   items:
 *                     $ref: '#/components/schemas/Institution'
 *                 page:
 *                   type: integer
 *                   example: 1
 *                 totalPages:
 *                   type: integer
 *                   example: 5
 *                 totalCount:
 *                   type: integer
 *                   example: 45
 *       500:
 *         description: Internal server error
 */

router.get('/institutions', async (req, res) => {
  try {
    const searchTerm = req.query.q || '';
    const page = parseInt(req.query.page) || 1;
    const pageSize = parseInt(req.query.pageSize) || 5;
    const skip = (page - 1) * pageSize;

    // Fetch all institutions once
    const allInstitutions = await prisma.institution.findMany({
      include: { images: true, reviews: true }
    });

    // Initialize Fuse
    const fuse = new Fuse(allInstitutions, {
      keys: ['name'],
      threshold: 0.4, // Lower = stricter match, higher = fuzzier
    });

    // Perform fuzzy search or return all if no term
    const searchResults = searchTerm
      ? fuse.search(searchTerm).map(result => result.item)
      : allInstitutions;

    // Paginate the fuzzy results
    const paginatedResults = searchResults.slice(skip, skip + pageSize);

    res.json({
      data: paginatedResults.map(formatInstitution),
      page: page,
      totalPages: Math.ceil(searchResults.length / pageSize),
      totalCount: searchResults.length
    });
  } catch (error) {
    console.error('Search error:', error);
    res.status(500).json({ error: 'Something went wrong!' });
  }
});

function formatInstitution(inst) {
  const ratings = inst.reviews.map((r) => r.rating);
  const avgRating =
    ratings.length > 0
      ? ratings.reduce((a, b) => a + b, 0) / ratings.length
      : null;

  return {
    id: inst.id,
    name: inst.name,
    description: inst.description,
    location: inst.address,
    image: inst.images[0] || null,
    avgRating: avgRating ? Number(avgRating.toFixed(2)) : null,
    totalReview: ratings.length,
    workingHours: inst.workingHour,
  };
}

/**
 * @swagger
 * /api/search/categories:
 *   get:
 *     summary: Search categories with pagination
 *     description: Fuzzy search for institution categories by name.
 *     tags:
 *       - Search
 *     parameters:
 *       - in: query
 *         name: q
 *         schema:
 *           type: string
 *         description: Search term (category name).
 *       - in: query
 *         name: page
 *         schema:
 *           type: integer
 *           default: 1
 *         description: Page number.
 *       - in: query
 *         name: pageSize
 *         schema:
 *           type: integer
 *           default: 5
 *         description: Number of items per page.
 *     responses:
 *       200:
 *         description: List of matched categories with pagination
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 data:
 *                   type: array
 *                   items:
 *                     type: object
 *                     properties:
 *                       id:
 *                         type: integer
 *                       name:
 *                         type: string
 *                       sector_id:
 *                         type: integer
 *                         nullable: true
 *                 page:
 *                   type: integer
 *                 totalPages:
 *                   type: integer
 *                 totalCount:
 *                   type: integer
 */

router.get('/categories', async (req, res) => {
  try {
    const searchTerm = req.query.q || '';
    const page = parseInt(req.query.page) || 1;
    const pageSize = parseInt(req.query.pageSize) || 5;
    const skip = (page - 1) * pageSize;

    // Get all categories along with their search terms
    const allCategories = await prisma.categories.findMany({
      include: { category_search_terms: true },
    });

    // Flatten the data for Fuse
    const searchableData = allCategories.map(cat => ({
      ...cat,
      searchIndex: [
        cat.name,
        ...cat.category_search_terms.map(term => term.term)
      ].join(' ')
    }));

    // Fuse search on both category name and custom terms
    const fuse = new Fuse(searchableData, {
      keys: ['searchIndex'],
      threshold: 0.4,
    });

    const searchResults = searchTerm
      ? fuse.search(searchTerm).map(result => result.item)
      : searchableData;

    const paginatedResults = searchResults.slice(skip, skip + pageSize);

    res.json({
      data: paginatedResults,
      page,
      totalPages: Math.ceil(searchResults.length / pageSize),
      totalCount: searchResults.length
    });
  } catch (error) {
    console.error('Category search error:', error);
    res.status(500).json({ error: 'Something went wrong!' });
  }
});

/**
 * @swagger
 * /api/search/{category_id}:
 *   get:
 *     summary: Get institutions by category with optional filters
 *     description: Retrieve a list of institutions for a specific category with optional filtering by rating, number of reviews, amenities, price range, and open status.
 *     parameters:
 *       - in: path
 *         name: category_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID of the category
 *       - in: query
 *         name: filter
 *         required: false
 *         schema:
 *           type: string
 *           enum: [rating, review]
 *         description: Filter institutions by 'rating' or 'review' count
 *       - in: query
 *         name: amenities
 *         required: false
 *         schema:
 *           type: string
 *         description: Comma-separated list of amenity IDs (e.g., 1,2,3)
 *       - in: query
 *         name: price
 *         required: false
 *         schema:
 *           type: string
 *         description: Price label to filter by (e.g., $, $$, $$$)
 *       - in: query
 *         name: open
 *         required: false
 *         schema:
 *           type: string
 *           enum: [true, false]
 *         description: Whether to filter only institutions currently open
 *     responses:
 *       200:
 *         description: A list of filtered institutions
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 institutions:
 *                   type: array
 *                   items:
 *                     type: object
 *                     properties:
 *                       id:
 *                         type: integer
 *                       name:
 *                         type: string
 *                       description:
 *                         type: string
 *                       location:
 *                         type: string
 *                       image:
 *                         type: object
 *                         nullable: true
 *                       avgRating:
 *                         type: number
 *                         nullable: true
 *                       totalReview:
 *                         type: integer
 *                       workingHours:
 *                         type: array
 *                         items:
 *                           type: object
 *       400:
 *         description: Invalid parameters (e.g., invalid price label)
 *       500:
 *         description: Internal server error
 */

router.get('/:category_id', async (req, res) => {
  try {
    const category_id = parseInt(req.params.category_id, 10);
    const {
      filter,
      amenities,
      price,
      open,
    } = req.query;

    let institutions;

    if (open === 'true') {
      institutions = await getInstitutionsOpenNow(category_id);
    } else {
      const where = { category_id };

      // Amenities filtering
      if (amenities) {
        let amenityIds = Array.isArray(amenities)
          ? amenities.map((id) => parseInt(id))
          : amenities.split(',').map((id) => parseInt(id));

        where.business_amenities = {
          some: {
            amenitY_id: { in: amenityIds },
          },
        };
      }

      // Price filtering
      if (price) {
        const priceRange = await prisma.price_ranges.findMany({
          where: {
            label: price,
          },
        });

        if (priceRange) {
          let price_id = priceRange.map(range => range.id);
          where.price_ranges = {
          some: {
            id: { in: price_id },
          },
        };
        } else {
          return res.status(400).json({ error: 'Invalid price label' });
        }
      }

      institutions = await prisma.institution.findMany({
        where,
        include: {
          reviews: true,
          images: true,
          workingHour: true,
          price_ranges: true,
        },
      });
    }

    if (filter === 'review') {
      institutions.sort((a, b) => b.reviews.length - a.reviews.length);
    } else if (filter === 'rating') {
      institutions.sort((a, b) => {
        const aRating = a.reviews.length
          ? a.reviews.reduce((s, r) => s + r.rating, 0) / a.reviews.length
          : 0;
        const bRating = b.reviews.length
          ? b.reviews.reduce((s, r) => s + r.rating, 0) / b.reviews.length
          : 0;
        return bRating - aRating;
      });
    }

    const result = institutions.map(formatInstitution);

    res.json({ institutions: result });
  } catch (error) {
    console.error('Error during institution search:', error);
    res.status(500).json({ error: 'Something went wrong!' });
  }
});

/**
 * @swagger
 * /api/search/list/amenity:
*   get:
 *     summary: Get top 10 most common amenities in a category
 *     description: Returns the top 10 most frequently used amenities among institutions within a given category.
 *     tags:
 *       - Amenities
 *     parameters:
 *       - in: query
 *         name: category_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: The ID of the category to fetch amenities for.
 *     responses:
 *       200:
 *         description: A list of the top 10 amenities
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 amenities:
 *                   type: array
 *                   items:
 *                     type: object
 *                     properties:
 *                       id:
 *                         type: integer
 *                       name:
 *                         type: string
 *                       icon:
 *                         type: string
 *       400:
 *         description: Invalid category_id provided
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                   example: Invalid category_id
 *       500:
 *         description: Server error
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 error:
 *                   type: string
 *                   example: Something went wrong!
 */
router.get("/list/amenity", async (req, res) => {
  try {
    const categoryId = parseInt(req.query.category_id);
    if (isNaN(categoryId)) return res.status(400).json({ error: "Invalid category_id" });

    const institutionsInCategory = await prisma.institution.findMany({
      where: { category_id: categoryId },
      select: { id: true }
    });

    const institutionIds = institutionsInCategory.map(inst => inst.id);
    if (institutionIds.length === 0) return res.json({ amenities: [] });

    const amenityCounts = await prisma.business_amenities.groupBy({
      by: ['amenitY_id'],
      where: {
        institution_id: { in: institutionIds }
      },
      _count: { id: true },
      orderBy: { _count: { id: 'desc' } }
    });

    const amenityIds = amenityCounts.map(a => a.amenitY_id);

    const amenities = await prisma.amenities.findMany({
      where: { id: { in: amenityIds } },
      take: 10
    });

    return res.json({ amenities });

  } catch (error) {
    console.error("Error fetching amenities by category:", error);
    res.status(500).json({ error: "Something went wrong!" });
  }
});




module.exports = router