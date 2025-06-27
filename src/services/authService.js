const prisma = require('../db/prisma');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const { sendVerificationEmail } = require('../utils/email');
const { generateToken } = require('../utils/token');
const SECRET_KEY = process.env.JWT_SECRET;
const REFRESH_TOKEN_SECRET = process.env.REFRESH_TOKEN_SECRET;

function generateAccessToken(payload) {
  return jwt.sign(payload, SECRET_KEY, { expiresIn: '15m' });
}
function generateRefreshToken(payload) {
  return jwt.sign(payload, REFRESH_TOKEN_SECRET, { expiresIn: '7d' });
}

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
  
  const accessToken = generateAccessToken({ userId: user.id });
  const refreshToken = generateRefreshToken({ userId: user.id });

  await prisma.users_profile.update({
    where: { id: user.id },
    data: { refreshToken }
  });

  return { message: 'Login successful', accessToken, refreshToken };
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

exports.refresh = async (refreshToken) => {
  if (!refreshToken) throw { status: 401, message: 'No refresh token' };
  let payload;
  try {
    payload = jwt.verify(refreshToken, REFRESH_TOKEN_SECRET);
  } catch {
    throw { status: 403, message: 'Invalid or expired refresh token' };
  }
  const user = await prisma.users_profile.findUnique({ where: { id: payload.userId } });
  if (!user || user.refreshToken !== refreshToken) {
    throw { status: 403, message: 'Invalid refresh token' };
  }
  const newAccessToken = generateAccessToken({ userId: user.id });
  const newRefreshToken = generateRefreshToken({ userId: user.id });
  await prisma.users_profile.update({
    where: { id: user.id },
    data: { refreshToken: newRefreshToken }
  });
  return { accessToken: newAccessToken, refreshToken: newRefreshToken };
};

exports.logout = async (refreshToken) => {
  if (!refreshToken) return;
  try {
    const payload = jwt.verify(refreshToken, REFRESH_TOKEN_SECRET);
    await prisma.users_profile.update({
      where: { id: payload.userId },
      data: { refreshToken: null }
    });
  } catch (e) {}
};
