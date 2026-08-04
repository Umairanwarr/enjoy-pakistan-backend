/**
 * Converts a relative /uploads/... path to a full URL using the incoming request.
 * Falls back to SERVER_URL env var if set (useful for scripts/seeds running outside HTTP context).
 */
const toAbsoluteUrl = (req, relativePath) => {
  if (!relativePath) return null;
  // Already absolute
  if (relativePath.startsWith('http://') || relativePath.startsWith('https://')) {
    return relativePath;
  }
  const base = process.env.SERVER_URL ||
    `${req.protocol}://${req.get('host')}`;
  return `${base}${relativePath}`;
};

/**
 * Transforms all image fields in a plain tour/car object to absolute URLs.
 */
const absolutifyImages = (req, doc) => {
  if (!doc) return doc;
  const obj = doc.toJSON ? doc.toJSON() : { ...doc };
  if (obj.coverImage) obj.coverImage = toAbsoluteUrl(req, obj.coverImage);
  if (Array.isArray(obj.images)) {
    obj.images = obj.images.map((img) => ({
      ...img,
      imageUrl: toAbsoluteUrl(req, img.imageUrl),
    }));
  }
  return obj;
};

module.exports = { toAbsoluteUrl, absolutifyImages };
