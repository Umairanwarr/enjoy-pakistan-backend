require('dotenv').config();
const app = require('./app');
const connectDB = require('./config/db');
require('./models'); // load models

const PORT = process.env.PORT || 5000;

const start = async () => {
  try {
    await connectDB();
    console.log('✅ Connected to Database.');

    app.listen(PORT, () => {
      console.log(`🚀 Enjoy Pakistan Tour API running on http://localhost:${PORT}`);
    });
  } catch (err) {
    console.error('❌ Unable to start server:', err.message);
    process.exit(1);
  }
};

start();
