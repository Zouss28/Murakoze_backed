const prisma = require('../db/prisma');
const Filter = require('bad-words');

exports.institutionToReview = async () => {
  const institutions = await prisma.institution.findMany({
    include: {
      service_group: true
    }
  });
  return institutions;
};

exports.createReview = async (review, image, imageExtension, rating, user_id, institution_id) => {
  const filter = new Filter();

  const newReview = await prisma.reviews.create({
    data: {
      institution_id: institution_id,
      user_id: user_id,
      rating: rating,
      review: review,
      is_approved: !filter.isProfane(review)
    }
  });

  const newImage = await prisma.images.create({
    data: {
      image_url: image,
      type: imageExtension,
      user_id: user_id,
      review_id: newReview.id
    }
  });
  return { newReview, newImage };
};

exports.getRecentReviews = async (page) => {
  const reviews = await prisma.reviews.findMany({
    where: {
      is_approved: true
    },
    include: {
      images: true
    },
    orderBy: {
      created_at: 'desc'
    },
    take: 3 * page
  });

  const userIds = [...new Set(reviews.map(r => r.user_id))];

  const users = await prisma.users_profile.findMany({
    where: {
      id: { in: userIds }
    },
    include: {
      images: true
    }
  });

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
  return enrichedReviews;
};

exports.createServiceRating = async (service_id, rating, user_id, emoRating) => {
  const serviceRating = await prisma.serviceReview.create({
    data: {
      service_id: service_id,
      rating: rating,
      user_id: user_id,
      emoRating: emoRating
    }
  });
  return serviceRating;
};

exports.getInstitutionReviews = async (reviewWhere) => {
  const reviews = await prisma.reviews.findMany({
    where: {
      ...reviewWhere
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
  });
  return reviews;
};

exports.getQandA = async (service_id) => {
  const questions = await prisma.surveyQuestions.findMany({
    where: { service_id: service_id }
  });
  return questions;
};

exports.createQandA = async (answerData) => {
  const answer = await prisma.surveyAnswers.createMany({
    data: answerData
  });
  return answer;
};