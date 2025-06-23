const prisma = require('../db/prisma');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { sendVerificationEmail } = require('../utils/email');
const { generateToken } = require('../utils/token');
const SECRET_KEY = process.env.JWT_SECRET;

exports.signup = async ({ email, password, first_name, last_name }) => {
  const existingUser = await prisma.users_profile.findUnique({ where: { email } });
  if (existingUser) throw { status: 400, message: 'User already exists' };

  const hashedPassword = await bcrypt.hash(password, 10);
  const verifyToken = generateToken();

  await prisma.users_profile.create({
    data: { email, password: hashedPassword, first_name, last_name, isVerified: false, verifyToken }
  });

  await sendVerificationEmail(email, verifyToken);

  return { message: 'Signup successful. Please check your email to verify your account.' };
};

exports.login = async ({ email, password }) => {
  const user = await prisma.users_profile.findUnique({ where: { email } });
  if (!user || !(await bcrypt.compare(password, user.password)))
    throw { status: 400, message: 'Invalid email or password' };
  if (!user.isVerified) throw { status: 403, message: 'Please verify your email before logging in.' };
  
  const accessToken = jwt.sign({ userId: user.id }, SECRET_KEY, { expiresIn: '1h' });
  return { message: 'Login successful', accessToken };
};

exports.verifyEmail = async (token) => {
  const user = await prisma.users_profile.findFirst({ where: { verifyToken: token } });
  if (!user) throw { status: 400, message: 'Invalid or expired token' };

  await prisma.users_profile.update({
    where: { id: user.id },
    data: { isVerified: true, verifyToken: null }
  });

  const accessToken = jwt.sign({ userId: user.id }, SECRET_KEY, { expiresIn: '1h' });
  return { redirectUrl: `https://murakoze-front-production.up.railway.app/verified?accessToken=${accessToken}` };
};

exports.deleteAccount = async (userId) => {
  await prisma.users_profile.delete({ where: { id: userId } });
};
