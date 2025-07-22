const jwt = require('jsonwebtoken')

// Generate JWT token from payload
function generate(payload) {
  return jwt.sign(payload, process.env.JWT_SECRET, { expiresIn: '7d' })
}

module.exports = {
  generate
}
