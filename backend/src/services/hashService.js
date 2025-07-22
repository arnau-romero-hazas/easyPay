const bcrypt = require('bcrypt')

// Simple hash service using bcrypt
const hashService = {
  // Hash a plaintext password
  async hash(password) {
    const saltRounds = 10
    return await bcrypt.hash(password, saltRounds)
  },

  // Compare a plaintext password with a hashed password
  async compare(password, hash) {
    return await bcrypt.compare(password, hash)
  }
}

module.exports = hashService