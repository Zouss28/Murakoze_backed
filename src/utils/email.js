const nodemailer = require('nodemailer');
const fs = require('fs');
const path = require('path');

exports.sendVerificationEmail = async (email, token) => {
  const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: process.env.EMAIL,
      pass: process.env.EMAIL_PASS,
    },
  });

  const verifyUrl = `http://murakozebacked-production.up.railway.app/api/auth/verify-email?token=${token}`;
  const templatePath = path.join(__dirname, '../templates/verify_email.html');
  let htmlTemplate = fs.readFileSync(templatePath, 'utf-8');
  htmlTemplate = htmlTemplate.replaceAll('{{verifyUrl}}', verifyUrl);

  await transporter.sendMail({
    to: email,
    subject: 'Verify your email',
    html: htmlTemplate,
  });
};