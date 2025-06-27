const googleAuthService = require('../services/googleAuthService');

exports.googleCallback = async (req, res, next) => {
  try {
    const user = await googleAuthService.findOrCreateGoogleUser(req.user);
    const tokens = await googleAuthService.generateTokensForGoogleUser(user);

    // Set refresh token as httpOnly cookie
    res.cookie('refreshToken', tokens.refreshToken, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'strict',
      maxAge: 7 * 24 * 60 * 60 * 1000
    });

    // Redirect to frontend with access token
    const redirectUrl = `${process.env.FRONTEND_URL}auth/google-success?accessToken=${tokens.accessToken}`;
    res.redirect(redirectUrl);
  } catch (err) {
    next(err);
  }
};