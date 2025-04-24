const express = require('express')
const router = express.Router()
const { PrismaClient } = require('../generated/prisma');
const auth = require('../middleware/authMiddleware')
const prisma = new PrismaClient();

router.get('/',async (req,res)=>{
    try{
        const institutions = await prisma.institution.findMany()
        res.json({'institutions':institutions})
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
            ...institutions
        })
    }catch(error){
        console.log(`Error creating institution: ${error}`)
        res.status(500).json({'error':'Something went wrong!'})
    }
})


module.exports = router;