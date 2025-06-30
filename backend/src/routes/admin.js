const express = require('express');
const router = express.Router();
const adminController = require('../controllers/adminController');
const auth = require('../middleware/authMiddleware');
const adminAuth = require('../middleware/adminAuthMiddleware');
const { validateModeration, validateInstitutionUpdate } = require('../validators/adminValidator');

// All admin routes require authentication and admin privileges
router.use(auth, adminAuth);

/**
 * @swagger
 * /api/admin/dashboard:
 *   get:
 *     summary: Get admin dashboard overview
 *     security:
 *       - bearerAuth: []
 *     tags:
 *       - Admin
 *     responses:
 *       200:
 *         description: Dashboard data retrieved successfully
 */
router.get('/dashboard', adminController.getDashboard);

/**
 * @swagger
 * /api/admin/users:
 *   get:
 *     summary: Get all users
 *     security:
 *       - bearerAuth: []
 *     tags:
 *       - Admin
 *     responses:
 *       200:
 *         description: List of users
 */
router.get('/users', adminController.getUsers);

/**
 * @swagger
 * /api/admin/users/{userId}:
 *   delete:
 *     summary: Delete a user by ID
 *     security:
 *       - bearerAuth: []
 *     tags:
 *       - Admin
 *     parameters:
 *       - in: path
 *         name: userId
 *         required: true
 *         schema:
 *           type: string
 *         description: The user ID
 *     responses:
 *       200:
 *         description: User deleted successfully
 */
router.delete('/users/:userId', adminController.deleteUser);

/**
 * @swagger
 * /api/admin/institutions:
 *   get:
 *     summary: Get all institutions
 *     security:
 *       - bearerAuth: []
 *     tags:
 *       - Admin
 *     responses:
 *       200:
 *         description: List of institutions
 */
router.get('/institutions', adminController.getInstitutions);

/**
 * @swagger
 * /api/admin/institutions/{institutionId}:
 *   put:
 *     summary: Update an institution by ID
 *     security:
 *       - bearerAuth: []
 *     tags:
 *       - Admin
 *     parameters:
 *       - in: path
 *         name: institutionId
 *         required: true
 *         schema:
 *           type: string
 *         description: The institution ID
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *     responses:
 *       200:
 *         description: Institution updated successfully
 */
router.put('/institutions/:institutionId', validateInstitutionUpdate, adminController.updateInstitution);

/**
 * @swagger
 * /api/admin/reviews:
 *   get:
 *     summary: Get all reviews for moderation
 *     security:
 *       - bearerAuth: []
 *     tags:
 *       - Admin
 *     responses:
 *       200:
 *         description: List of reviews
 */
router.get('/reviews', adminController.getReviews);

/**
 * @swagger
 * /api/admin/reviews/{reviewId}/moderate:
 *   put:
 *     summary: Moderate a review by ID
 *     security:
 *       - bearerAuth: []
 *     tags:
 *       - Admin
 *     parameters:
 *       - in: path
 *         name: reviewId
 *         required: true
 *         schema:
 *           type: string
 *         description: The review ID
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *     responses:
 *       200:
 *         description: Review moderated successfully
 */
router.put('/reviews/:reviewId/moderate', validateModeration, adminController.moderateReview);

/**
 * @swagger
 * /api/admin/analytics:
 *   get:
 *     summary: Get analytics data
 *     security:
 *       - bearerAuth: []
 *     tags:
 *       - Admin
 *     responses:
 *       200:
 *         description: Analytics data retrieved successfully
 */
router.get('/analytics', adminController.getAnalytics);

module.exports = router; 