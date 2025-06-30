const prisma = require('../db/prisma');

exports.getDashboardStats = async () => {
  const [
    totalUsers,
    totalInstitutions,
    totalReviews,
    pendingReviews,
    recentUsers,
    recentReviews,
    topCategories,
    reviewStats
  ] = await Promise.all([
    // Total counts
    prisma.users_profile.count(),
    prisma.institution.count(),
    prisma.reviews.count(),
    prisma.reviews.count({ where: { is_approved: null } }),
    
    // Recent activity (last 7 days)
    prisma.users_profile.count({
      where: {
        added_at: {
          gte: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000)
        }
      }
    }),
    prisma.reviews.count({
      where: {
        created_at: {
          gte: new Date(Date.now() - 7 * 24 * 60 * 60 * 1000)
        }
      }
    }),
    
    // Top categories by institution count
    prisma.categories.findMany({
      include: {
        _count: {
          select: { institution: true }
        }
      },
      orderBy: {
        institution: {
          _count: 'desc'
        }
      },
      take: 5
    }),
    
    // Review statistics
    prisma.reviews.groupBy({
      by: ['rating'],
      _count: { rating: true }
    })
  ]);

  // Calculate average rating
  const avgRating = await prisma.reviews.aggregate({
    _avg: { rating: true }
  });

  return {
    overview: {
      totalUsers,
      totalInstitutions,
      totalReviews,
      pendingReviews,
      averageRating: avgRating._avg.rating || 0
    },
    recentActivity: {
      newUsers: recentUsers,
      newReviews: recentReviews
    },
    topCategories: topCategories.map(cat => ({
      id: cat.id,
      name: cat.name,
      institutionCount: cat._count.institution
    })),
    reviewDistribution: reviewStats.reduce((acc, stat) => {
      acc[stat.rating] = stat._count.rating;
      return acc;
    }, {})
  };
};

exports.getUsers = async (page, limit, search) => {
  const skip = (page - 1) * limit;
  
  const where = search ? {
    OR: [
      { first_name: { contains: search } },
      { last_name: { contains: search } },
      { email: { contains: search } }
    ]
  } : {};

  const [users, total] = await Promise.all([
    prisma.users_profile.findMany({
      where,
      select: {
        id: true,
        first_name: true,
        last_name: true,
        email: true,
        isVerified: true,
        added_at: true,
        _count: {
          select: { reviews: true }
        }
      },
      skip,
      take: limit,
      orderBy: { added_at: 'desc' }
    }),
    prisma.users_profile.count({ where })
  ]);

  return {
    users: users.map(user => ({
      ...user,
      reviewCount: user._count.reviews
    })),
    pagination: {
      page,
      limit,
      total,
      pages: Math.ceil(total / limit)
    }
  };
};

exports.getInstitutions = async (page, limit, search, category) => {
  const skip = (page - 1) * limit;
  
  const where = {};
  if (search) {
    where.OR = [
      { name: { contains: search } },
      { description: { contains: search } }
    ];
  }
  if (category) {
    where.category_id = parseInt(category);
  }

  const [institutions, total] = await Promise.all([
    prisma.institution.findMany({
      where,
      include: {
        categories: true,
        _count: {
          select: { reviews: true }
        }
      },
      skip,
      take: limit,
      orderBy: { created_at: 'desc' }
    }),
    prisma.institution.count({ where })
  ]);

  return {
    institutions: institutions.map(inst => ({
      ...inst,
      reviewCount: inst._count.reviews
    })),
    pagination: {
      page,
      limit,
      total,
      pages: Math.ceil(total / limit)
    }
  };
};

exports.getReviews = async (page, limit, status) => {
  const skip = (page - 1) * limit;
  
  const where = {};
  if (status === 'pending') {
    where.is_approved = null;
  } else if (status === 'approved') {
    where.is_approved = true;
  } else if (status === 'rejected') {
    where.is_approved = false;
  }

  const [reviews, total] = await Promise.all([
    prisma.reviews.findMany({
      where,
      include: {
        users_profile: {
          select: {
            id: true,
            first_name: true,
            last_name: true,
            email: true
          }
        },
        institution: {
          select: {
            id: true,
            name: true
          }
        },
        images: true
      },
      skip,
      take: limit,
      orderBy: { created_at: 'desc' }
    }),
    prisma.reviews.count({ where })
  ]);

  return {
    reviews,
    pagination: {
      page,
      limit,
      total,
      pages: Math.ceil(total / limit)
    }
  };
};

