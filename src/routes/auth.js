const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { PrismaClient } = require('../generated/prisma');
const auth = require('../middleware/authMiddleware');
const crypto = require('crypto');
const prisma = new PrismaClient();
const SECRET_KEY = process.env.JWT_SECRET || 'mysecretkey';
const nodemailer = require('nodemailer');
const fs = require('fs');
const path = require('path');

async function sendVerificationEmail(email, token) {
  const transporter = nodemailer.createTransport({
  service: "gmail",
  auth: {
    user: process.env.EMAIL,
    pass: process.env.EMAIL_PASS,
  },
});

  const verifyUrl = `http://murakozebacked-production.up.railway.app/api/auth/verify-email?token=${token}`;
  const templatePath = path.join(__dirname, '../templates/verify_email.html');
  let htmlTemplate = fs.readFileSync(templatePath, 'utf-8');
  htmlTemplate = htmlTemplate.replaceAll('{{verifyUrl}}', verifyUrl);

  await transporter.sendMail({
    to: email,
    subject: 'Verify your email',
    html: htmlTemplate,
  });
}
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

router.post('/signup', async (req, res) => {
  try {
    const { email, password, first_name, last_name } = req.body;

    const existingUser = await prisma.users_profile.findUnique({ where: { email } });
    if (existingUser) return res.status(400).json({ error: 'User already exists' });

    const hashedPassword = await bcrypt.hash(password, 10);
    const verifyToken = crypto.randomBytes(32).toString('hex');

    const user = await prisma.users_profile.create({
      data: {
        email,
        password: hashedPassword,
        first_name,
        last_name,
        isVerified: false,
        verifyToken,
      },
    });

    await sendVerificationEmail(email, verifyToken);

    res.json({ message: 'Signup successful. Please check your email to verify your account.' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  }
});

router.get('/verify-email', async (req, res) => {
  try {
    const { token } = req.query;
    if (!token) return res.status(400).json({ error: 'Missing token' });

    const user = await prisma.users_profile.findFirst({ where: { verifyToken: token } });
    if (!user) return res.status(400).json({ error: 'Invalid or expired token' });

    await prisma.users_profile.update({
      where: { id: user.id },
      data: { isVerified: true, verifyToken: null },
    });
    const accessToken = jwt.sign({ userId: user.id }, SECRET_KEY, { expiresIn: '1h' });
    res.redirect(`https://murakoze-front-production.up.railway.app/verified?accessToken=${accessToken}`);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Verification failed' });
  }
});
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

router.post('/login', async (req, res) => {
  try {
    const { email, password } = req.body;

    const user = await prisma.users_profile.findUnique({ where: { email } });
    if (!user || !(await bcrypt.compare(password, user.password))) {
      return res.status(400).json({ error: 'Invalid email or password' });
    }

    if (!user.isVerified) {
      return res.status(403).json({ error: 'Please verify your email before logging in.' });
    }

    const accessToken = jwt.sign({ userId: user.id }, SECRET_KEY, { expiresIn: '1h' });

    res.json({ message: 'Login successful', accessToken });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Internal server error' });
  }
});
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
router.delete('/delete-account', auth, async (req, res) => {
  try {
    const userId = req.user.userId;

    // await prisma.users_profile.update({
    //   where: { id: userId },
    //   data: { isDeleted: true },
    // });

    await prisma.users_profile.delete({
      where: { id: userId },
    });

    res.json({ message: 'Account deleted successfully' });
  } catch (err) {
    console.error('Error deleting account:', err);
    res.status(500).json({ error: 'Internal server error' });
  }
});


module.exports = router;
