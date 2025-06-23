const { validationResult } = require('express-validator');
const profileService = require('../services/profileService');
const { validateProfileUpdate } = require('../validators/profileValidator');

exports.getDashboard = async (req, res, next) => {
  try {
    const user_id = req.user.userId;
    const user = await profileService.getDashboard(user_id);
    res.json({
      message: "Profile found",
      user: user,
      profile_image: user.images
    });
  } catch (err) {
    next(err);
  }
};

exports.getGuestDashboard = async (req, res, next) => {
  try {
    const user_id = req.query.guestID

    const user = await profileService.getGuestDashboard(user_id);
    if (!user) return res.status(404).json({ error: "User doesn't exist" });
    res.json({
        message: "Profile found",
        first_name : user.first_name,
        last_name : user.last_name,
        gender : user.gender,
        profile_image: user.images
      });
  } catch (err) {
    next(err);
  }
};

exports.updateProfile = async (req, res, next) => {
  try {
    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });
    
    const user_id = req.user.userId;
    const data = req.body;
    const user = await profileService.updateProfile(user_id, data);
    res.json({
      Message: "Profile updated",
      profile: user
    });
  } catch (err) {
    next(err);
  }
};

exports.getReviews = async (req, res, next) => {
  try {
    const user_id = req.user.userId;
    const user = await profileService.getReviews(user_id);
    res.json({
      message: "Reviews fetched successfully",
      reviews: user.reviews,
      images: user.images
    });
  } catch (err) {
    next(err);
  }
};

exports.getGuestReviews = async (req, res, next) => {
  try {
    const user_id = req.query.guestID;
    const user = await profileService.getGuestReviews(user_id);
    res.json({
      message: "Reviews fetched successfully",
      reviews: user.reviews,
      images: user.images
    });
  } catch (err) {
    next(err);
  }
};