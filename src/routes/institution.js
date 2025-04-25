const express = require('express')
const router = express.Router()
const { PrismaClient } = require('../generated/prisma');
const auth = require('../middleware/authMiddleware')
const prisma = new PrismaClient();

router.get('/',async (req,res)=>{
    try{
        const categories = await prisma.categories.findMany()
        res.json({'categories':categories})
    }catch(error){
        console.log(`Error fetching data: ${error}`)
        res.status(500).json({'error':'Something went wrong!'})
    }
})

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