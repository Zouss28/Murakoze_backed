const express = require('express');
const router = express.Router();
const upload = require('../../uploads')
const { PrismaClient } = require('../generated/prisma');

const prisma = new PrismaClient();
/**
 * @swagger
 * tags:
 *   name: Profile
 *   description: Profile-related endpoints
 */


/**
 * @swagger
 * /api/profile/dashboard:
 *   get:
 *     summary: Get user dashboard information
 *     tags:
 *       - Profile
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Successfully retrieved user profile
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Profile found
 *                 user:
 *                   type: object
 *                 profile_image:
 *                   type: array
 *                   items:
 *                     type: object
 *       404:
 *         description: User not found
 *       500:
 *         description: Internal server error
 */

router.get('/dashboard', async (req, res) => {
  try {
    const user_id = req.user.userId;

    const user = await prisma.users_profile.findUnique({
      where: { id: user_id },
      include: { images: true }
    });
    if (!user) return res.status(404).json({ error: "User doesn't exist" });
   


    res.json({
      message: "Profile found",
      user: user,
      profile_image: user.images
    });

  } catch (err) {
    console.log("Error : " + err);
    res.status(500).json({ error: 'Something went wrong!' });
  }
});


/**
 * @swagger
 * /api/profile/guestDashboard:
 *   get:
 *     summary: Get user dashboard information
 *     tags:
 *       - Profile
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Successfully retrieved user profile
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 message:
 *                   type: string
 *                   example: Profile found
 *                 user:
 *                   type: object
 *                 profile_image:
 *                   type: array
 *                   items:
 *                     type: object
 *       404:
 *         description: User not found
 *       500:
 *         description: Internal server error
 */

router.get('/guestDashboard', async (req, res) => {
  try {
    const user_id = req.query.guestID

    const user = await prisma.users_profile.findUnique({
      where: { id: user_id },
      include: { images: true }
    });
    if (!user) return res.status(404).json({ error: "User doesn't exist" });
   


    res.json({
      message: "Profile found",
      first_name : user.first_name,
      last_name : user.last_name,
      gender : user.gender,
      profile_image: user.images
    });

  } catch (err) {
    console.log("Error : " + err);
    res.status(500).json({ error: 'Something went wrong!' });
  }
});

/**
 * @swagger
 * /api/profile/dashboard/update:
 *   put:
 *     summary: Update user profile
 *     tags:
 *       - Profile
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               first_name:
 *                 type: string
 *               last_name:
 *                 type: string
 *               email:
 *                 type: string
 *               password:
 *                 type: string
 *               phone_number:
 *                 type: string
 *               age_group:
 *                 type: string
 *               gender:
 *                 type: string
 *               address:
 *                 type: string
 *     responses:
 *       200:
 *         description: Profile updated
 *       404:
 *         description: User not found
 *       500:
 *         description: Internal server error
 */

router.put('/dashboard/update', async (req, res) => {
  try{
    const {first_name, last_name, email, password, phone_number, age_group, gender,address} = req.body;
    const user_id = req.user.userId;
    const user = await prisma.users_profile.findUnique({ where : {id:user_id}});
    if(!user) return res.status(404).json({'error':"User doesn't exist"})
    const newProfile = await prisma.users_profile.update({
      where : {id : user_id},
      data : {first_name, last_name, email, password, phone_number, age_group, gender,address}
  });
  res.json({
    Message : "Profile updated",
    profile : newProfile
  })
    
  }catch(err){
    console.log("Error : "+err);
    res.status(500).json({ error: 'Something went wrong!' });
  }
});


/**
 * @swagger
 * /api/profile/reviews:
 *   get:
 *     summary: Get user reviews
 *     tags:
 *       - Profile
 *     security:
 *       - bearerAuth: []
 *     responses:
 *       200:
 *         description: Reviews fetched successfully
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
 *                 images:
 *                   type: array
 *                   items:
 *                     type: object
 *       404:
 *         description: User not found
 *       500:
 *         description: Internal server error
 */

