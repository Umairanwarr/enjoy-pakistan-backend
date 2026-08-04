const mongoose = require('mongoose');

const bookingSchema = new mongoose.Schema({
  itemType: { type: String, enum: ['tour', 'car'], required: true },
  itemId: { type: String, required: true },
  itemName: { type: String, required: true },
  customerName: { type: String, default: null },
  customerPhone: { type: String, default: null },
  message: { type: String, default: null },
  status: { type: String, enum: ['new', 'contacted', 'confirmed', 'cancelled'], default: 'new' },
}, {
  timestamps: true,
  toJSON: {
    transform: (doc, ret) => {
      ret.id = ret._id;
      delete ret._id;
      delete ret.__v;
    }
  }
});

const Booking = mongoose.model('Booking', bookingSchema);
module.exports = Booking;
