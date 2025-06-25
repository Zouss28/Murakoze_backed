const reviewService = require('../services/reviewService');
const { validationResult } = require('express-validator');

exports.getInstitutionToReview = async (req, res, next) => {
  try { 
    const institutions = await reviewService.institutionToReview();
    const result = institutions.map(inst =>{
      return{
        id: inst.id,
        name : inst.name,
        services : inst.service_group ? inst.service_group.map(service => ({name : service.name,
          id:service.id
        })) : ""
      }
    });
    res.json({
      message: "Institutions fetched successfully",
      institutions: result
    });
  } catch (err) {
    next(err);
  }
};

exports.createReview = async (req, res, next) => {
  try {
    const user_id = parseInt(req.user.userId);
    const institution_id = parseInt(req.params.inst_id);
    const rating = parseInt(req.body.rating);
    const review = req.body.review;
    const image = req.file.path;
    const imageExtension = req.file.mimetype.split('/')[1];

    const errors = validationResult(req);
    if (!errors.isEmpty()) return res.status(400).json({ errors: errors.array() });

    const { newReview, newImage } = await reviewService.createReview(review, image, imageExtension, rating, user_id, institution_id);
    res.status(201).json({
      message: "Review created successfully",
      review: newReview,
      image: newImage
    });
  } catch (err) {
    next(err);
  }
};

exports.getRecentReviews = async (req, res, next) => {
  try {
    const page = parseInt(req.query.page) || 1;
    const reviews = await reviewService.getRecentReviews(page);

    res.json({
      message: "Recent reviews fetched successfully",
      reviews: reviews
    });
  } catch (err) {
    next(err);
  }
};

exports.createServiceRating = async (req, res, next) => {
  try {
    const service_id = parseInt(req.query.service_id);
    const rating = parseFloat(req.body.rating);
    const user_id = parseInt(req.user.userId);
    const emoRating = req.body.emoRating;
    const serviceRating = await reviewService.createServiceRating(service_id, rating, user_id, emoRating);
    res.json({
      message: "Service rating created successfully",
      serviceRating: serviceRating
    });
  } catch (err) {
    next(err);
  }
};

exports.getInstitutionReviews = async (req, res, next) => {
  try {
    const institution_id = parseInt(req.params.inst_id);
    const rating = parseInt(req.query.rating) || undefined;
    const reviewId = parseInt(req.query.review_id) || undefined;
    const reviewWhere = {
      institution_id: institution_id,
      is_approved: true,
      ...(typeof rating === 'number' && !isNaN(rating) ? { rating } : {}),
      ...(typeof reviewId === 'number' && !isNaN(reviewId) ? { id: reviewId } : {})
    };
    const reviews = await reviewService.getInstitutionReviews(reviewWhere);
    res.json({
      message: "Institution reviews fetched successfully",
      reviews: reviews
    });
  } catch (err) {
    next(err);
  }
}

exports.getQandA = async (req, res, next) => {
  try {
    const service_id = parseInt(req.query.service_id);
    const questionInstance = await reviewService.getQandA(service_id);
    const questions = questionInstance.map((q) => ({
      id: q.id,
      question: q.question,
      choices: q.choices,
    }));
    res.json({
      message: "Q&A fetched successfully",
      questions: questions
    });
  } catch (err) {
    next(err);
  }
}

exports.createQandA = async (req, res, next) => {
  try {
    const user_id = parseInt(req.user.userId);
    const {answers} = req.body;
    const answerData = answers.map(({ question_id, answer, scale_rating }) => ({
      question_id,
      user_id,
      answer,
      scale_rating,
    }));
    await reviewService.createQandA(answerData);
    res.json({
      message: "Q&A created successfully"
    });
  } catch (err) {
    next(err);
  }
}