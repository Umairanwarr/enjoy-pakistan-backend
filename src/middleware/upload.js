const multer = require('multer');
const path = require('path');
const fs = require('fs');

const makeUploader = (subfolder) => {
  const dest = path.join(__dirname, '..', '..', 'uploads', subfolder);
  if (!fs.existsSync(dest)) fs.mkdirSync(dest, { recursive: true });

  const storage = multer.diskStorage({
    destination: (req, file, cb) => cb(null, dest),
    filename: (req, file, cb) => {
      const unique = Date.now() + '-' + Math.round(Math.random() * 1e9);
      const ext = path.extname(file.originalname);
      cb(null, `${unique}${ext}`);
    },
  });

  const fileFilter = (req, file, cb) => {
    const allowed = /jpeg|jpg|png|webp|gif/;
    const extOk = allowed.test(path.extname(file.originalname).toLowerCase());
    const mimeOk = allowed.test(file.mimetype);
    if (extOk && mimeOk) return cb(null, true);
    cb(new Error('Only image files (jpg, jpeg, png, webp, gif) are allowed'));
  };

  return multer({ storage, fileFilter, limits: { fileSize: 5 * 1024 * 1024 } });
};

const uploadTourImages = makeUploader('tours');
const uploadCarImages = makeUploader('cars');

module.exports = { uploadTourImages, uploadCarImages };
