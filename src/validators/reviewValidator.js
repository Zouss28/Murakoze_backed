const { body, param } = require('express-validator');

exports.validateReview = [
  param('inst_id')
    .notEmpty().withMessage('Institution ID is required'),
  body('rating')
    .notEmpty().withMessage('Rating is required'),
  body('review')
    .notEmpty().withMessage('Review is required')
    .isString().withMessage('Review must be a string')
];
