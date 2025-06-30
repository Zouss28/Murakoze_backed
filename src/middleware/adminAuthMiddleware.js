const prisma = require('../db/prisma');

const adminAuth = async (req, res, next) => {
  try {
    const userId = req.user.userId;
    
    // Check if user exists and has admin privileges
    const user = await prisma.users_profile.findUnique({
      where: { id: userId },
      select: { id: true, email: true, isAdmin: true }
    });

    if (!user) {
      return res.status(404).json({ error: 'User not found' });
    }


    const adminEmails = process.env.ADMIN_EMAILS ? 
      process.env.ADMIN_EMAILS.split(',').map(email => email.trim()) : 
      ['alanjonse2@gmail.com']; 

    if (!adminEmails.includes(user.email)) {
      return res.status(403).json({ error: 'Admin access required' });
    }

    // Add admin info to request
    req.admin = {
      userId: user.id,
      email: user.email
    };

    next();
  } catch (error) {
    console.error('Admin auth error:', error);
    res.status(500).json({ error: 'Authentication failed' });
  }
};

module.exports = adminAuth; 