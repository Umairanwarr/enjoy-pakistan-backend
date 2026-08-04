const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Booking = sequelize.define('Booking', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  itemType: { type: DataTypes.ENUM('tour', 'car'), allowNull: false },
  itemId: { type: DataTypes.INTEGER, allowNull: false },
  itemName: { type: DataTypes.STRING, allowNull: false },
  customerName: { type: DataTypes.STRING, allowNull: true },
  customerPhone: { type: DataTypes.STRING, allowNull: true },
  message: { type: DataTypes.TEXT, allowNull: true },
  status: { type: DataTypes.ENUM('new', 'contacted', 'confirmed', 'cancelled'), defaultValue: 'new' },
}, { tableName: 'bookings' });

module.exports = Booking;
