const adminService = require('../services/adminService');
const { validationResult } = require('express-validator');

exports.getDashboard = async (req, res, next) => {
  try {
    const dashboard = await adminService.getDashboardStats();
    res.json(dashboard);
  } catch (err) {
    next(err);
  }
};

exports.getUsers = async (req, res, next) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const search = req.query.search || '';
    
    const users = await adminService.getUsers(page, limit, search);
    res.json(users);
  } catch (err) {
    next(err);
  }
};

exports.getInstitutions = async (req, res, next) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const search = req.query.search || '';
    const category = req.query.category || '';
    
    const institutions = await adminService.getInstitutions(page, limit, search, category);
    res.json(institutions);
  } catch (err) {
    next(err);
  }
};

exports.getReviews = async (req, res, next) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const limit = parseInt(req.query.limit) || 10;
    const status = req.query.status || 'all'; // all, pending, approved, rejected
    
    const reviews = await adminService.getReviews(page, limit, status);
    res.json(reviews);
  } catch (err) {
    next(err);
  }
};

exports.moderateReview = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    
    const { reviewId } = req.params;
    const { action, reason } = req.body; // action: 'approve', 'reject'
    
    const result = await adminService.moderateReview(reviewId, action, reason);
    res.json(result);
  } catch (err) {
    next(err);
  }
};

exports.getAnalytics = async (req, res, next) => {
  try {
    const period = req.query.period || '30d'; // 7d, 30d, 90d, 1y
    
    const analytics = await adminService.getAnalytics(period);
    res.json(analytics);
  } catch (err) {
    next(err);
  }
};

exports.updateInstitution = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) {
      return res.status(400).json({ errors: errors.array() });
    }
    
    const { institutionId } = req.params;
    const result = await adminService.updateInstitution(institutionId, req.body);
    res.json(result);
  } catch (err) {
    next(err);
  }
};

exports.deleteUser = async (req, res, next) => {
  try {
    const { userId } = req.params;
    const result = await adminService.deleteUser(userId);
    res.json(result);
  } catch (err) {
    next(err);
  }
}; 