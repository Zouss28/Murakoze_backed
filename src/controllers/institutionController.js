const institutionService = require('../services/institutionService');
const { validationResult } = require('express-validator');

exports.getCategories = async (req, res, next) => {
  try {
    const result = await institutionService.getCategories();
    res.json(result);
  } catch (err) {
    next(err);
  }
};

exports.getInstitutionsByCategory = async (req, res, next) => {
  try {
    const category_id = parseInt(req.params.category_id, 10);
    const page = parseInt(req.query.page) || 1;
    const pageSize = parseInt(req.query.pageSize) || 5;
    const result = await institutionService.getInstitutionsByCategory(category_id, page, pageSize);
    res.json(result);
  } catch (err) {
    next(err);
  }
};

exports.createInstitution = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    const result = await institutionService.createInstitution(req.body);
    res.json(result);
  } catch (err) {
    next(err);
  }
};

exports.updateInstitution = async (req, res,next) => {
  try{
    const errors = validationResult(req);
    if (!errors.isEmpty()){
      return res.status(400).json({errors:errors.array()});
    }
    await institutionService.updateInstitution(req.body);
    res.json({
      message : "Institution update succesfully ."
    });
  }catch(err){
    next(err);
  }
}

exports.getInstitutionById = async (req, res, next) => {
  try {
  const institution_id = parseInt(req.params.id,10);
  const result = institutionService.getInstitutionsByID(institution_id);
  res.json(result);
  } catch (err) {
    next(err);
  }
}