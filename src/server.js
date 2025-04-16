require('dotenv').config();
const express = require('express');
const app = express();
const port = process.env.PORT || 3000;
const authRoutes = require('./routes/auth');
const cors = require('cors');

app.use(cors());

app.use(express.json());
app.use('/auth', authRoutes);

app.get('/', (req, res) => {
  res.send('Hello World!');
}
);

app.listen(port, () => {
  console.log('Server is running on port 3000');
}
);