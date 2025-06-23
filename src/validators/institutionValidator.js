const { body } = require('express-validator');

exports.validateInstitution = [
    body('name').notEmpty().withMessage('Name is required'),
    body('description').notEmpty().withMessage('Description is required'),
    body('category_id').notEmpty().withMessage('Category is required'),
    body('address').notEmpty().withMessage('Address is required'),
    body('phone').notEmpty().withMessage('Phone is required'),
    body('email').isEmail().withMessage('Invalid email address'),
    body('website').isURL().withMessage('Invalid website URL'),
    body('latitude').notEmpty().withMessage('Latitude is required'),
    body('longitude').notEmpty().withMessage('Longitude is required'),
    body('page').isInt({ min: 1 }).withMessage('Page must be a positive integer'),
    body('pageSize').isInt({ min: 1 }).withMessage('Page size must be a positive integer')
    
];
