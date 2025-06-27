const express = require('express')
const router = express.Router()
const { PrismaClient } = require('../generated/prisma');
const auth = require('../middleware/authMiddleware')
const upload = require('../../uploads');
const reviewController = require('../controllers/reviewController');
const reviewValidator = require('../validators/reviewValidator');

const prisma = new PrismaClient();

/**
 * @swagger
 * tags:
 *   name: Reviews
 *   description: Reviews-related endpoints
 */

/**
 * @swagger
 * /api/review/institution:
 *   get:
 *     summary: Get all institutions
 *     tags:
 *       - Reviews
 *     responses:
 *       200:
 *         description: Successfully retrieved list of institutions
 *         content:
 *           application/json:
 *             schema:
 *               type: array
 *               items:
 *                 type: object
 *                 properties:
 *                   id:
 *                     type: integer
 *                     example: 1
 *                   name:
 *                     type: string
 *                     example: Institution Name
 *       500:
 *         description: Internal server error
 */
router.get("/institution", reviewController.getInstitutionToReview);

/**
 * @swagger
 * /api/review/serviceRating:
 *   post:
 *     summary: Submit a service rating and emotional feedback
 *     tags:
 *       - Reviews
 *     description: Authenticated users can rate a service and provide emotional feedback.
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - rating
 *               - emoRating
 *             properties:
 *               rating:
 *                 type: number
 *                 minimum: 1
 *                 maximum: 10
 *                 description: Numerical rating for the service
 *               emoRating:
 *                 type: string
 *                 enum: [happy, satisfied, unhappy]
 *                 description: Emotional state associated with the rating
 *     parameters:
 *       - in: query
 *         name: service_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID of the service being rated
 *     responses:
 *       200:
 *         description: Rating submitted successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                 serviceRating:
 *                   type: object
 *       400:
 *         description: Invalid input
 *       500:
 *         description: Internal server error
 */
router.post("/serviceRating", auth, reviewController.createServiceRating);

/**
 * @swagger
 * /api/review/{inst_id}:
 *   post:
 *     summary: Submit a review for an institution with an image
 *     tags:
 *       - Reviews
 *     security:
 *       - bearerAuth: []
 *     consumes:
 *       - multipart/form-data
 *     parameters:
 *       - in: path
 *         name: inst_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: Institution ID
 *     requestBody:
 *       required: true
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             required:
 *               - profile_image
 *               - rating
 *               - review
 *             properties:
 *               profile_image:
 *                 type: string
 *                 format: binary
 *               rating:
 *                 type: integer
 *               review:
 *                 type: string
 *     responses:
 *       201:
 *         description: Review created successfully
 *       400:
 *         description: Image missing or Institution not found
 *       500:
 *         description: Internal server error
 */
router.post('/:inst_id', auth, upload.single('profile_image'), reviewValidator.validateReview, reviewController.createReview);

/**
 * @swagger
 * /api/review/recent:
 *   get:
 *     summary: Get recent approved reviews
 *     description: Fetches the most recent approved reviews along with their associated user profiles and images. Returns 3 * page number of reviews, ordered by creation date descending.
 *     tags:
 *       - Reviews
 *     parameters:
 *       - in: query
 *         name: page
 *         schema:
 *           type: integer
 *           default: 1
 *         description: Page number to determine how many reviews to fetch (3 per page).
 *     responses:
 *       200:
 *         description: A list of recent approved reviews with user info
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Top 3 recent reviews fetched successfully
 *                 reviews:
 *                   type: array
 *                   items:
 *                     type: object
 *                     properties:
 *                       id:
 *                         type: integer
 *                       title:
 *                         type: string
 *                       content:
 *                         type: string
 *                       is_approved:
 *                         type: boolean
 *                       created_at:
 *                         type: string
 *                         format: date-time
 *                       images:
 *                         type: array
 *                         items:
 *                           type: object
 *                           properties:
 *                             id:
 *                               type: integer
 *                             image_url:
 *                               type: string
 *                       user:
 *                         type: object
 *                         properties:
 *                           id:
 *                             type: integer
 *                           first_name:
 *                             type: string
 *                           last_name:
 *                             type: string
 *                           email:
 *                             type: string
 *                           profile:
 *                             type: array
 *                             items:
 *                               type: object
 *                               properties:
 *                                 id:
 *                                   type: integer
 *                                 image_url:
 *                                   type: string
 *       500:
 *         description: Server error
 */
router.get('/recent', reviewController.getRecentReviews);

/**
 * @swagger
 * /api/review/institution/{inst_id}:
 *   get:
 *     summary: Get institution reviews
 *     description: Fetches all approved reviews for a specific institution, with optional filters by rating or review ID.
 *     tags:
 *       - Institutions
 *     parameters:
 *       - in: path
 *         name: inst_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID of the institution
 *       - in: query
 *         name: rating
 *         schema:
 *           type: integer
 *         description: Filter reviews by exact rating value (e.g. 4)
 *       - in: query
 *         name: review_id
 *         schema:
 *           type: integer
 *         description: Filter by a specific review ID
 *     responses:
 *       200:
 *         description: List of filtered and approved reviews for the institution
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                 reviews:
 *                   type: array
 *                   items:
 *                     type: object
 *                     properties:
 *                       id:
 *                         type: integer
 *                       rating:
 *                         type: number
 *                         format: float
 *                       review_text:
 *                         type: string
 *                       created_at:
 *                         type: string
 *                         format: date-time
 *                       images:
 *                         type: array
 *                         items:
 *                           type: object
 *                           properties:
 *                             id:
 *                               type: integer
 *                             image_url:
 *                               type: string
 *                       users_profile:
 *                         type: object
 *                         properties:
 *                           id:
 *                             type: integer
 *                           first_name:
 *                             type: string
 *                           last_name:
 *                             type: string
 *                           email:
 *                             type: string
 *                           images:
 *                             type: array
 *                             items:
 *                               type: object
 *                               properties:
 *                                 id:
 *                                   type: integer
 *                                 image_url:
 *                                   type: string
 *       404:
 *         description: Institution or matching review not found
 *       500:
 *         description: Internal server error
 */