router.get('/reviews', async (req, res) => {
  try {
    const user_id = req.user.userId; 

    const user = await prisma.users_profile.findUnique({
      where: { id: user_id },
      include: {
        images: true,
        reviews: {
          include: {
            images: true,
            institution:true
          }
        }
      }
    });

    if (!user) {
      return res.status(404).json({ error: "User not found" });
    }

    res.json({
      message: "Reviews fetched successfully",
      reviews: user.reviews,
      images: user.images
    });

  } catch (err) {
    console.log("Error:", err);
    res.status(500).json({ error: 'Something went wrong!' });
  }
});

/**
 * @swagger
 * /api/profile/guestReviews:
 *   get:
 *     summary: Get reviews of another user (guest profile)
 *     tags:
 *       - Profile
 *     security:
 *       - bearerAuth: []
 *     parameters:
 *       - in: query
 *         name: guestID
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID of the user whose reviews you want to see
 *     responses:
 *       200:
 *         description: Reviews fetched successfully
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
 *                 images:
 *                   type: array
 *                   items:
 *                     type: object
 *       404:
 *         description: User not found
 *       401:
 *         description: Unauthorized
 *       500:
 *         description: Internal server error
 */

router.get('/guestReviews', async (req, res) => {
  try {
    const requestingUser = req.user?.userId; // This ensures only authenticated users access it
    const guestID = req.query.guestID;

    if (!requestingUser) {
      return res.status(401).json({ error: "Unauthorized: Login required" });
    }

    const guestUser = await prisma.users_profile.findUnique({
      where: { id: parseInt(guestID) },
      include: {
        images: true,
        reviews: {
          include: {
            images: true,
            institution: true
          }
        }
      }
    });

    if (!guestUser) {
      return res.status(404).json({ error: "Guest user not found" });
    }

    res.json({
      message: "Guest reviews fetched successfully",
      reviews: guestUser.reviews,
      images: guestUser.images
    });

  } catch (err) {
    console.error("Error:", err);
    res.status(500).json({ error: 'Something went wrong!' });
  }
});


/**
 * @swagger
 * /api/profile/update_image:
 *   put:
 *     summary: Update user's profile image
 *     tags:
 *       - Profile
 *     consumes:
 *       - multipart/form-data
 *     security:
 *       - bearerAuth: []
 *     requestBody:
 *       required: true
 *       content:
 *         multipart/form-data:
 *           schema:
 *             type: object
 *             properties:
 *               profile_image:
 *                 type: string
 *                 format: binary
 *     responses:
 *       200:
 *         description: Profile image updated successfully
 *       500:
 *         description: Could not update profile image
 */

router.put('/update_image', upload.single('profile_image'), async (req, res) => {
  try {
    const userId = req.user.userId;
    const imagePath = req.file.path; 
    const imageType = req.file.mimetype;

    const imageExtension = imageType.split('/')[1];

    const existingimage = await prisma.images.findFirst({ where: { user_id: userId } });

    let image; // define image here to use in response

    if (existingimage) {
      image = await prisma.images.update({
        where: { id: existingimage.id },
        data: {
          image_url: imagePath,
          type: imageExtension,
          user_id: userId
        }
      });
    } else {
      image = await prisma.images.create({
        data: {
          image_url: imagePath,
          type: imageExtension,
          users_profile: {
            connect: { id: userId }
          }
        }
      });
    }

    res.json({
      message: 'Profile image updated successfully',
      profile_image: image.image_url,
      image: image
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Could not update profile image' });
  }
});

/**
 * @swagger
 * /api/profile/profile-image/{userId}:
 *   get:
 *     summary: Get a user's profile image
 *     tags:
 *       - Profile
 *     parameters:
 *       - in: path
 *         name: userId
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID of the user
 *     responses:
 *       200:
 *         description: Image found
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 image_url:
 *                   type: string
 *                 type:
 *                   type: string
 *                 uploaded_at:
 *                   type: string
 *                   format: date-time
 *       404:
 *         description: Image not found
 *       500:
 *         description: Internal server error
 */

router.get('/profile-image/:userId', async (req, res) => {
  const userId = parseInt(req.params.userId);

  try {
    const image = await prisma.images.findFirst({
      where: { user_id: userId },
    });

    if (!image) {
      return res.status(404).json({ message: 'Image not found for this user.' });
    }

    res.json({
      image_url: image.image_url,
      type: image.type,
      uploaded_at: image.uploaded_at
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ message: 'Internal server error' });
  }
});


module.exports = router;
