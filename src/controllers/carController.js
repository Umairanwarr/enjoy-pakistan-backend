const { RentalCar } = require('../models');
const slugify = require('../utils/slugify');
const { absolutifyImages } = require('../utils/absoluteUrl');

// GET /api/cars (public - only active, unless ?all=true and admin)
const getCars = async (req, res) => {
  try {
    const { search, location, category, minPrice, maxPrice, status, all } = req.query;
    const where = {};

    if (!all) {
      where.status = 'active';
    } else if (status) {
      where.status = status;
    }

    if (search) {
      where.$or = [
        { name: { $regex: search, $options: 'i' } },
        { description: { $regex: search, $options: 'i' } },
        { location: { $regex: search, $options: 'i' } },
      ];
    }
    if (location) where.location = { $regex: location, $options: 'i' };
    if (category) where.category = category;
    if (minPrice || maxPrice) {
      where.price = {};
      if (minPrice) where.price.$gte = Number(minPrice);
      if (maxPrice) where.price.$lte = Number(maxPrice);
    }

    const cars = await RentalCar.find(where).sort({ createdAt: -1 });
    res.json(cars.map((c) => absolutifyImages(req, c)));
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// GET /api/cars/:slug
const getCarBySlug = async (req, res) => {
  try {
    const car = await RentalCar.findOne({ slug: req.params.slug });
    if (!car) return res.status(404).json({ message: 'Rental car not found' });
    res.json(absolutifyImages(req, car));
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// GET /api/cars/id/:id
const getCarById = async (req, res) => {
  try {
    const car = await RentalCar.findById(req.params.id);
    if (!car) return res.status(404).json({ message: 'Rental car not found' });
    res.json(absolutifyImages(req, car));
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// POST /api/cars (admin)
const createCar = async (req, res) => {
  try {
    const { name, description, location, category, price, duration, availability, status, featured } = req.body;
    if (!name || !location) {
      return res.status(400).json({ message: 'Name and location are required' });
    }
    let slug = slugify(name);
    const existing = await RentalCar.findOne({ slug });
    if (existing) slug = slugify(name, Date.now().toString().slice(-5));

    const files = req.files || [];
    const coverImage = files[0] ? `/uploads/cars/${files[0].filename}` : null;
    const images = files.map((f) => ({ imageUrl: `/uploads/cars/${f.filename}` }));

    const car = await RentalCar.create({
      name,
      slug,
      description,
      location,
      category,
      price: price || 0,
      duration: duration || 'Per Day',
      availability: availability || 'available',
      status: status || 'active',
      featured: featured === 'true' || featured === true,
      coverImage,
      images,
    });

    res.status(201).json(absolutifyImages(req, car));
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// PUT /api/cars/:id (admin)
const updateCar = async (req, res) => {
  try {
    const car = await RentalCar.findById(req.params.id);

    if (!car) {
      return res.status(404).json({ message: 'Rental car not found' });
    }

    const {
      name,
      description,
      location,
      category,
      price,
      duration,
      availability,
      status,
      featured,
    } = req.body;

    // Update slug if name changed
    if (name && name !== car.name) {
      let slug = slugify(name);

      const existing = await RentalCar.findOne({
        slug,
        _id: { $ne: car._id },
      });

      if (existing) {
        slug = slugify(name, Date.now().toString().slice(-5));
      }

      car.slug = slug;
    }

    // Update fields
    car.name = name ?? car.name;
    car.description = description ?? car.description;
    car.location = location ?? car.location;
    car.category = category ?? car.category;
    car.price = price ?? car.price;
    car.duration = duration ?? car.duration;
    car.availability = availability ?? car.availability;
    car.status = status ?? car.status;

    if (featured !== undefined) {
      car.featured =
        featured === true ||
        featured === "true" ||
        featured === 1 ||
        featured === "1";
    }

    // Handle uploaded images
    const files = req.files || [];

    if (files.length > 0) {
      // Update cover image with first uploaded image
      car.coverImage = `/uploads/cars/${files[0].filename}`;

      // Save uploaded images
      const imageData = files.map((file) => ({
        imageUrl: `/uploads/cars/${file.filename}`,
      }));
      car.images.push(...imageData);
    }

    await car.save();

    return res.json(absolutifyImages(req, car));
  } catch (err) {
    console.error(err);
    return res.status(500).json({
      message: "Server error",
      error: err.message,
    });
  }
};

// DELETE /api/cars/:id (admin)
const deleteCar = async (req, res) => {
  try {
    const car = await RentalCar.findByIdAndDelete(req.params.id);
    if (!car) return res.status(404).json({ message: 'Rental car not found' });
    res.json({ message: 'Rental car deleted successfully' });
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// DELETE /api/cars/:id/images/:imageId (admin)
const deleteCarImage = async (req, res) => {
  try {
    const car = await RentalCar.findById(req.params.id);
    if (!car) return res.status(404).json({ message: 'Car not found' });
    
    const image = car.images.id(req.params.imageId);
    if (!image) return res.status(404).json({ message: 'Image not found' });
    
    image.deleteOne();
    await car.save();
    res.json({ message: 'Image removed' });
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

module.exports = {
  getCars,
  getCarBySlug,
  getCarById,
  createCar,
  updateCar,
  deleteCar,
  deleteCarImage,
};
