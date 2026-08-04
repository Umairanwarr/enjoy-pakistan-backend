const cloudinary = require('cloudinary').v2;
const { CloudinaryStorage } = require('multer-storage-cloudinary');
const multer = require('multer');

// Configure cloudinary using env variables
cloudinary.config({
  cloud_name: process.env.CLOUDINARY_CLOUD_NAME,
  api_key: process.env.CLOUDINARY_API_KEY,
  api_secret: process.env.CLOUDINARY_API_SECRET
});

const makeUploader = (subfolder) => {
  const storage = new CloudinaryStorage({
    cloudinary: cloudinary,
    params: {
      folder: `enjoy-pakistan-tour/${subfolder}`,
      allowed_formats: ['jpg', 'png', 'jpeg', 'webp', 'gif']
    }
  });

  return multer({ storage, limits: { fileSize: 5 * 1024 * 1024 } });
};

const uploadTourImages = makeUploader('tours');
const uploadCarImages = makeUploader('cars');

module.exports = { uploadTourImages, uploadCarImages };
