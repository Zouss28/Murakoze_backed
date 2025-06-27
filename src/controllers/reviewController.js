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

exports.getInstitutionReviewSummary = async (req, res, next) => {
  const institutionId = parseInt(req.params.id, 10);
  try {
    const result = await reviewService.getInstitutionReviewSummary(institutionId);
    if (result.notFound) {
      return res.status(result.status).json({ error: result.message });
    }
    res.json({ summary: result.summary });
  } catch (err) {
    next(err);
  }
};

exports.toggleReviewReaction = async (req, res, next) => {
  const review_id = parseInt(req.params.review_id);
  const user_id = req.user.userId;
  const { reaction_type_id } = req.body;

  try {
    const result = await reviewService.toggleReviewReaction(review_id, user_id, reaction_type_id);
    if (result.error) {
      return res.status(result.status).json({ error: result.error });
    }
    res.json({ message: result.message });
  } catch (err) {
    next(err);
  }
};

exports.getReviewReactions = async (req, res, next) => {
  const review_id = parseInt(req.params.review_id);
  try {
    const reactions = await reviewService.getReviewReactions(review_id);
    res.json({ reactions });
  } catch (err) {
    next(err);
  }
};

exports.addReviewReply = async (req, res, next) => {
  const review_id = parseInt(req.params.review_id);
  const user_id = req.user.userId;
  const { reply_text, parent_reply_id } = req.body;

  if (!reply_text || !review_id) {
    return res.status(400).json({ error: "Missing reply text or review_id" });
  }

  try {
    const result = await reviewService.addReviewReply(review_id, user_id, reply_text, parent_reply_id);
    if (result.error) {
      return res.status(result.status).json({ error: result.error });
    }
    res.status(201).json({ message: "Reply added", reply: result.reply });
  } catch (err) {
    next(err);
  }
};

exports.getReviewReplies = async (req, res, next) => {
  const review_id = parseInt(req.params.review_id);
  try {
    const replies = await reviewService.getReviewReplies(review_id);
    res.json({ replies });
  } catch (err) {
    next(err);
  }
};

