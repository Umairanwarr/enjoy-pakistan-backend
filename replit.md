# Enjoy Pakistan Tour — Backend API

A Node.js/Express REST API for a Pakistan tour management platform. Handles tours, rental cars, bookings, contact messages, admin auth, and settings.

## Stack

- **Runtime**: Node.js 20
- **Framework**: Express 4
- **Database**: MongoDB (external, via Mongoose)
- **Auth**: JWT (jsonwebtoken + bcryptjs)
- **File uploads**: Multer (stored in `uploads/`)

## How to run

Start the **Start application** workflow — it runs `node src/server.js`.

The server connects to MongoDB on startup using `MONGO_URI`.

Health check:
```
GET /api/health  →  { "status": "ok", "message": "Enjoy Pakistan Tour API is running" }
```

## API routes

| Prefix            | Description              |
|-------------------|--------------------------|
| `/api/auth`       | Admin login / register   |
| `/api/tours`      | Tour CRUD                |
| `/api/cars`       | Rental car CRUD          |
| `/api/bookings`   | Booking management       |
| `/api/contact`    | Contact messages         |
| `/api/settings`   | Site settings            |
| `/api/dashboard`  | Dashboard stats          |
| `/uploads/*`      | Static uploaded images   |

## Environment variables

| Key                      | Notes                                         |
|--------------------------|-----------------------------------------------|
| `PORT`                   | 5000                                          |
| `MONGO_URI`              | **Replit Secret** — MongoDB Atlas connection string |
| `JWT_SECRET`             | **Replit Secret** — set in Secrets panel      |
| `JWT_EXPIRES_IN`         | 7d                                            |
| `CLIENT_URL`             | Frontend origin for CORS                      |
| `DEFAULT_WHATSAPP_NUMBER`| E.164 without +                               |

## Deployment

Configured as **Autoscale** (free plan compatible). Publishes via Replit's deploy button.

## User preferences

_None recorded yet._
