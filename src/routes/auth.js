const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { PrismaClient } = require('../generated/prisma');
const auth = require('../middleware/authMiddleware');

const prisma = new PrismaClient();
const SECRET_KEY = process.env.JWT_SECRET || 'mysecretkey';

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
  const { email, password, first_name,last_name } = req.body;

  const existingUser = await prisma.users_profile.findUnique({ where: { email } });
  if (existingUser) return res.status(400).json({ error: 'User already exists' });

  const hashedPassword = await bcrypt.hash(password, 10);

  const user = await prisma.users_profile.create({
    data: { email, password: hashedPassword, first_name, last_name },
  });
  const accessToken = jwt.sign({ userId: user.id }, SECRET_KEY, { expiresIn: '1h' });

  res.json({ message: 'User created successfully', accessToken });
  }catch(err){
    console.log(err)
    res.status(500).json({ message: 'Internal server error' });
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
  const { email, password } = req.body;

  const user = await prisma.users_profile.findUnique({ where: { email } });
  if (!user) return res.status(400).json({ error: 'Invalid email or password' });

  const valid = await bcrypt.compare(password, user.password);
  if (!valid) return res.status(400).json({ error: 'Invalid email or password' });

  const accessToken = jwt.sign({ userId: user.id }, SECRET_KEY, { expiresIn: '1h' });

  res.json({ message: 'Login successful', accessToken });
});

router.delete('/delete_account', auth, async (req, res) => {
  const userID = req.user.userId;

  try {
    await prisma.users_profile.delete({
      where: { id: userID}
    });


    res.json({
      message:"Account succesfully deleted."
    });
  } catch (error) {
    console.error('Error deleting account:', error);
    res.status(500).json({ error: 'Failed to delete account' });
  }
});

module.exports = router;
