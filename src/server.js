require('dotenv').config();
const app = require('./app');
const sequelize = require('./config/db');
require('./models'); // load models & associations

const PORT = process.env.PORT || 5000;

const start = async () => {
  try {
    await sequelize.authenticate();
    console.log('✅ MySQL connection established.');

    // In development, keep schema in sync automatically.
    // For production, prefer proper migrations instead of alter:true.
    await sequelize.sync({ alter: true });
    console.log('✅ Database synced.');

    app.listen(PORT, () => {
      console.log(`🚀 Enjoy Pakistan Tour API running on http://localhost:${PORT}`);
    });
  } catch (err) {
    console.error('❌ Unable to start server:', err.message);
    process.exit(1);
  }
};

start();
