const express = require('express');
const router = express.Router();
const upload = require('../../uploads')
const { PrismaClient } = require('../generated/prisma');

const prisma = new PrismaClient();

router.get('/dashboard', async (req, res) => {
  try {
    const user_id = req.user.userId;

    const user = await prisma.users_profile.findUnique({
      where: { id: user_id },
      include: { images: true }
    });
    if (!user) return res.status(404).json({ error: "User doesn't exist" });
    const profile_image = '';
    for (let i in user.images){
      if (i.caption == 'Profile'){
        profile_image = i.image_url
      }
    }


    res.json({
      message: "Profile found",
      user: user,
      profile_image: profile_image
    });

  } catch (err) {
    console.log("Error : " + err);
    res.status(500).json({ error: 'Something went wrong!' });
  }
});


router.post('/dashboard/update', async (req, res) => {
  try{
    const {first_name, last_name, email, password, phone_number, age_group, gender,address} = req.body;
    const user_id = req.user.userId;
    const user = await prisma.users_profile.findUnique({ where : {id:user_id}});
    if(!user) return res.status(404).json({'error':"User doesn't exist"})
    await prisma.users_profile.update({
      where : {id : user_id},
      data : {first_name, last_name, email, password, phone_number, age_group, gender,address}
  });
  res.json({
    Message : "Profile updated"
  })
    
  }catch(err){
    console.log("Error : "+err);
    res.status(500).json({ error: 'Something went wrong!' });
  }
});

router.get('/reviews', async (req, res) => {
  try {
    const user_id = req.user.userId; 

    const user = await prisma.users_profile.findUnique({
      where: { id: user_id },
      include: {
        images: true,
        reviews: {
          include: {
            images: true
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

// Update profile image
router.post('/update_image', upload.single('profile_image'), async (req, res) => {
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
