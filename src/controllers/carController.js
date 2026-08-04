const { Op } = require('sequelize');
const { RentalCar, CarImage } = require('../models');
const slugify = require('../utils/slugify');

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
      where[Op.or] = [
        { name: { [Op.like]: `%${search}%` } },
        { description: { [Op.like]: `%${search}%` } },
        { location: { [Op.like]: `%${search}%` } },
      ];
    }
    if (location) where.location = { [Op.like]: `%${location}%` };
    if (category) where.category = category;
    if (minPrice || maxPrice) {
      where.price = {};
      if (minPrice) where.price[Op.gte] = minPrice;
      if (maxPrice) where.price[Op.lte] = maxPrice;
    }

    const cars = await RentalCar.findAll({
      where,
      include: [{ model: CarImage, as: 'images' }],
      order: [['createdAt', 'DESC']],
    });
    res.json(cars);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// GET /api/cars/:slug
const getCarBySlug = async (req, res) => {
  try {
    const car = await RentalCar.findOne({
      where: { slug: req.params.slug },
      include: [{ model: CarImage, as: 'images' }],
    });
    if (!car) return res.status(404).json({ message: 'Rental car not found' });
    res.json(car);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// GET /api/cars/id/:id
const getCarById = async (req, res) => {
  try {
    const car = await RentalCar.findByPk(req.params.id, {
      include: [{ model: CarImage, as: 'images' }],
    });
    if (!car) return res.status(404).json({ message: 'Rental car not found' });
    res.json(car);
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
    const existing = await RentalCar.findOne({ where: { slug } });
    if (existing) slug = slugify(name, Date.now().toString().slice(-5));

    const files = req.files || [];
    const coverImage = files[0] ? `/uploads/cars/${files[0].filename}` : null;

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
    });

    if (files.length) {
      const images = files.map((f) => ({ carId: car.id, imageUrl: `/uploads/cars/${f.filename}` }));
      await CarImage.bulkCreate(images);
    }

    const fullCar = await RentalCar.findByPk(car.id, { include: [{ model: CarImage, as: 'images' }] });
    res.status(201).json(fullCar);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// PUT /api/cars/:id (admin)
const updateCar = async (req, res) => {
  try {
    const car = await RentalCar.findByPk(req.params.id);

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
        where: {
          slug,
          id: {
            [Op.ne]: car.id,
          },
        },
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
        carId: car.id,
        imageUrl: `/uploads/cars/${file.filename}`,
      }));

      await CarImage.bulkCreate(imageData);
    }

    await car.save();

    const updatedCar = await RentalCar.findByPk(car.id, {
      include: [
        {
          model: CarImage,
          as: "images",
        },
      ],
    });

    return res.json(updatedCar);
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
    const car = await RentalCar.findByPk(req.params.id);
    if (!car) return res.status(404).json({ message: 'Rental car not found' });
    await CarImage.destroy({ where: { carId: car.id } });
    await car.destroy();
    res.json({ message: 'Rental car deleted successfully' });
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// DELETE /api/cars/:id/images/:imageId (admin)
const deleteCarImage = async (req, res) => {
  try {
    const image = await CarImage.findOne({ where: { id: req.params.imageId, carId: req.params.id } });
    if (!image) return res.status(404).json({ message: 'Image not found' });
    await image.destroy();
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
