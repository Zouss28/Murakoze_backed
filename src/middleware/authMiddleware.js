const jwt = require('jsonwebtoken');
const SECRET_KEY = process.env.JWT_SECRET || 'mysecretkey';

function authenticateToken(req, res, next) {
  const token = req.headers.authorization?.split(" ")[1];
  if (!token) return res.sendStatus(401).json({ error: 'Invalid or expired token' });

  jwt.verify(token, SECRET_KEY, (err, user) => {
    if (err) return res.sendStatus(403).json({ error: 'Invalid or expired token' });
    req.user = user;
    next();
  });
}

module.exports = authenticateToken;
