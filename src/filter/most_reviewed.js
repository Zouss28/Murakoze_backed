const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();

async function getTopInstitutionsByReview(category_id) {
    const topInstitutionReview = await prisma.reviews.groupBy({
      by: ['institution_id'],
      _count: { id: true },
      orderBy: { _count: { id: 'desc' } }
    });
  
    const institutionIds = topInstitutionReview.map(r => r.institution_id);
  
    const institutions = await prisma.institution.findMany({
      where: { 
        id: { in: institutionIds },
        category_id : category_id
    },
      include: { reviews: true, images: true }
    });
  
    return institutions;
  }

module.exports = {getTopInstitutionsByReview}

  
  

