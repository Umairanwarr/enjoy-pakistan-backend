const mongoose = require('mongoose');

const tourImageSchema = new mongoose.Schema({
  imageUrl: { type: String, required: true },
}, {
  toJSON: {
    transform: (doc, ret) => {
      ret.id = ret._id;
      delete ret._id;
    }
  }
});

const tourSchema = new mongoose.Schema({
  name: { type: String, required: true },
  slug: { type: String, required: true, unique: true },
  description: { type: String, default: null },
  location: { type: String, required: true },
  category: { type: String, default: 'General' },
  price: { type: Number, required: true, default: 0 },
  duration: { type: String, default: null },
  availability: { type: Number, required: true, default: 0 },
  status: { type: String, enum: ['active', 'inactive'], default: 'active' },
  featured: { type: Boolean, default: false },
  coverImage: { type: String, default: null },
  images: [tourImageSchema],
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

const Tour = mongoose.model('Tour', tourSchema);
module.exports = Tour;
