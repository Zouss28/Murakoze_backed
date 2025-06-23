const { body } = require('express-validator');

exports.validateSignup = [
  body('email').isEmail(),
  body('password').isLength({ min: 6 }),
  body('first_name').notEmpty(),
  body('last_name').notEmpty(),
  // Add more as needed
];

exports.validateLogin = [
  body('email').isEmail(),
  body('password').notEmpty(),
];
