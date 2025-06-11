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
  const institutions = await prisma.institution.findMany();
  const result = institutions.map(inst =>{
    return{
      id: inst.id,
      name : inst.name
    }
  });
  res.json({
    institutions : result
  })
})

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
 *     summary: Get top 3 most recent reviews with user profiles
 *     tags:
 *       - Reviews
 *     responses:
 *       200:
 *         description: Recent reviews fetched successfully
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
 *                       review:
 *                         type: string
 *                       rating:
 *                         type: integer
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
 *       500:
 *         description: Internal server error
 */

router.get('/recent', async (req, res) => {
    try {
      const reviews = await prisma.reviews.findMany({
        where :{
          is_approved: true
        },
        include: {
          images: true
        },
        orderBy: {
          created_at: 'desc'
        },
        take: 3
      });
  
      // Get all unique user_ids from the reviews
      const userIds = [...new Set(reviews.map(r => r.user_id))];
  
      // Fetch user profiles (and their images) for those user_ids
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
 * /api/review/institution/{id}:
 *   get:
 *     summary: Get reviews for a specific institution with optional rating filter
 *     tags:
 *       - Reviews
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: Institution ID
 *       - in: query
 *         name: rating
 *         schema:
 *           type: integer
 *           enum: [1, 2, 3, 4, 5]
 *         description: Filter reviews by star rating (optional)
 *     responses:
 *       200:
 *         description: Reviews retrieved successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 institution_id:
 *                   type: integer
 *                 reviews:
 *                   type: array
 *                   items:
 *                     type: object
 *                     properties:
 *                       id:
 *                         type: integer
 *                       rating:
 *                         type: integer
 *                       review:
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
 *                             image_url:
 *                               type: string
 *       404:
 *         description: Institution not found
 *       500:
 *         description: Internal server error
 */

router.get('/institution/:id', async (req, res) => {
  const institutionId = parseInt(req.params.id);
  const rating = req.query.rating ? parseInt(req.query.rating) : null;

  try {
    const institution = await prisma.institution.findUnique({
      where: { id: institutionId },
      include: {
        reviews: {
          where: {
            is_approved: true,
            ...(rating && { rating })
          },
          include: {
            images: true,
            users_profile: {
              select: {
                id: true,
                first_name: true,
                last_name: true,
                email: true,
                images: true
              }
            }
          },
          orderBy: {
            created_at: 'desc'
          }
        }
      }
    });

    if (!institution) {
      return res.status(404).json({ error: 'Institution not found' });
    }

    res.json({
      institution_id: institution.id,
      reviews: institution.reviews
    });
  } catch (err) {
    console.error('Error fetching institution reviews:', err);
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