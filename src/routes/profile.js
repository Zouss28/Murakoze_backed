const express = require('express');
const router = express.Router();
const upload = require('../../uploads')
const profileController = require('../controllers/profileController');
const { validateProfileUpdate } = require('../validators/profileValidator');
/**
 * @swagger
 * tags:
 *   name: Profile
 *   description: Profile-related endpoints
 */


/**
 * @swagger
 * /api/profile/dashboard:
 *   get:
 *     summary: Get user dashboard information
 *     tags:
 *       - Profile
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Successfully retrieved user profile
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Profile found
 *                 user:
 *                   type: object
 *                 profile_image:
 *                   type: array
 *                   items:
 *                     type: object
 *       404:
 *         description: User not found
 *       500:
 *         description: Internal server error
 */

router.get('/dashboard', profileController.getDashboard);


/**
 * @swagger
 * /api/profile/guestDashboard:
 *   get:
 *     summary: Get guest user dashboard information
 *     tags:
 *       - Profile
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: query
 *         name: guestID
 *         schema:
 *           type: string
 *         required: true
 *         description: The ID of the guest user to fetch
 *     responses:
 *       200:
 *         description: Successfully retrieved guest user profile
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Profile found
 *                 first_name:
 *                   type: string
 *                   example: John
 *                 last_name:
 *                   type: string
 *                   example: Doe
 *                 gender:
 *                   type: string
 *                   example: male
 *                 profile_image:
 *                   type: string
 *                   example: https://example.com/image.jpg
 *       404:
 *         description: User not found
 *       500:
 *         description: Internal server error
 */

router.get('/guestDashboard', profileController.getGuestDashboard);


/**
 * @swagger
 * /api/profile/dashboard/update:
 *   put:
 *     summary: Update user profile
 *     tags:
 *       - Profile
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               first_name:
 *                 type: string
 *               last_name:
 *                 type: string
 *               email:
 *                 type: string
 *               password:
 *                 type: string
 *               phone_number:
 *                 type: string
 *               age_group:
 *                 type: string
 *               gender:
 *                 type: string
 *               address:
 *                 type: string
 *     responses:
 *       200:
 *         description: Profile updated
 *       404:
 *         description: User not found
 *       500:
 *         description: Internal server error
 */

router.put('/dashboard/update', validateProfileUpdate, profileController.updateProfile);



/**
 * @swagger
 * /api/profile/reviews:
 *   get:
 *     summary: Get user reviews
 *     tags:
 *       - Profile
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Reviews fetched successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                 reviews:
 *                   type: array
 *                   items:
 *                     type: object
 *                 images:
 *                   type: array
 *                   items:
 *                     type: object
 *       404:
 *         description: User not found
 *       500:
 *         description: Internal server error
 */

router.get('/reviews', profileController.getReviews);

/**
 * @swagger
 * /api/profile/guestReviews:
 *   get:
 *     summary: Get reviews of another user (guest profile)
 *     tags:
 *       - Profile
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: query
 *         name: guestID
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID of the user whose reviews you want to see
 *     responses:
 *       200:
 *         description: Reviews fetched successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                 reviews:
 *                   type: array
 *                   items:
 *                     type: object
 *                 images:
 *                   type: array
 *                   items:
 *                     type: object
 *       404:
 *         description: User not found
 *       401:
 *         description: Unauthorized
 *       500:
 *         description: Internal server error
 */

router.get('/guestReviews', profileController.getGuestReviews);


/**
 * @swagger
 * /api/profile/update_image:
 *   put:
 *     summary: Update user's profile image
 *     tags:
 *       - Profile
 *     consumes:
 *       - multipart/form-data
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             properties:
 *               profile_image:
 *                 type: string
 *                 format: binary
 *     responses:
 *       200:
 *         description: Profile image updated successfully
 *       500:
 *         description: Could not update profile image
 */

router.put('/update_image', upload.single('profile_image'), profileController.updateProfileImage);


/**
 * @swagger
 * /api/profile/profile-image/{userId}:
 *   get:
 *     summary: Get a user's profile image
 *     tags:
 *       - Profile
 *     parameters:
 *       - in: path
 *         name: userId
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID of the user
 *     responses:
 *       200:
 *         description: Image found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                 profile_image:
 *                   type: string
 *                 type:
 *                   type: string
 *                   format: date-time
 *                 uploaded_at:
 *                   type: string
 *                   format: date-time
 *       404:
 *         description: Image not found
 *       500:
 *         description: Internal server error
 */

router.get('/profile-image/:userId', profileController.getProfileImage);

module.exports = router;