exports.moderateReview = async (reviewId, action, reason) => {
  const isApproved = action === 'approve';
  
  const review = await prisma.reviews.update({
    where: { id: parseInt(reviewId) },
    data: { 
      is_approved: isApproved 
    },
    include: {
      users_profile: {
        select: { email: true, first_name: true }
      },
      institution: {
        select: { name: true }
      }
    }
  });

  // TODO: Send email notification to user about review status
  // if (review.users_profile.email) {
  //   await sendReviewStatusEmail(review.users_profile.email, action, reason);
  // }

  return {
    message: `Review ${action}d successfully`,
    review: {
      id: review.id,
      status: isApproved ? 'approved' : 'rejected',
      reason
    }
  };
};

exports.getAnalytics = async (period) => {
  const days = period === '7d' ? 7 : period === '30d' ? 30 : period === '90d' ? 90 : 365;
  const startDate = new Date(Date.now() - days * 24 * 60 * 60 * 1000);

  const [
    userGrowth,
    reviewGrowth,
    institutionGrowth,
    topRatedInstitutions,
    reviewTrends
  ] = await Promise.all([
    // User growth over time
    prisma.users_profile.groupBy({
      by: ['added_at'],
      _count: { id: true },
      where: { added_at: { gte: startDate } },
      orderBy: { added_at: 'asc' }
    }),
    
    // Review growth over time
    prisma.reviews.groupBy({
      by: ['created_at'],
      _count: { id: true },
      where: { created_at: { gte: startDate } },
      orderBy: { created_at: 'asc' }
    }),
    
    // Institution growth over time
    prisma.institution.groupBy({
      by: ['created_at'],
      _count: { id: true },
      where: { created_at: { gte: startDate } },
      orderBy: { created_at: 'asc' }
    }),
    
    // Top rated institutions
    prisma.institution.findMany({
      include: {
        reviews: true,
        categories: true
      },
      orderBy: {
        reviews: {
          _count: 'desc'
        }
      },
      take: 10
    }),
    
    // Review rating trends
    prisma.reviews.groupBy({
      by: ['rating'],
      _count: { rating: true },
      where: { created_at: { gte: startDate } }
    })
  ]);

  return {
    period,
    userGrowth: userGrowth.map(item => ({
      date: item.added_at,
      count: item._count.id
    })),
    reviewGrowth: reviewGrowth.map(item => ({
      date: item.created_at,
      count: item._count.id
    })),
    institutionGrowth: institutionGrowth.map(item => ({
      date: item.created_at,
      count: item._count.id
    })),
    topRatedInstitutions: topRatedInstitutions.map(inst => ({
      id: inst.id,
      name: inst.name,
      category: inst.categories?.name,
      reviewCount: inst.reviews.length,
      avgRating: inst.reviews.length > 0 
        ? inst.reviews.reduce((sum, r) => sum + r.rating, 0) / inst.reviews.length 
        : 0
    })),
    reviewTrends: reviewTrends.reduce((acc, item) => {
      acc[item.rating] = item._count.rating;
      return acc;
    }, {})
  };
};

exports.updateInstitution = async (institutionId, data) => {
  const institution = await prisma.institution.update({
    where: { id: parseInt(institutionId) },
    data: {
      name: data.name,
      description: data.description,
      address: data.address,
      phone_number: data.phone_number,
      email: data.email,
      url: data.url,
      category_id: data.category_id ? parseInt(data.category_id) : undefined
    }
  });

  return {
    message: 'Institution updated successfully',
    institution
  };
};

exports.deleteUser = async (userId) => {
  await prisma.users_profile.delete({
    where: { id: parseInt(userId) }
  });

  return {
    message: 'User deleted successfully'
  };
}; 