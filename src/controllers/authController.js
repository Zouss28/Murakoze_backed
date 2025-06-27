const authService = require('../services/authService');
const {validationResult} = require('express-validator')

exports.signup = async (req, res, next) => {
  try {
    const error = validationResult(req);
    if(!error.isEmpty()){
      return res.status(400).json({errors:error.array()})
    }
    const result = await authService.signup(req.body);
    res.json(result);
  } catch (err) {
    next(err);
  }
};

exports.login = async (req, res, next) => {
  try {
    const error = validationResult(req);
    if(!error.isEmpty()){
      return res.status(400).json({errors:error.array()})
    }
    const result = await authService.login(req.body);
    res.cookie('refreshToken', result.refreshToken, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'strict',
      maxAge: 7 * 24 * 60 * 60 * 1000
    });
    res.json({ message: result.message, accessToken: result.accessToken });
  } catch (err) {
    console.log(err);
    next(err);
  }
};

exports.verifyEmail = async (req, res, next) => {
  try {
    const result = await authService.verifyEmail(req.query.token);
    res.redirect(result.redirectUrl);
  } catch (err) {
    next(err);
  }
};

exports.deleteAccount = async (req, res, next) => {
  try {
    const userId = req.user.userId;
    await authService.deleteAccount(userId);
    res.json({ message: 'Account deleted successfully' });
  } catch (err) {
    next(err);
  }
};

exports.refresh = async (req, res, next) => {
  try {
    const refreshToken = req.cookies.refreshToken;
    const result = await authService.refresh(refreshToken);
    res.cookie('refreshToken', result.refreshToken, {
      httpOnly: true,
      secure: process.env.NODE_ENV === 'production',
      sameSite: 'strict',
      maxAge: 7 * 24 * 60 * 60 * 1000
    });
    res.json({ accessToken: result.accessToken });
  } catch (err) {
    next(err);
  }
};

exports.logout = async (req, res, next) => {
  try {
    const refreshToken = req.cookies.refreshToken;
    await authService.logout(refreshToken);
    res.clearCookie('refreshToken');
    res.json({ message: 'Logged out' });
  } catch (err) {
    next(err);
  }
};
