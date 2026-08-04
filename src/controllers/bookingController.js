const { Booking } = require('../models');

// POST /api/bookings (public - logs a booking when user clicks "Book Now")
const createBooking = async (req, res) => {
  try {
    const { itemType, itemId, itemName, customerName, customerPhone, message } = req.body;
    if (!itemType || !itemId || !itemName) {
      return res.status(400).json({ message: 'itemType, itemId and itemName are required' });
    }
    const booking = await Booking.create({
      itemType, itemId, itemName, customerName, customerPhone, message,
    });
    res.status(201).json(booking);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// GET /api/bookings (admin)
const getBookings = async (req, res) => {
  try {
    const { status, itemType } = req.query;
    const where = {};
    if (status) where.status = status;
    if (itemType) where.itemType = itemType;
    const bookings = await Booking.findAll({ where, order: [['createdAt', 'DESC']] });
    res.json(bookings);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// PUT /api/bookings/:id (admin - update status)
const updateBooking = async (req, res) => {
  try {
    const booking = await Booking.findByPk(req.params.id);
    if (!booking) return res.status(404).json({ message: 'Booking not found' });
    booking.status = req.body.status ?? booking.status;
    await booking.save();
    res.json(booking);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// DELETE /api/bookings/:id (admin)
const deleteBooking = async (req, res) => {
  try {
    const booking = await Booking.findByPk(req.params.id);
    if (!booking) return res.status(404).json({ message: 'Booking not found' });
    await booking.destroy();
    res.json({ message: 'Booking deleted' });
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

module.exports = { createBooking, getBookings, updateBooking, deleteBooking };