router.get('/institution/:inst_id', reviewController.getInstitutionReviews);


/**
 * @swagger
 * /api/review/Q&A:
 *   get:
 *     summary: Get all survey questions for a given service
 *     description: Authenticated user retrieves questions and choices for a service.
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: query
 *         name: service_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID of the service
 *     responses:
 *       200:
 *         description: List of questions retrieved
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                 questions:
 *                   type: array
 *                   items:
 *                     type: object
 *                     properties:
 *                       id:
 *                         type: integer
 *                       question:
 *                         type: string
 *                       choices:
 *                         type: array
 *                         items:
 *                           type: string
 */
router.get("/Q&A", reviewController.getQandA);


/**
 * @swagger
 * /api/review/Q&A/post:
 *   post:
 *     summary: Submit answers to multiple survey questions
 *     description: Authenticated user submits responses to questions.
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               answers:
 *                 type: array
 *                 items:
 *                   type: object
 *                   required: [question_id, answer]
 *                   properties:
 *                     question_id:
 *                       type: integer
 *                     answer:
 *                       type: string
 *                     scale_rating:
 *                       type: number
 *     responses:
 *       200:
 *         description: Answers submitted successfully
 *       500:
 *         description: Internal server error
 */
router.post("/Q&A/post", auth, reviewController.createQandA);

/**
 * @swagger
 * /api/review/institution/{id}/summary:
 *   get:
 *     summary: Get a summarized version of all reviews for an institution
 *     tags:
 *       - Reviews
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: Institution ID
 *     responses:
 *       200:
 *         description: Summary generated successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 summary:
 *                   type: string
 *       404:
 *         description: Institution not found
 *       500:
 *         description: Internal server error
 */
router.get('/institution/:id/summary', reviewController.getInstitutionReviewSummary);

/**
 * @swagger
 * /api/review/{review_id}/reaction:
 *   post:
 *     summary: Add or remove a reaction to a review (by reaction_type_id)
 *     tags:
 *       - Reviews
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: review_id
 *         required: true
 *         schema:
 *           type: integer
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               reaction_type_id:
 *                 type: integer
 *                 example: 1
 *     responses:
 *       200:
 *         description: Reaction toggled
 *       400:
 *         description: Invalid input
 *       404:
 *         description: Review or reaction type not found
 *       500:
 *         description: Internal server error
 */
router.post('/:review_id/reaction', auth, reviewController.toggleReviewReaction);

/**
 * @swagger
 * /api/review/{review_id}/reactions:
 *   get:
 *     summary: Get reaction counts and icons for a review
 *     tags:
 *       - Reviews
 *     parameters:
 *       - in: path
 *         name: review_id
 *         required: true
 *         schema:
 *           type: integer
 *     responses:
 *       200:
 *         description: Reaction counts and icons
 */
router.get('/:review_id/reactions', reviewController.getReviewReactions);

/**
 * @swagger
 * /api/review/{review_id}/reply:
 *   post:
 *     summary: Add a reply to a review or to another reply (threaded)
 *     tags: [Reviews]
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: path
 *         name: review_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID of the review to reply to
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             required:
 *               - reply_text
 *             properties:
 *               reply_text:
 *                 type: string
 *                 example: Thank you for your feedback!
 *               parent_reply_id:
 *                 type: integer
 *                 nullable: true
 *                 description: >
 *                   (Optional) The ID of the parent reply if replying to another reply.
 *                   For a direct reply to the review, omit this field or set it to null.
 *           examples:
 *             DirectReply:
 *               summary: Direct reply to review
 *               value:
 *                 reply_text: "Thank you for your feedback!"
 *             NestedReply:
 *               summary: Reply to another reply
 *               value:
 *                 reply_text: "I agree with you!"
 *                 parent_reply_id: 5
 *     responses:
 *       201:
 *         description: Reply added
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                 reply:
 *                   $ref: '#/components/schemas/ReviewReply'
 *       400:
 *         description: Missing reply text or review_id
 *       404:
 *         description: Review not found
 *       500:
 *         description: Internal server error
 */
router.post('/:review_id/reply', auth, reviewController.addReviewReply);

/**
 * @swagger
 * /api/review/{review_id}/replies:
 *   get:
 *     summary: Get all replies for a review
 *     tags: [Reviews]
 *     parameters:
 *       - in: path
 *         name: review_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID of the review
 *     responses:
 *       200:
 *         description: List of replies
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 replies:
 *                   type: array
 *                   items:
 *                     $ref: '#/components/schemas/ReviewReply'
 *       500:
 *         description: Internal server error
 */
router.get('/:review_id/replies', reviewController.getReviewReplies);



module.exports = router;