const multer = require('multer');
const path = require('path');
const fs = require('fs');


const uploadDir = './uploads';
if (!fs.existsSync(uploadDir)) fs.mkdirSync(uploadDir);

const storage = multer.diskStorage({
  destination: (req, file, cb) => cb(null, uploadDir),
  filename: (req, file, cb) => {
    const ext = path.extname(file.originalname);
    const name = Date.now() + '-' + Math.round(Math.random() * 1e9) + ext;
    cb(null, name);
  }
});

const fileFilter = (req, file, cb) => {
  const allowedTypes = /jpeg|jpg|png|gif/;
  const isAllowed = allowedTypes.test(file.mimetype.toLowerCase());
  isAllowed ? cb(null, true) : cb(new Error('Only image files allowed'));
};

module.exports = multer({ storage, fileFilter });
