const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const CarImage = sequelize.define('CarImage', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  carId: { type: DataTypes.INTEGER, allowNull: false },
  imageUrl: { type: DataTypes.STRING, allowNull: false },
}, { tableName: 'car_images' });

module.exports = CarImage;
