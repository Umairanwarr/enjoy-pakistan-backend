const express = require('express');
const router = express.Router();
const { createMessage, getMessages, markAsRead, deleteMessage } = require('../controllers/contactController');
const { protect } = require('../middleware/auth');

router.post('/', createMessage); // public contact form
router.get('/', protect, getMessages);
router.put('/:id/read', protect, markAsRead);
router.delete('/:id', protect, deleteMessage);

module.exports = router;
