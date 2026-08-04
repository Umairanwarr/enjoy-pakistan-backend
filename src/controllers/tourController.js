const { Op } = require('sequelize');
const { Tour, TourImage } = require('../models');
const slugify = require('../utils/slugify');

// GET /api/tours  (public - only active, unless ?all=true and admin)
const getTours = async (req, res) => {
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

    const tours = await Tour.findAll({
      where,
      include: [{ model: TourImage, as: 'images' }],
      order: [['createdAt', 'DESC']],
    });
    res.json(tours);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// GET /api/tours/:slug
const getTourBySlug = async (req, res) => {
  try {
    const tour = await Tour.findOne({
      where: { slug: req.params.slug },
      include: [{ model: TourImage, as: 'images' }],
    });
    if (!tour) return res.status(404).json({ message: 'Tour not found' });
    res.json(tour);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// GET /api/tours/id/:id  (admin edit lookup)
const getTourById = async (req, res) => {
  try {
    const tour = await Tour.findByPk(req.params.id, {
      include: [{ model: TourImage, as: 'images' }],
    });
    if (!tour) return res.status(404).json({ message: 'Tour not found' });
    res.json(tour);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// POST /api/tours (admin)
const createTour = async (req, res) => {
  try {
    const { name, description, location, category, price, duration, availability, status, featured } = req.body;
    if (!name || !location) {
      return res.status(400).json({ message: 'Name and location are required' });
    }
    let slug = slugify(name);
    const existing = await Tour.findOne({ where: { slug } });
    if (existing) slug = slugify(name, Date.now().toString().slice(-5));

    const files = req.files || [];
    const coverImage = files[0] ? `/uploads/tours/${files[0].filename}` : null;

    const tour = await Tour.create({
      name,
      slug,
      description,
      location,
      category,
      price: price || 0,
      duration,
      availability: availability || 0,
      status: status || 'active',
      featured: featured === 'true' || featured === true,
      coverImage,
    });

    if (files.length) {
      const images = files.map((f) => ({ tourId: tour.id, imageUrl: `/uploads/tours/${f.filename}` }));
      await TourImage.bulkCreate(images);
    }

    const fullTour = await Tour.findByPk(tour.id, { include: [{ model: TourImage, as: 'images' }] });
    res.status(201).json(fullTour);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// PUT /api/tours/:id (admin)
const updateTour = async (req, res) => {
  try {
    const tour = await Tour.findByPk(req.params.id);

    if (!tour) {
      return res.status(404).json({ message: 'Tour not found' });
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
    if (name && name !== tour.name) {
      let slug = slugify(name);

      const existing = await Tour.findOne({
        where: {
          slug,
          id: {
            [Op.ne]: tour.id,
          },
        },
      });

      if (existing) {
        slug = slugify(name, Date.now().toString().slice(-5));
      }

      tour.slug = slug;
    }

    // Update fields
    tour.name = name ?? tour.name;
    tour.description = description ?? tour.description;
    tour.location = location ?? tour.location;
    tour.category = category ?? tour.category;
    tour.price = price ?? tour.price;
    tour.duration = duration ?? tour.duration;
    tour.availability = availability ?? tour.availability;
    tour.status = status ?? tour.status;

    if (featured !== undefined) {
      tour.featured =
        featured === true ||
        featured === "true" ||
        featured === 1 ||
        featured === "1";
    }

    // Handle uploaded images
    const files = req.files || [];

    if (files.length > 0) {
      // Update cover image with first uploaded image
      tour.coverImage = `/uploads/tours/${files[0].filename}`;

      // Save all uploaded images
      const imageData = files.map((file) => ({
        tourId: tour.id,
        imageUrl: `/uploads/tours/${file.filename}`,
      }));

      await TourImage.bulkCreate(imageData);
    }

    await tour.save();

    const updatedTour = await Tour.findByPk(tour.id, {
      include: [
        {
          model: TourImage,
          as: "images",
        },
      ],
    });

    return res.json(updatedTour);
  } catch (err) {
    console.error(err);
    return res.status(500).json({
      message: "Server error",
      error: err.message,
    });
  }
};

// DELETE /api/tours/:id (admin)
const deleteTour = async (req, res) => {
  try {
    const tour = await Tour.findByPk(req.params.id);
    if (!tour) return res.status(404).json({ message: 'Tour not found' });
    await TourImage.destroy({ where: { tourId: tour.id } });
    await tour.destroy();
    res.json({ message: 'Tour deleted successfully' });
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// DELETE /api/tours/:id/images/:imageId (admin)
const deleteTourImage = async (req, res) => {
  try {
    const image = await TourImage.findOne({ where: { id: req.params.imageId, tourId: req.params.id } });
    if (!image) return res.status(404).json({ message: 'Image not found' });
    await image.destroy();
    res.json({ message: 'Image removed' });
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

module.exports = {
  getTours,
  getTourBySlug,
  getTourById,
  createTour,
  updateTour,
  deleteTour,
  deleteTourImage,
};
