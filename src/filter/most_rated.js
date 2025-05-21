const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();

async function getTopInstitutionsByRate(category_id) {
  const grouped = await prisma.reviews.groupBy({
    by: ['institution_id'],
    _avg: { rating: true },
    orderBy: { _avg: { rating: 'desc' } },
  });

  const topInstitutionReview = grouped.filter(r => r._avg.rating >= 3);

  const institutionIds = topInstitutionReview.map(r => r.institution_id);

  const institutions = await prisma.institution.findMany({
    where: { id: { in: institutionIds }, category_id },
    include: {
      reviews: true,
      images: true,
      workingHour: true
    },
  });

  return institutions;
}

module.exports = { getTopInstitutionsByRate };
