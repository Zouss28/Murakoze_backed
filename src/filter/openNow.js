const { PrismaClient } = require('../generated/prisma');
const prisma = new PrismaClient();

async function getInstitutionsOpenNow(category_id) {
    const now = new Date();
  
    const currentDay = now.toLocaleString('en-US', { weekday: 'long' });
  
    // Format current time as "HH:MM:SS"
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');
    const currentTime = `${hours}:${minutes}:${seconds}`;
  

    const Now = new Date(`1970-01-01T${currentTime}`);
  
    const institutions = await prisma.institution.findMany({
      where: {
        category_id,
        workingHour: {
          some: {
            day_of_week: currentDay
          }
        }
      },
      include: {
        reviews: true,
        images: true,
        workingHour: true
      }
    });
  
    const filteredInstitutions = institutions.filter(inst => {
      // Find if ANY workingHour is open now
      const isOpen = inst.workingHour.some(wh => {
        return wh.open_time <= Now && wh.close_time >= Now;
      });
  
      return isOpen;
    });
  
    return filteredInstitutions;
  }
  
  module.exports = { getInstitutionsOpenNow };
  
module.exports = { getInstitutionsOpenNow };
