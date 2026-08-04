require('dotenv').config();
const bcrypt = require('bcryptjs');
const sequelize = require('./config/db');
const { Admin, Setting } = require('./models');
const { DEFAULTS } = require('./controllers/settingController');

const run = async () => {
  try {
    await sequelize.authenticate();
    console.log('✅ MySQL connection established.');

    await sequelize.sync({ alter: true });
    console.log('✅ Tables synced.');

    const email = process.env.ADMIN_EMAIL || 'admin@enjoypakistantour.com';
    const existing = await Admin.findOne({ where: { email } });

    if (existing) {
      console.log(`ℹ️  Admin with email ${email} already exists. Skipping admin creation.`);
    } else {
      const hashed = await bcrypt.hash(process.env.ADMIN_PASSWORD || 'Admin@12345', 10);
      await Admin.create({
        name: process.env.ADMIN_NAME || 'Super Admin',
        email,
        password: hashed,
        role: 'admin',
      });
      console.log(`✅ Admin account created: ${email} / (password from .env)`);
    }

    // Seed default settings if not present
    for (const [key, value] of Object.entries(DEFAULTS)) {
      const [row, created] = await Setting.findOrCreate({ where: { key }, defaults: { value } });
      if (created) console.log(`✅ Setting seeded: ${key}`);
    }

    console.log('🎉 Seeding complete.');
    process.exit(0);
  } catch (err) {
    console.error('❌ Seeding failed:', err.message);
    process.exit(1);
  }
};

run();
