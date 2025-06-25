const express = require('express')
const router = express.Router()
const { PrismaClient } = require('../generated/prisma');
const auth = require('../middleware/authMiddleware')
const upload = require('../../uploads');
const allowedReactions = ["helpful", "thanks", "love", "yikes"];
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
router.get('/institution/:id/summary', async (req, res) => {
  const institutionId = parseInt(req.params.id);

  try {
    const institution = await prisma.institution.findUnique({
      where: { id: institutionId },
      include: {
        reviews: {
          where: { is_approved: true },
          select: { review: true }
        }
      }
    });

    if (!institution) {
      return res.status(404).json({ error: 'Institution not found' });
    }

    const reviews = institution.reviews.map(r => r.review).filter(Boolean);

    if (reviews.length === 0) {
      return res.json({ summary: `There are no reviews for ${institution.name} yet.` });
    }

    const sentiment = new Sentiment();
    let positiveKeywords = [];
    let negativeKeywords = [];

    reviews.forEach(text => {
      const result = sentiment.analyze(text);
      const keywords = keyword_extractor.extract(text, {
        language: "english",
        remove_digits: true,
        return_changed_case: true,
        remove_duplicates: false
      });

      if (result.score >= 1) {
        positiveKeywords.push(...keywords);
      } else if (result.score <= -1) {
        negativeKeywords.push(...keywords);
      }
    });

    function getTopKeywords(arr, n = 3) {
      const freq = {};
      arr.forEach(word => {
        if (word.length > 2) {
          freq[word] = (freq[word] || 0) + 1;
        }
      });
      return Object.entries(freq)
        .sort((a, b) => b[1] - a[1])
        .slice(0, n)
        .map(([word]) => word);
    }

    const topPos = getTopKeywords(positiveKeywords);
    const topNeg = getTopKeywords(negativeKeywords);

    let summary = `Customers of '${institution.name}'`;
    if (topPos.length && topNeg.length) {
      summary += ` like ${topPos.join(', ')}, but mention ${topNeg.join(', ')}.`;
    } else if (topPos.length) {
      summary += ` like ${topPos.join(', ')}.`;
    } else if (topNeg.length) {
      summary += ` mention ${topNeg.join(', ')}.`;
    } else {
      summary += ` have mixed opinions.`;
    }

    res.json({ summary });
  } catch (err) {
    console.error('Error generating summary:', err);
    res.status(500).json({ error: 'Something went wrong!' });
  }
});

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
router.post('/:review_id/reaction', auth, async (req, res) => {
  const review_id = parseInt(req.params.review_id);
  const user_id = req.user.userId;
  const { reaction_type_id } = req.body;

  if (!reaction_type_id || isNaN(reaction_type_id)) {
    return res.status(400).json({ error: "reaction_type_id is required and must be an integer." });
  }

  // Check review exists
  const review = await prisma.reviews.findUnique({ where: { id: review_id } });
  if (!review) {
    return res.status(404).json({ error: "Review not found." });
  }

  // Check reaction type exists
  const reactionType = await prisma.reaction_types.findUnique({ where: { id: reaction_type_id } });
  if (!reactionType) {
    return res.status(404).json({ error: "Reaction type not found." });
  }

  // Check if user already has a reaction for this review and type
  const existing = await prisma.review_reactions.findFirst({
    where: {
      review_id,
      user_id,
      reaction_type_id,
    }
  });

  if (existing) {
    // Toggle off if same reaction
    await prisma.review_reactions.delete({
      where: { id: existing.id }
    });
    return res.json({ message: "Reaction removed." });
  } else {
    // No reaction yet, create new
    await prisma.review_reactions.create({
      data: { review_id, user_id, reaction_type_id }
    });
    return res.json({ message: "Reaction added." });
  }
});

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
router.get('/:review_id/reactions', async (req, res) => {
  const review_id = parseInt(req.params.review_id);

  // Get all reaction types
  const reactionTypes = await prisma.reaction_types.findMany({
    select: { id: true, name: true, icon: true }
  });

  // Get counts for each reaction type
  const reactions = await prisma.review_reactions.groupBy({
    by: ['reaction_type_id'],
    where: { review_id },
    _count: { reaction_type_id: true }
  });

  // Format as array of { id, name, icon, count }
  const result = reactionTypes.map(rt => {
    const found = reactions.find(r => r.reaction_type_id === rt.id);
    return {
      id: rt.id,
      name: rt.name,
      icon: rt.icon,
      count: found ? found._count.reaction_type_id : 0
    };
  });

  res.json({ reactions: result });
});



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

router.post('/:review_id/reply', auth, async (req, res) => {
  const review_id = parseInt(req.params.review_id);
  const user_id = req.user.userId;
  const { reply_text, parent_reply_id } = req.body;

  if (!reply_text || !review_id) {
    return res.status(400).json({ error: "Missing reply text or review_id" });
  }

  try {
    // Ensure review exists
    const review = await prisma.reviews.findUnique({ where: { id: review_id } });
    if (!review) return res.status(404).json({ error: "Review not found" });

    // Optionally, check parent_reply_id exists if provided
    if (parent_reply_id) {
      const parent = await prisma.review_replies.findUnique({ where: { id: parent_reply_id } });
      if (!parent) return res.status(400).json({ error: "Parent reply not found" });
    }

    const reply = await prisma.review_replies.create({
      data: {
        review_id,
        user_id,
        reply_text,
        parent_reply_id: parent_reply_id || null,
      },
    });

    res.status(201).json({ message: "Reply added", reply });
  } catch (err) {
    console.error("Error adding reply:", err);
    res.status(500).json({ error: "Something went wrong!" });
  }
});

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
router.get('/:review_id/replies', async (req, res) => {
  const review_id = parseInt(req.params.review_id);

  try {
    const replies = await prisma.review_replies.findMany({
      where: { review_id },
      include: {
        user: {
          select: { id: true, first_name: true, last_name: true, email: true, images: true }
        },
        child_replies: true, // For nested replies
      },
      orderBy: { created_at: 'asc' },
    });

    res.json({ replies });
  } catch (err) {
    console.error("Error fetching replies:", err);
    res.status(500).json({ error: "Something went wrong!" });
  }
});



module.exports = router;