const express = require('express');
const router = express.Router();
const { createBooking, getBookings, updateBooking, deleteBooking } = require('../controllers/bookingController');
const { protect } = require('../middleware/auth');

router.post('/', createBooking); // public - fired when "Book Now" is clicked
router.get('/', protect, getBookings);
router.put('/:id', protect, updateBooking);
router.delete('/:id', protect, deleteBooking);

module.exports = router;
