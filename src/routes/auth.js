const express = require('express');
const router = express.Router();
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { PrismaClient } = require('../generated/prisma');

const prisma = new PrismaClient();
const SECRET_KEY = process.env.JWT_SECRET || 'mysecretkey';

// SIGNUP
router.post('/signup', async (req, res) => {
  const { email, password, first_name,last_name } = req.body;

  const existingUser = await prisma.users_profile.findUnique({ where: { email } });
  if (existingUser) return res.status(400).json({ error: 'User already exists' });

  const hashedPassword = await bcrypt.hash(password, 10);

  const user = await prisma.users_profile.create({
    data: { email, password: hashedPassword, first_name, last_name },
  });

  res.json({ message: 'User created successfully', user: { id: user.id, email: user.email } });
});

// LOGIN
router.post('/login', async (req, res) => {
  const { email, password } = req.body;

  const user = await prisma.users_profile.findUnique({ where: { email } });
  if (!user) return res.status(400).json({ error: 'Invalid email or password' });

  const valid = await bcrypt.compare(password, user.password);
  if (!valid) return res.status(400).json({ error: 'Invalid email or password' });

//   const token = jwt.sign({ userId: user.id }, SECRET_KEY, { expiresIn: '1h' });

  res.json({ message: 'Login successful' });
});

module.exports = router;
