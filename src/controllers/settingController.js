const { Setting } = require('../models');

const DEFAULTS = {
  site_name: 'Enjoy Pakistan Tour',
  whatsapp_number: process.env.DEFAULT_WHATSAPP_NUMBER || '923001234567',
  contact_email: 'info@enjoypakistantour.com',
  contact_phone: '+92 300 1234567',
  address: 'Islamabad, Pakistan',
  facebook_url: '',
  instagram_url: '',
  hero_headline: 'Discover the Beauty of Pakistan',
  hero_subheadline: 'Unforgettable tours & reliable rental cars across Pakistan',
};

// GET /api/settings (public - returns all settings as key:value map)
const getSettings = async (req, res) => {
  try {
    const rows = await Setting.findAll();
    const settings = { ...DEFAULTS };
    rows.forEach((r) => { settings[r.key] = r.value; });
    res.json(settings);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

// PUT /api/settings (admin - bulk upsert of key/value pairs)
const updateSettings = async (req, res) => {
  try {
    const entries = Object.entries(req.body || {});
    for (const [key, value] of entries) {
      await Setting.upsert({ key, value: String(value ?? '') });
    }
    const rows = await Setting.findAll();
    const settings = { ...DEFAULTS };
    rows.forEach((r) => { settings[r.key] = r.value; });
    res.json(settings);
  } catch (err) {
    res.status(500).json({ message: 'Server error', error: err.message });
  }
};

module.exports = { getSettings, updateSettings, DEFAULTS };
