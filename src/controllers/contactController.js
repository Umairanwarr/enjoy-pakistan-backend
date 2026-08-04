const { ContactMessage } = require('../models');

// POST /api/contact (public)
const createMessage = async (req, res) => {
  try {
    const { name, email, phone, subject, message } = req.body;
    if (!name || !email || !message) {
      return res.status(400).json({ message: 'Name, email and message are required' });
    }
    const msg = await ContactMessage.create({ name, email, phone, subject, message });
    res.status(201).json(msg);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// GET /api/contact (admin)
const getMessages = async (req, res) => {
  try {
    const messages = await ContactMessage.findAll({ order: [['createdAt', 'DESC']] });
    res.json(messages);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// PUT /api/contact/:id/read (admin)
const markAsRead = async (req, res) => {
  try {
    const msg = await ContactMessage.findByPk(req.params.id);
    if (!msg) return res.status(404).json({ message: 'Message not found' });
    msg.isRead = true;
    await msg.save();
    res.json(msg);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// DELETE /api/contact/:id (admin)
const deleteMessage = async (req, res) => {
  try {
    const msg = await ContactMessage.findByPk(req.params.id);
    if (!msg) return res.status(404).json({ message: 'Message not found' });
    await msg.destroy();
    res.json({ message: 'Message deleted' });
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

module.exports = { createMessage, getMessages, markAsRead, deleteMessage };
