const express = require('express')
const router = express.Router()
const auth = require('../middleware/authMiddleware')
const institutionController = require('../controllers/institutionController');
const institutionValidator = require('../validators/institutionValidator');

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
router.get('/', institutionController.getCategories);

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
router.get('/:category_id', institutionValidator.validateInstitution, institutionController.getInstitutionsByCategory);

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
router.post('/create', institutionValidator.validateInstitution, institutionController.createInstitution);

router.put('/update', auth, institutionValidator.validateInstitution, institutionController.updateInstitution);

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
router.get("/:id/view",  institutionController.getInstitutionById);



module.exports = router;