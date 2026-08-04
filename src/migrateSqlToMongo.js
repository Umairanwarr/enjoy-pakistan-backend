const fs = require('fs');
const mongoose = require('mongoose');
require('dotenv').config();
const { Admin, Booking, ContactMessage, RentalCar, Setting, Tour } = require('./models');

const parseInsert = (sql) => {
  const tables = {};
  const insertRegex = /INSERT INTO `([^`]+)` \(([^)]+)\) VALUES\s*([\s\S]+?);/g;
  let match;
  while ((match = insertRegex.exec(sql)) !== null) {
    const tableName = match[1];
    const columns = match[2].split(',').map(c => c.trim().replace(/`/g, ''));
    const valuesStr = match[3];

    if (!tables[tableName]) tables[tableName] = [];

    let inString = false;
    let tuple = [];
    let current = '';
    let i = 0;
    while (i < valuesStr.length) {
      const char = valuesStr[i];
      if (char === "'" && valuesStr[i - 1] !== '\\') {
        inString = !inString;
        current += char;
      } else if (char === '(' && !inString) {
        tuple = [];
        current = '';
      } else if (char === ')' && !inString) {
        tuple.push(current.trim());
        const row = {};
        columns.forEach((col, idx) => {
          let val = tuple[idx];
          if (val === 'NULL') val = null;
          else if (val && val.startsWith("'") && val.endsWith("'")) {
            val = val.slice(1, -1).replace(/\\'/g, "'");
          } else if (val && !isNaN(val)) {
            val = Number(val);
          }
          row[col] = val;
        });
        tables[tableName].push(row);
        current = '';
      } else if (char === ',' && !inString) {
        if (current.trim() !== '' || tuple.length > 0) {
           tuple.push(current.trim());
           current = '';
        }
      } else {
        current += char;
      }
      i++;
    }
  }
  return tables;
};

const run = async () => {
  try {
    const sqlContent = fs.readFileSync(__dirname + '/../enjoy_pakistan_tour.sql', 'utf8');
    const data = parseInsert(sqlContent);
    
    await mongoose.connect(process.env.MONGO_URI);
    console.log('✅ MongoDB connected');
    
    await Admin.deleteMany({});
    await Booking.deleteMany({});
    await ContactMessage.deleteMany({});
    await RentalCar.deleteMany({});
    await Setting.deleteMany({});
    await Tour.deleteMany({});

    if (data.admins) {
      for (const row of data.admins) {
        await Admin.create({
          name: row.name,
          email: row.email,
          password: row.password,
          role: row.role,
        });
      }
      console.log(`✅ Migrated ${data.admins.length} admins`);
    }

    if (data.bookings) {
      for (const row of data.bookings) {
        await Booking.create({
          itemType: row.item_type,
          itemId: String(row.item_id),
          itemName: row.item_name,
          customerName: row.customer_name,
          customerPhone: row.customer_phone,
          message: row.message,
          status: row.status,
        });
      }
      console.log(`✅ Migrated ${data.bookings.length} bookings`);
    }

    if (data.contact_messages) {
      for (const row of data.contact_messages) {
        await ContactMessage.create({
          name: row.name,
          email: row.email,
          phone: row.phone,
          subject: row.subject,
          message: row.message,
          isRead: Boolean(row.isRead),
        });
      }
      console.log(`✅ Migrated ${data.contact_messages.length} contact messages`);
    }

    if (data.settings) {
      for (const row of data.settings) {
        await Setting.create({
          key: row.key,
          value: row.value,
        });
      }
      console.log(`✅ Migrated ${data.settings.length} settings`);
    }

    if (data.tours) {
      for (const row of data.tours) {
        const images = (data.tour_images || [])
            .filter(img => img.tour_id === row.id)
            .map(img => ({ imageUrl: img.image_url }));

        await Tour.create({
          name: row.name,
          slug: row.slug,
          description: row.description,
          location: row.location,
          category: row.category,
          price: row.price,
          duration: row.duration,
          availability: row.availability,
          status: row.status,
          featured: Boolean(row.featured),
          coverImage: row.cover_image,
          images: images
        });
      }
      console.log(`✅ Migrated ${data.tours.length} tours (and their images)`);
    }

    if (data.rental_cars) {
      for (const row of data.rental_cars) {
        const images = (data.car_images || [])
            .filter(img => img.car_id === row.id)
            .map(img => ({ imageUrl: img.image_url }));

        await RentalCar.create({
          name: row.name,
          slug: row.slug,
          description: row.description,
          location: row.location,
          category: row.category,
          price: row.price,
          duration: row.duration,
          availability: row.availability,
          status: row.status,
          featured: Boolean(row.featured),
          coverImage: row.cover_image,
          images: images
        });
      }
      console.log(`✅ Migrated ${data.rental_cars.length} cars (and their images)`);
    }

    console.log('🎉 Migration completed successfully!');
    process.exit(0);

  } catch (err) {
    console.error('❌ Migration failed:', err);
    process.exit(1);
  }
};

run();
