const prisma = require('../db/prisma');
const Fuse = require('fuse.js');
const { getInstitutionsOpenNow } = require('../filter/openNow');

function formatInstitution(inst) {
    return {
      id: inst.id,
      name: inst.name,
      description: inst.description,
      image: inst.images[0]?.image_url,
      rating: inst.reviews.reduce((sum, review) => sum + review.rating, 0) / inst.reviews.length,
    };
}

exports.searchInstitutions = async (searchTerm) => {
  const allInstitutions = await prisma.institution.findMany({
    include: { images: true, reviews: true }
  });

  const fuse = new Fuse(allInstitutions, {
    keys: ['name'],
    threshold: 0.4,
  });

  const searchResults = searchTerm
    ? fuse.search(searchTerm).map(result => result.item)
    : allInstitutions;

  return searchResults.map(formatInstitution);
};

exports.searchCategories = async (searchTerm) => {
  const allCategories = await prisma.categories.findMany({
    include: { category_search_terms: true },
  });

  const searchableData = allCategories.map(cat => ({
    ...cat,
    searchIndex: [
      cat.name,
      ...cat.category_search_terms.map(term => term.term)
    ].join(' ')
  }));
  const fuse = new Fuse(searchableData, {
    keys: ['name'],
    threshold: 0.4,
  });

  const searchResults = searchTerm
    ? fuse.search(searchTerm).map(result => result.item)
    : searchableData;

  return searchResults;
}

exports.getInstitutionsByCategory = async ({ category_id, filter, amenities, price, open }) => {
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
        where: { label: price },
      });

      if (priceRange && priceRange.length > 0) {
        let price_id = priceRange.map(range => range.id);
        where.price_ranges = {
          some: {
            id: { in: price_id },
          },
        };
      } else {
        const err = new Error('Invalid price label');
        err.status = 400;
        throw err;
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

  // Sorting
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

  return institutions.map(formatInstitution);
};

exports.getTopAmenitiesByCategory = async (categoryId) => {
  const institutionsInCategory = await prisma.institution.findMany({
    where: { category_id: categoryId },
    select: { id: true }
  });

  const institutionIds = institutionsInCategory.map(inst => inst.id);
  if (institutionIds.length === 0) return [];

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

  return amenities;
};
    


