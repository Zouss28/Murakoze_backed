const prisma = require('../db/prisma');

exports.getDashboard = async (user_id) => {
  if (!user_id) throw new Error("User ID is required");
  
  const user = await prisma.users_profile.findUnique({
    where: { id: user_id },
    include: { images: true }
  });

  return user;
};

exports.getGuestDashboard = async (user_id) => {
  if (!user_id) throw new Error("User ID is required");

  const user = await prisma.users_profile.findUnique({
    where: { id: user_id },
    include: { images: true }
  });

  return user;
};

exports.updateProfile = async (user_id, data) => {
  if (!user_id) throw new Error("User ID is required");

  const user = await prisma.users_profile.update({
    where: { id: user_id },
    data: data
  });

  return user;
};

exports.getReviews = async (user_id) => {
  if (!user_id) throw new Error("User ID is required");

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

  return user;
};

exports.getGuestReviews = async (user_id) => {
  if (!user_id) throw new Error("User ID is required");

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

  return user;
};

exports.updateProfileImage = async (user_id, image_url) => {
  if (!user_id) throw new Error("User ID is required");

  const user = await prisma.users_profile.update({
    where: { id: user_id },
    data: { profile_image: image_url }
  });

  return user;
};

exports.getProfileImage = async (user_id) => {
  if (!user_id) throw new Error("User ID is required");

  const image = await prisma.users_profile.findUnique({ where: { id: user_id }});

  return image;
};