require('dotenv').config();
require('../src/models');

const app = require('../src/app');
const connectDB = require('../src/config/db');

let connection;

module.exports = async (req, res) => {
  try {
    connection ||= connectDB();
    await connection;
    return app(req, res);
  } catch (error) {
    connection = undefined;
    return res.status(503).json({ message: 'Database connection unavailable' });
  }
};
