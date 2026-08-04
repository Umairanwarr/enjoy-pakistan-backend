const { Tour, RentalCar, Booking, ContactMessage } = require('../models');

// GET /api/dashboard/stats (admin)
const getStats = async (req, res) => {
  try {
    const [
      totalTours, activeTours,
      totalCars, activeCars,
      totalBookings, newBookings,
      totalMessages, unreadMessages,
    ] = await Promise.all([
      Tour.countDocuments(),
      Tour.countDocuments({ status: 'active' }),
      RentalCar.countDocuments(),
      RentalCar.countDocuments({ status: 'active' }),
      Booking.countDocuments(),
      Booking.countDocuments({ status: 'new' }),
      ContactMessage.countDocuments(),
      ContactMessage.countDocuments({ isRead: false }),
    ]);

    const recentBookings = await Booking.find().sort({ createdAt: -1 }).limit(5);

    res.json({
      tours: { total: totalTours, active: activeTours },
      cars: { total: totalCars, active: activeCars },
      bookings: { total: totalBookings, new: newBookings },
      messages: { total: totalMessages, unread: unreadMessages },
      recentBookings,
    });
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

module.exports = { getStats };
