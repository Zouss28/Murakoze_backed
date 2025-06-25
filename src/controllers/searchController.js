const searchService = require('../services/searchService');

exports.searchInstitutions = async (req, res, next) => {
  try {
    const searchTerm = req.query.q || '';
    const page = parseInt(req.query.page) || 1;
    const pageSize = parseInt(req.query.pageSize) || 5;
    const skip = (page - 1) * pageSize;

    const searchResults = await searchService.searchInstitutions(searchTerm);
    const paginatedResults = searchResults.slice(skip, skip + pageSize);
    res.json({
      data: paginatedResults,
      page: page,
      totalPages: Math.ceil(searchResults.length / pageSize),
      totalCount: searchResults.length
    });
  } catch (err) {
    console.log("Error:", err);
    res.status(500).json({ error: "Something went wrong with the search!" });
  }
};

exports.searchCategories = async (req, res, next) => {
  try {
    const searchTerm = req.query.q || '';
    const page = parseInt(req.query.page) || 1;
    const pageSize = parseInt(req.query.pageSize) || 5;
    const skip = (page - 1) * pageSize;

    const searchResults = await searchService.searchCategories(searchTerm);
    const paginatedResults = searchResults.slice(skip, skip + pageSize);
    res.json({
      data: paginatedResults,
      page: page,
      totalPages: Math.ceil(searchResults.length / pageSize),
      totalCount: searchResults.length
    });
  } catch (err) {
    console.log("Error:", err);
    res.status(500).json({ error: "Something went wrong with the search!" });
  }
};

exports.getInstitutionsByCategory = async (req, res, next) => {
  try {
    const category_id = parseInt(req.params.category_id, 10);
    const { filter, amenities, price, open } = req.query;
    const result = await searchService.getInstitutionsByCategory({
      category_id,
      filter,
      amenities,
      price,
      open
    });
    res.json({ institutions: result });
  } catch (err) {
    console.log("Error:", err);
    res.status(500).json({ error: "Something went wrong with the search!" });
  }
};

exports.getTopAmenitiesByCategory = async (req, res, next) => {
  try {
    const categoryId = parseInt(req.query.category_id, 10);
    if (isNaN(categoryId)) return res.status(400).json({ error: "Invalid category_id" });

    const amenities = await searchService.getTopAmenitiesByCategory(categoryId);
    res.json({ amenities });
  } catch (err) {
    console.log("Error:", err);
    res.status(500).json({ error: "Something went wrong with the search!" });
  }
};



