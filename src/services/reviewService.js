const prisma = require('../db/prisma');
const Filter = require('bad-words');
const Sentiment = require('sentiment');
const keyword_extractor = require('keyword-extractor');

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

exports.getInstitutionReviewSummary = async (institutionId) => {
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
    return { notFound: true, status: 404, message: 'Institution not found' };
  }

  const reviews = institution.reviews.map(r => r.review).filter(Boolean);

  if (reviews.length === 0) {
    return { summary: `There are no reviews for ${institution.name} yet.` };
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

  return { summary };
};

exports.toggleReviewReaction = async (review_id, user_id, reaction_type_id) => {
  if (!reaction_type_id || isNaN(reaction_type_id)) {
    return { error: "reaction_type_id is required and must be an integer.", status: 400 };
  }

  // Check review exists
  const review = await prisma.reviews.findUnique({ where: { id: review_id } });
  if (!review) {
    return { error: "Review not found.", status: 404 };
  }

  // Check reaction type exists
  const reactionType = await prisma.reaction_types.findUnique({ where: { id: reaction_type_id } });
  if (!reactionType) {
    return { error: "Reaction type not found.", status: 404 };
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
    return { message: "Reaction removed." };
  } else {
    // No reaction yet, create new
    await prisma.review_reactions.create({
      data: { review_id, user_id, reaction_type_id }
    });
    return { message: "Reaction added." };
  }
};

exports.getReviewReactions = async (review_id) => {
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

  return result;
};

exports.addReviewReply = async (review_id, user_id, reply_text, parent_reply_id) => {
  // Ensure review exists
  const review = await prisma.reviews.findUnique({ where: { id: review_id } });
  if (!review) return { error: "Review not found", status: 404 };

  // Optionally, check parent_reply_id exists if provided
  if (parent_reply_id) {
    const parent = await prisma.review_replies.findUnique({ where: { id: parent_reply_id } });
    if (!parent) return { error: "Parent reply not found", status: 400 };
  }

  const reply = await prisma.review_replies.create({
    data: {
      review_id,
      user_id,
      reply_text,
      parent_reply_id: parent_reply_id || null,
    },
  });

  return { reply };
};

exports.getReviewReplies = async (review_id) => {
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

  return replies;
};