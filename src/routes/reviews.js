const express = require('express')
const router = express.Router()
const { PrismaClient } = require('../generated/prisma');
const auth = require('../middleware/authMiddleware')
const upload = require('../../uploads')


const prisma = new PrismaClient();

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