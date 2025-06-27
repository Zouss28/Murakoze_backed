const prisma = require('../db/prisma');
const jwt = require('jsonwebtoken');

exports.findOrCreateGoogleUser = async (googleProfile) => {
  const { id: googleId, emails, name } = googleProfile;
  
  // Check if user exists with this Google ID
  let user = await prisma.users_profile.findFirst({
    where: { googleId }
  });

  if (!user) {
    // Check if user exists with this email
    const email = emails[0].value;
    user = await prisma.users_profile.findUnique({
      where: { email }
    });

    if (user) {
      // Link existing account to Google
      user = await prisma.users_profile.update({
        where: { id: user.id },
        data: { googleId }
      });
    } else {
      // Create new user
      user = await prisma.users_profile.create({
        data: {
          email,
          first_name: name.givenName || '',
          last_name: name.familyName || '',
          googleId,
          isVerified: true, // Google users are pre-verified
          password: null // No password for Google users
        }
      });
    }
  }

  return user;
};

exports.generateTokensForGoogleUser = async (user) => {
  const accessToken = jwt.sign(
    { userId: user.id }, 
    process.env.JWT_SECRET, 
    { expiresIn: '15m' }
  );
  
  const refreshToken = jwt.sign(
    { userId: user.id }, 
    process.env.REFRESH_TOKEN_SECRET, 
    { expiresIn: '7d' }
  );

  // Store refresh token
  await prisma.users_profile.update({
    where: { id: user.id },
    data: { refreshToken }
  });

  return { accessToken, refreshToken };
};
