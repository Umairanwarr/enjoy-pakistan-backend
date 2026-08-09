require('dotenv').config();
const mongoose = require('mongoose');
const { Admin } = require('./src/models');

async function updateAdminEmail() {
  try {
    await mongoose.connect(process.env.MONGO_URI);
    console.log('Connected to MongoDB');

    const admin = await Admin.findOne();
    if (admin) {
      console.log('Found admin:', admin.email);
      admin.email = 'enjoypakistantour694@gmail.com';
      await admin.save();
      console.log('Successfully updated admin email to enjoypakistantour694@gmail.com');
    } else {
      console.log('No admin found in DB');
    }
    
    process.exit(0);
  } catch (err) {
    console.error('Error:', err);
    process.exit(1);
  }
}

updateAdminEmail();
