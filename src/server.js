require('dotenv').config();
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const authRoutes = require('./routes/auth');
const profileRoutes = require('./routes/profile');
const reviews = require('./routes/reviews');
const cors = require('cors');
const auth = require('./middleware/authMiddleware');
const errorHandler = require('./middleware/errorHandler');
const instit = require('./routes/institution')


app.use(cors());
app.use(express.json());
app.use('/uploads', express.static('uploads'));


// Routes
app.get('/', (req, res) => res.send('API is running'));
app.use('/api/auth', authRoutes);
app.use('/api/profile', auth, profileRoutes); 
app.use('/api/institutions',instit)
app.use('/api/review', reviews)



app.use(errorHandler);

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});