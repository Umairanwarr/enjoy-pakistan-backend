const sequelize = require('../config/db');
const Admin = require('./Admin');
const Tour = require('./Tour');
const RentalCar = require('./RentalCar');
const TourImage = require('./TourImage');
const CarImage = require('./CarImage');
const Booking = require('./Booking');
const ContactMessage = require('./ContactMessage');
const Setting = require('./Setting');

// Associations
Tour.hasMany(TourImage, { foreignKey: 'tourId', as: 'images', onDelete: 'CASCADE' });
TourImage.belongsTo(Tour, { foreignKey: 'tourId' });

RentalCar.hasMany(CarImage, { foreignKey: 'carId', as: 'images', onDelete: 'CASCADE' });
CarImage.belongsTo(RentalCar, { foreignKey: 'carId' });

module.exports = {
  sequelize,
  Admin,
  Tour,
  RentalCar,
  TourImage,
  CarImage,
  Booking,
  ContactMessage,
  Setting,
};
