const express = require('express');
const router = express.Router();
const { getSettings, updateSettings } = require('../controllers/settingController');
const { protect } = require('../middleware/auth');

router.get('/', getSettings); // public - used by frontend for WhatsApp number etc.
router.put('/', protect, updateSettings);

module.exports = router;
