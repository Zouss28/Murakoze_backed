const express = require('express')
const router = express.Router()
const { PrismaClient } = require('../generated/prisma');
const auth = require('../middleware/authMiddleware')
const upload = require('../../uploads')


const prisma = new PrismaClient();

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
    const createdReview = await prisma.reviews.create({
      data: {
        user_id,
        institution_id,
        rating: parseInt(rating),
        review,
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
  


// router.get('/list', async (req, res)=>{
//     response = {
//         'user':"user_name",
//         inistitute_image,
//         review

//     }
// })

// const login = async () => {
//     const res = await fetch(`${API}/login`, {
//       method: 'POST',
//       headers: { 'Content-Type': 'application/json' },
//       credentials: 'include',
//       body: JSON.stringify({ email, password })
//     });

//     const data = await res.json();
//     if (res.ok) {
//       localStorage.setItem('accessToken', data.accessToken);
//       setAccessToken(data.accessToken);
//     } else {
//       alert(data.message || 'Login failed');
//     }
//   };

module.exports = router;