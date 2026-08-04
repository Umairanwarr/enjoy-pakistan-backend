const express = require('express');
const router = express.Router();
const {
  getTours, getTourBySlug, getTourById, createTour, updateTour, deleteTour, deleteTourImage,
} = require('../controllers/tourController');
const { protect } = require('../middleware/auth');
const { uploadTourImages } = require('../middleware/upload');

// Public
router.get('/', getTours);
router.get('/id/:id', getTourById);
router.get('/:slug', getTourBySlug);

// Admin
router.post('/', protect, uploadTourImages.array('images', 10), createTour);
router.put('/:id', protect, uploadTourImages.array('images', 10), updateTour);
router.delete('/:id', protect, deleteTour);
router.delete('/:id/images/:imageId', protect, deleteTourImage);

module.exports = router;
