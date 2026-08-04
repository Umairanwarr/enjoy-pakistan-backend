const mongoose = require('mongoose');

const carImageSchema = new mongoose.Schema({
  imageUrl: { type: String, required: true },
}, {
  toJSON: {
    transform: (doc, ret) => {
      ret.id = ret._id;
      delete ret._id;
    }
  }
});

const rentalCarSchema = new mongoose.Schema({
  name: { type: String, required: true },
  slug: { type: String, required: true, unique: true },
  description: { type: String, default: null },
  location: { type: String, required: true },
  category: { type: String, default: 'Sedan' },
  price: { type: Number, required: true, default: 0 },
  duration: { type: String, default: null },
  availability: { type: String, enum: ['available', 'unavailable'], default: 'available' },
  status: { type: String, enum: ['active', 'inactive'], default: 'active' },
  featured: { type: Boolean, default: false },
  coverImage: { type: String, default: null },
  images: [carImageSchema],
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

const RentalCar = mongoose.model('RentalCar', rentalCarSchema);
module.exports = RentalCar;
