require('dotenv').config();
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const authRoutes = require('./routes/auth');
const profileRoutes = require('./routes/profile');
const reviews = require('./routes/reviews');
const search = require('./routes/search')
const cors = require('cors');
const auth = require('./middleware/authMiddleware');
const errorHandler = require('./middleware/errorHandler');
const instit = require('./routes/institution')
const swaggerUi = require('swagger-ui-express');
const swaggerSpec = require('../swagger');
const router = express.Router()



// Swagger Docs route
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));
app.use(cors({
  origin: '*',
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));
app.use(express.json());
app.use('/uploads', express.static('uploads'));




app.get('/api-docs-json', (req, res) => {
  res.setHeader('Content-Type', 'application/json');
  res.send(swaggerSpec);
});

app.get('/', (req, res) => res.send('API is running'));
app.use('/api/auth', authRoutes);
app.use('/api/profile', auth, profileRoutes); 
app.use('/api/institutions',instit)
app.use('/api/review', reviews)
app.use('/api/search', search)

router.get('/auth/google/callback', async (req, res) => {
  console.log(req)
});

app.post("/tokenVerification",auth,(req, res)=>{
  res.json({"message":"Login succefully"})
})

app.use(errorHandler);

app.set('view engine', 'ejs');
app.set('views', __dirname + '/src/templates');

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});