const express = require('express')
const router = express.Router()
const { PrismaClient } = require('../generated/prisma');
const auth = require('../middleware/authMiddleware')
const prisma = new PrismaClient();
const {getTopInstitutionsByReview} = require('../filter/most_reviewed');
const {getTopInstitutionsByRate} = require('../filter/most_rated');


/**
 * @swagger
 * tags:
 *   name: Institutions
 *   description: Institution-related endpoints
 */

/**
 * @swagger
 * /api/institutions:
 *   get:
 *     summary: Get all institution categories
 *     tags: [Institutions]
 *     responses:
 *       200:
 *         description: List of categories
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 categories:
 *                   type: array
 *                   items:
 *                     type: object
 *                     properties:
 *                       id:
 *                         type: integer
 *                       name:
 *                         type: string
 */
router.get('/',async (req,res)=>{
    try{
        const categories = await prisma.categories.findMany()
        res.json({'categories':categories})
    }catch(error){
        console.log(`Error fetching data: ${error}`)
        res.status(500).json({'error':'Something went wrong!'})
    }
})

/**
 * @swagger
 * /api/institutions/{category_id}:
 *   get:
 *     summary: Get institutions for a category
 *     tags: [Institutions]
 *     parameters:
 *       - in: path
 *         name: category_id
 *         required: true
 *         schema:
 *           type: integer
 *         description: ID of the category
 *     responses:
 *       200:
 *         description: Category and its institutions
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 categories:
 *                   type: object
 */

router.get('/:category_id', async (req, res) => {
    try {
      const category_id = parseInt(req.params.category_id, 10);
      const page = parseInt(req.query.page) || 1;
      const pageSize = parseInt(req.query.pageSize) || 5;

      const [institutions, totalCount] = await Promise.all([
        await prisma.institution.findMany({
        where: { category_id: category_id },
        include: { reviews: true ,
            workingHour : true,
            images: true
        }
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
          id:inst.id,
          name:inst.name,
          description : inst.description,
          location : inst.address,
          image:inst.images[0],
          avgRating: avgRating ? Number(avgRating.toFixed(2)) : null,
          totalReview: ratings.length,
          workingHours : inst.workingHour
        };
      });
  
      const totalPages = Math.ceil(totalCount / pageSize);
  
      res.json({ 
        institutions: result,
      page: page,
      totalPages : totalPages,
      totalCount : totalCount
     });
    } catch (error) {
      console.log(`Error fetching data: ${error}`);
      res.status(500).json({ error: 'Something went wrong!' });
    }
});  


/**
 * @swagger
 * /api/institutions/create:
 *   post:
 *     summary: Create a new institution
 *     tags:
 *       - Institutions
 *     requestBody:
 *       required: true
 *       content:
 *         application/json:
 *           schema:
 *             type: object
 *             properties:
 *               name:
 *                 type: string
 *                 example: Harvard University
 *     responses:
 *       200:
 *         description: Successfully created institution
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 institutions:
 *                   type: string
 *                   example: Harvard University
 *       500:
 *         description: Internal server error
 */
router.post("/create", async (req, res)=>{
    const {name} = req.body;
    try{
        const institutions = await prisma.institution.create({
            data :{name}
        })
        res.json({
            institutions: institutions.name
        })
    }catch(error){
        console.log(`Error creating institution: ${error}`)
        res.status(500).json({'error':'Something went wrong!'})
    }
})

router.put('/update', async (req, res) => {
  const {name} = req.body;
  try{
    const institutions = await prisma.institution.update({
      data : {name}
    });
    res.json({
      message : "Institution update succesfully ."
    });
  }catch(err){
    console.log(`Error updating institution: ${err}`)
    res.status(500).json({'error':'Something went wrong!'})
  }
})



/**
 * @swagger
 * /api/institutions/{id}/view:
 *   get:
 *     summary: Get institution details by ID
 *     description: Retrieves institution details, including images, working hours, and reviews.
 *     tags:
 *       - Institutions
 *     parameters:
 *       - in: path
 *         name: id
 *         required: true
 *         schema:
 *           type: integer
 *         description: Institution ID
 *     responses:
 *       200:
 *         description: Institution details retrieved successfully
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 institution:
 *                   type: object
 *                   properties:
 *                     id:
 *                       type: integer
 *                     name:
 *                       type: string
 *                     images:
 *                       type: array
 *                       items:
 *                         type: object
 *                     workingHour:
 *                       type: array
 *                       items:
 *                         type: object
 *                     reviews:
 *                       type: array
 *                       items:
 *                         type: object
 *       404:
 *         description: Institution not found
 *       500:
 *         description: Server error
 */

router.get("/:id/view", async (req, res)=>{
  const institution_id = parseInt(req.params.id,10);
  const query = await prisma.institution.findUnique({
    where : {
      id:institution_id
    },
    include : {
      images : true,
      workingHour:true,
      reviews : true,
      business_amenities : {
        include:{amenities:true}
      }
    }
  })
  res.json({
    institution : query
  })
})



module.exports = router;