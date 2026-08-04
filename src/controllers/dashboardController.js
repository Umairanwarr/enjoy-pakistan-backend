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
      Tour.count(),
      Tour.count({ where: { status: 'active' } }),
      RentalCar.count(),
      RentalCar.count({ where: { status: 'active' } }),
      Booking.count(),
      Booking.count({ where: { status: 'new' } }),
      ContactMessage.count(),
      ContactMessage.count({ where: { isRead: false } }),
    ]);

    const recentBookings = await Booking.findAll({ order: [['createdAt', 'DESC']], limit: 5 });

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
