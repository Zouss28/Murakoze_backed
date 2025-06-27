const express = require('express');
const router = express.Router();
const auth = require('../middleware/authMiddleware');
const authController = require('../controllers/authController');
const { validateSignup, validateLogin } = require('../validators/authValidator');
const cookieParser = require('cookie-parser');

router.use(cookieParser());

/**
 * @swagger
 * /api/auth/signup:
 *   post:
 *     summary: Register a new user
 *     tags:
 *       - Auth
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - email
 *               - password
 *               - first_name
 *               - last_name
 *             properties:
 *               email:
 *                 type: string
 *                 format: email
 *               password:
 *                 type: string
 *                 format: password
 *               first_name:
 *                 type: string
 *               last_name:
 *                 type: string
 *     responses:
 *       200:
 *         description: User created successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: User created successfully
 *                 accessToken:
 *                   type: string
 *       400:
 *         description: User already exists
 *       500:
 *         description: Internal server error
 */

router.post('/signup', validateSignup, authController.signup);

router.get('/verify-email', authController.verifyEmail);
/**
 * @swagger
 * /api/auth/login:
 *   post:
 *     summary: Login user and get access token
 *     tags:
 *       - Auth
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - email
 *               - password
 *             properties:
 *               email:
 *                 type: string
 *                 format: email
 *               password:
 *                 type: string
 *                 format: password
 *     responses:
 *       200:
 *         description: Login successful
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Login successful
 *                 accessToken:
 *                   type: string
 *       400:
 *         description: Invalid email or password
 *       500:
 *         description: Internal server error
 */

router.post('/login', validateLogin, authController.login);
/**
 * @swagger
 * /api/auth/delete-account:
 *   delete:
 *     summary: Delete the authenticated user's account
 *     tags:
 *       - Auth
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Account deleted successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Account deleted successfully
 *       401:
 *         description: Unauthorized
 *       500:
 *         description: Internal server error
 */
router.delete('/delete-account', auth, authController.deleteAccount);

router.post('/refresh', authController.refresh);
router.post('/logout', authController.logout);

module.exports = router;
