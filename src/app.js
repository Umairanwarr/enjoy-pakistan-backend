const express = require('express');
const cors = require('cors');
const path = require('path');
require('dotenv').config();

const authRoutes = require('./routes/authRoutes');
const tourRoutes = require('./routes/tourRoutes');
const carRoutes = require('./routes/carRoutes');
const bookingRoutes = require('./routes/bookingRoutes');
const contactRoutes = require('./routes/contactRoutes');
const settingRoutes = require('./routes/settingRoutes');
const dashboardRoutes = require('./routes/dashboardRoutes');

const app = express();

const allowedOrigins = new Set(
  (process.env.CORS_ORIGINS || process.env.FRONTEND_URL || process.env.CLIENT_URL || '')
    .split(',')
    .map((origin) => origin.trim())
    .filter(Boolean)
);

// Keep local development available while allowing the production website origins.
allowedOrigins.add('http://localhost:5173');
allowedOrigins.add('https://enjoypakistantour.com');
allowedOrigins.add('https://www.enjoypakistantour.com');

app.use(cors({
  origin(origin, callback) {
    if (!origin || allowedOrigins.has(origin)) return callback(null, true);
    return callback(new Error('Origin is not allowed by CORS'));
  },
  credentials: true,
}));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Serve uploaded images statically
app.use('/uploads', express.static(path.join(__dirname, '..', 'uploads')));

// API routes
app.use('/api/auth', authRoutes);
app.use('/api/tours', tourRoutes);
app.use('/api/cars', carRoutes);
app.use('/api/bookings', bookingRoutes);
app.use('/api/contact', contactRoutes);
app.use('/api/settings', settingRoutes);
app.use('/api/dashboard', dashboardRoutes);

// Backward-compatible paths used by the existing production frontend.
app.use('/settings', settingRoutes);
app.use('/cars', carRoutes);
app.use('/tours', tourRoutes);

app.get('/', (req, res) => res.json({ status: 'ok', message: 'Enjoy Pakistan Tour API is running' }));
app.get('/api/health', (req, res) => res.json({ status: 'ok', message: 'Enjoy Pakistan Tour API is running' }));

// --- Optional: serve the built React app from a single server in production ---
// Uncomment after running `npm run build:client`:
//
// app.use(express.static(path.join(__dirname, '..', '..', 'client', 'dist')));
// app.get('*', (req, res) => {
//   res.sendFile(path.join(__dirname, '..', '..', 'client', 'dist', 'index.html'));
// });

// 404 handler for unmatched API routes
app.use('/api', (req, res) => res.status(404).json({ message: 'Route not found' }));

// Global error handler (e.g. multer errors)
app.use((err, req, res, next) => {
  console.error(err);
  res.status(err.status || 500).json({ message: err.message || 'Something went wrong' });
});

module.exports = app;
