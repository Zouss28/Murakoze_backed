require('dotenv').config();
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const authRoutes = require('./routes/auth');
const profileRoutes = require('./routes/profile');
const reviews = require('./routes/reviews');
const search = require('./routes/search')
const adminRoutes = require('./routes/admin');
const cors = require('cors');
const auth = require('./middleware/authMiddleware');
const errorHandler = require('./middleware/errorHandler');
const instit = require('./routes/institution')
const swaggerUi = require('swagger-ui-express');
const swaggerSpec = require('../swagger');
const helmet = require('helmet');
const rateLimit = require('express-rate-limit');
const logger = require('./utils/logger');
const morgan = require('morgan');
const passport = require('./config/passport');

app.set('trust proxy', 1); 

const requiredEnvVars = ['JWT_SECRET', 'DATABASE_URL', 'EMAIL', 'EMAIL_PASS', 'FRONTEND_URL'];
requiredEnvVars.forEach((key) => {
  if (!process.env[key]) {
    throw new Error(`Missing required environment variable: ${key}`);
  }
});
const limiter = rateLimit({
  windowMs: 15 * 60 * 1000,
  max: 1000,
  message: "Too many requests, please try again later.",
  standardHeaders: true,
  legacyHeaders: false,
});

const authLimiter = rateLimit({
  windowMs: 10 * 60 * 1000,
  max: 10, 
  message: "Too many auth attempts, please try again later.",
});


app.use('/api/auth', authLimiter);

// app.use(helmet());
app.use('/api', limiter);

// HTTP request logging
app.use(morgan('combined', {
  stream: {
    write: (message) => logger.info(message.trim())
  }
}));



// Swagger Docs route
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));
app.use(cors({
  origin: process.env.NODE_ENV === 'production' ? process.env.FRONTEND_URL : '*',
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));

// Initialize Passport
app.use(passport.initialize());


app.use(express.json());
app.use('/uploads', express.static('uploads'));

app.get('/api-docs-json', (req, res) => {
  res.setHeader('Content-Type', 'application/json');
  res.send(swaggerSpec);
});

app.get('/', (req, res) => res.send('API is running'));
app.use('/api/auth', authRoutes);
app.use('/api/profile', auth, profileRoutes); 
app.use('/api/institutions', instit)
app.use('/api/review', reviews)
app.use('/api/search', search)
app.use('/api/admin', adminRoutes)

app.get('/auth/google/callback', async (req, res) => {
  logger.info('Google auth callback received', { query: req.query });
});

app.post("/tokenVerification", auth, (req, res) => {
  res.json({"message": "Login succefully"});
});

app.use(errorHandler);

app.set('view engine', 'ejs');
app.set('views', __dirname + '/src/templates');

app.listen(port, () => {
  logger.info(`Server is running on port ${port}`);
});
