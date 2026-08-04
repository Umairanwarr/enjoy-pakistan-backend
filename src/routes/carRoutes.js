const express = require('express');
const router = express.Router();
const {
  getCars, getCarBySlug, getCarById, createCar, updateCar, deleteCar, deleteCarImage,
} = require('../controllers/carController');
const { protect } = require('../middleware/auth');
const { uploadCarImages } = require('../middleware/upload');

// Public
router.get('/', getCars);
router.get('/id/:id', getCarById);
router.get('/:slug', getCarBySlug);

// Admin
router.post('/', protect, uploadCarImages.array('images', 10), createCar);
router.put('/:id', protect, uploadCarImages.array('images', 10), updateCar);
router.delete('/:id', protect, deleteCar);
router.delete('/:id/images/:imageId', protect, deleteCarImage);

module.exports = router;
