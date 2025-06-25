const express = require('express');
const router = express.Router();
const searchController = require('../controllers/searchController');

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

router.get('/institutions', searchController.searchInstitutions);



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

router.get('/categories', searchController.searchCategories);

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

router.get('/:category_id', searchController.getInstitutionsByCategory);
  

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
router.get("/list/amenity", searchController.getTopAmenitiesByCategory);



module.exports = router