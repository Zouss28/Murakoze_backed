const express = require('express')
const router = express.Router()
const { PrismaClient } = require('../generated/prisma');
const auth = require('../middleware/authMiddleware')
const prisma = new PrismaClient();


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

router.get('/:category_id',async (req,res)=>{
    try{
        const category_id = parseInt(req.params.category_id);
        const categories = await prisma.categories.findFirst({
            where : {id : category_id},
            include : {institution : true}
        })
        res.json({'categories':categories})
    }catch(error){
        console.log(`Error fetching data: ${error}`)
        res.status(500).json({'error':'Something went wrong!'})
    }
})


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


module.exports = router;