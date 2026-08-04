const bcrypt = require('bcryptjs');
const { Admin } = require('../models');
const generateToken = require('../utils/generateToken');

// POST /api/auth/login
const login = async (req, res) => {
  try {
    const { email, password } = req.body;
    if (!email || !password) {
      return res.status(400).json({ message: 'Email and password are required' });
    }
    const admin = await Admin.findOne({ where: { email } });
    if (!admin) {
      return res.status(401).json({ message: 'Invalid email or password' });
    }
    const isMatch = await bcrypt.compare(password, admin.password);
    if (!isMatch) {
      return res.status(401).json({ message: 'Invalid email or password' });
    }
    const token = generateToken(admin.id);
    res.json({
      token,
      admin: { id: admin.id, name: admin.name, email: admin.email, role: admin.role },
    });
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// GET /api/auth/me
const me = async (req, res) => {
  res.json({ admin: req.admin });
};

// PUT /api/auth/change-password
const changePassword = async (req, res) => {
  try {
    const { currentPassword, newPassword } = req.body;
    const admin = await Admin.findByPk(req.admin.id);
    const isMatch = await bcrypt.compare(currentPassword, admin.password);
    if (!isMatch) return res.status(400).json({ message: 'Current password is incorrect' });
    const hashed = await bcrypt.hash(newPassword, 10);
    admin.password = hashed;
    await admin.save();
    res.json({ message: 'Password updated successfully' });
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

module.exports = { login, me, changePassword };
