const express = require('express')
const router = express.Router()
const { PrismaClient } = require('../generated/prisma');
const auth = require('../middleware/authMiddleware')
const upload = require('../../uploads');
const Filter = require('bad-words');


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

router.get("/institution",async (req,res)=>{
  const institutions = await prisma.institution.findMany({
    include : {
      service_group : true
    }
  });
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
    institutions : result
  })
})


/**
 * @swagger
 * /api/review/serviceRating:
 *   get:
 *     summary: Submit a service rating and emotional feedback
 *     tags:
 *       - Reviews
 *     description: Authenticated users can rate a service and provide emotional feedback.
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: query
 *         name: service_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID of the service being rated
 *       - in: query
 *         name: rating
 *         required: true
 *         schema:
 *           type: number
 *           minimum: 1
 *           maximum: 10
 *         description: Numerical rating for the service
 *       - in: query
 *         name: emorating
 *         required: true
 *         schema:
 *           type: string
 *           enum: [happy, satisfied, unhappy]
 *         description: Emotional state associated with the rating
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
 *       400:
 *         description: Invalid input
 *       500:
 *         description: Internal server error
 */

router.get("/serviceRating", auth, async (req, res) => {
  try {
    const { emorating, service_id, rating } = req.query;

    const ratingExplained = { happy: 'Happy', satisfied: 'Satisfied', unhappy: 'Unhappy' };

    if (!service_id) {
      return res.status(400).json({ message: "No service ID provided!" });
    }

    if (!(emorating in ratingExplained)) {
      return res.status(400).json({ message: "Invalid emorating provided!" });
    }

    await prisma.serviceReview.create({
      data: {
        user_id: req.user.userId,
        service_id: parseInt(service_id),
        emoRating: ratingExplained[emorating],
        rating: parseFloat(rating),
      },
    });

    return res.json({ message: "Survey submitted" });
  } catch (err) {
    console.error("Error during service rating:", err);
    res.status(500).json({ error: "Something went wrong!" });
  }
});

/**
 * @swagger
 * /api/review/{ist_id}:
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
 *         name: ist_id
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

router.post('/:ist_id', auth, upload.single('profile_image'), async (req, res) => {
  const institution_id = parseInt(req.params.ist_id);
  const user_id = req.user.userId;

  const imagePath = req.file?.path;
  const imageType = req.file?.mimetype;

  if (!imagePath || !imageType) {
    return res.status(400).json({ error: 'Image upload failed or image missing' });
  }

  const imageExtension = imageType.split('/')[1];

  try {
    const { rating, review } = req.body;

    const institution = await prisma.institution.findUnique({
      where: { id: institution_id },
    });

    if (!institution) {
      return res.status(400).json({ error: "Institution doesn't exist" });
    }

    // Create review
    const filter = new Filter();
    const createdReview = await prisma.reviews.create({
      data: {
        user_id,
        institution_id,
        rating: parseInt(rating),
        review,
        is_approved: !filter.isProfane(review) 
      },
    });

    // Attach image to the review
    const createdImage = await prisma.images.create({
      data: {
        image_url: imagePath,
        type: imageExtension,
        reviews: {
          connect: { id: createdReview.id },
        },
      },
    });

    return res.status(201).json({
      message: 'Review created successfully',
      review: {
        ...createdReview,
        image: createdImage.image_url,
      },
    });
  } catch (err) {
    console.error('Error:', err);
    res.status(500).json({ error: 'Something went wrong!' });
  }
});

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

router.get('/recent', async (req, res) => {
    try {
      const page = parseInt(req.query.page) || 1;
      const reviews = await prisma.reviews.findMany({
        where :{
          is_approved: true
        },
        include: {
          images: true,
          institution:{
            select :{
              name : true
            }
          }
        },
        orderBy: {
          created_at: 'desc'
        },
        take: 3 * page
      });
  
      // Get all unique user_ids from the reviews
      const userIds = [...new Set(reviews.map(r => r.user_id))];
  
      const users = await prisma.users_profile.findMany({
        where: {
          id: { in: userIds }
        },
        include: {
          images: true
        }
      });
  
      // Combine review + user profile
      const enrichedReviews = reviews.map(review => {
        const user = users.find(u => u.id === review.user_id);
        return {
          ...review,
          user: {
            id: user.id,
            first_name: user.first_name,
            last_name: user.last_name,
            email: user.email,
            profile: user.images
          }
        };
      });
  
      res.json({
        message: "Top 3 recent reviews fetched successfully",
        reviews: enrichedReviews
      });
  
    } catch (err) {
      console.log("Error:", err);
      res.status(500).json({ error: 'Something went wrong!' });
    }
  });
  
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
router.get("/Q&A", auth, async (req, res) => {
  try {
    const service_id = parseInt(req.query.service_id);
    if (!service_id) return res.status(400).json({ message: "Missing service_id" });

    const questionInstance = await prisma.surveyQuestions.findMany({
      where: { service_id },
    });

    const questions = questionInstance.map((q) => ({
      id: q.id,
      question: q.question,
      choices: q.choices,
    }));

    return res.json({ message: "Q&A retrieved!", questions });
  } catch (err) {
    console.log("Error:", err);
    res.status(500).json({ error: "Something went wrong with the QA!" });
  }
});


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
router.post("/Q&A/post", auth, async (req, res) => {
  try {
    const user_id = req.user.userId;
    const { answers } = req.body;

    if (!Array.isArray(answers) || answers.length === 0) {
      return res.status(400).json({ message: "Answers must be a non-empty array." });
    }

    const answerData = answers.map(({ question_id, answer, scale_rating }) => ({
      question_id,
      user_id,
      answer,
      scale_rating,
    }));

    await prisma.surveyAnswers.createMany({ data: answerData });

    return res.json({ message: "Survey submitted" });
  } catch (err) {
    console.log("Error:", err);
    res.status(500).json({ error: "Something went wrong with the QA!" });
  }
});



module.exports = router;