const { DataTypes } = require('sequelize');
const sequelize = require('../config/db');

const Tour = sequelize.define('Tour', {
  id: { type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true },
  name: { type: DataTypes.STRING, allowNull: false },
  slug: { type: DataTypes.STRING, allowNull: false, unique: true },
  description: { type: DataTypes.TEXT, allowNull: true },
  location: { type: DataTypes.STRING, allowNull: false },
  category: { type: DataTypes.STRING, allowNull: true, defaultValue: 'General' },
  price: { type: DataTypes.DECIMAL(10, 2), allowNull: false, defaultValue: 0 },
  duration: { type: DataTypes.STRING, allowNull: true },
  availability: { type: DataTypes.INTEGER, allowNull: false, defaultValue: 0 },
  status: { type: DataTypes.ENUM('active', 'inactive'), defaultValue: 'active' },
  featured: { type: DataTypes.BOOLEAN, defaultValue: false },
  coverImage: { type: DataTypes.STRING, allowNull: true },
}, { tableName: 'tours' });

module.exports = Tour;
