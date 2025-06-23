const prisma = require('../db/prisma');

exports.getCategories = async () => {
  const categories = await prisma.categories.findMany();
  return {categories};
}; 

exports.getInstitutionsByCategory = async (category_id, page, pageSize) => {
  const [institutions, totalCount] = await Promise.all([
    prisma.institution.findMany({
      where: { category_id: category_id },
      include: {
        reviews: true,
        workingHour: true,
        images: true
      },
      skip: (page - 1) * pageSize,
      take: pageSize,
    }),
    prisma.institution.count({
      where: { category_id: category_id },
    })
  ]);

  const result = institutions.map(inst => {
    const ratings = inst.reviews.map(r => r.rating);
    const avgRating =
      ratings.length > 0
        ? ratings.reduce((a, b) => a + b, 0) / ratings.length
        : null;

    return {
      id: inst.id,
      name: inst.name,
      description: inst.description,
      location: inst.address,
      image: inst.images[0],
      avgRating: avgRating ? Number(avgRating.toFixed(2)) : null,
      totalReview: ratings.length,
      workingHours: inst.workingHour
    };
  });

  const totalPages = Math.ceil(totalCount / pageSize);

  return {
    institutions: result,
    page: page,
    totalPages: totalPages,
    totalCount: totalCount
  };
};

exports.createInstitution = async (institutionData) => {
  const institution = await prisma.institution.create({
    data: institutionData,
  });
  return {institution};
};

exports.updateInstitution = async (institutionData) => {
  await prisma.institution.update({
    data : institutionData,
  });
}

exports.getInstitutionsByID = async (ID) => {
  const institution = await prisma.institution.findUnique({
    where:{id: ID},
    include : {
      images : true,
      workingHour:true,
      reviews : true,
      business_amenities : {
        include:{amenities:true}
      }
    }
  });
  return {institution};
}