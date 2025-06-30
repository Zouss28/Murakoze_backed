const { body, param } = require('express-validator');

exports.validateModeration = [
  param('reviewId')
    .isInt({ min: 1 })
    .withMessage('Review ID must be a positive integer'),
  
  body('action')
    .isIn(['approve', 'reject'])
    .withMessage('Action must be either "approve" or "reject"'),
  
  body('reason')
    .optional()
    .isString()
    .trim()
    .isLength({ max: 500 })
    .withMessage('Reason must be a string with maximum 500 characters')
];

exports.validateInstitutionUpdate = [
  param('institutionId')
    .isInt({ min: 1 })
    .withMessage('Institution ID must be a positive integer'),
  
  body('name')
    .optional()
    .isString()
    .trim()
    .isLength({ min: 1, max: 100 })
    .withMessage('Name must be between 1 and 100 characters'),
  
  body('description')
    .optional()
    .isString()
    .trim()
    .isLength({ max: 1000 })
    .withMessage('Description must be maximum 1000 characters'),
  
  body('address')
    .optional()
    .isString()
    .trim()
    .isLength({ max: 255 })
    .withMessage('Address must be maximum 255 characters'),
  
  body('phone_number')
    .optional()
    .isString()
    .trim()
    .isLength({ max: 20 })
    .withMessage('Phone number must be maximum 20 characters'),
  
  body('email')
    .optional()
    .isEmail()
    .withMessage('Email must be a valid email address'),
  
  body('url')
    .optional()
    .isURL()
    .withMessage('URL must be a valid URL'),
  
  body('category_id')
    .optional()
    .isInt({ min: 1 })
    .withMessage('Category ID must be a positive integer')
]; 