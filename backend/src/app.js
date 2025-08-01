// backend/src/app.js

const express = require('express')
const cors = require('cors')
const dotenv = require('dotenv')

// Load environment variables from .env file
dotenv.config()

const app = express()

// Middlewares
app.use(cors()) // Allow requests from any origin (dev mode)
app.use(express.json()) // Parse JSON bodies

app.use((req, res, next) => {
  console.log(`${req.method} ${req.url}`)
  next()
})

// authRoutes
const authRoutes = require('./routes/authRoutes')
app.use('/api/auth', authRoutes) // All auth endpoints go under /api/auth

// Payment routes
const paymentRoutes = require('./routes/paymentRoutes');
app.use('/api/payments', paymentRoutes);

// Start the server
const PORT = process.env.PORT || 3000
app.listen(PORT, '0.0.0.0', () => {
  console.log(`Server running on http://localhost:${PORT}`)
})
