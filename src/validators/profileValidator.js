const { body } = require('express-validator');

exports.validateProfileUpdate = [
  body('first_name').notEmpty().withMessage('First name is required'),
  body('last_name').notEmpty().withMessage('Last name is required'),
  body('email').notEmpty().withMessage('Email is required'),
  body('phone_number').notEmpty().withMessage('Phone number is required'),
  body('age_group').notEmpty().withMessage('Age group is required'),
  body('gender').notEmpty().withMessage('Gender is required'),
  body('address').notEmpty().withMessage('Address is required'),
];
