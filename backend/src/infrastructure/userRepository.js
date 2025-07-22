const db = require('../../database') 
const User = require('../domain/User')

const userRepository = {
  // Find a user by email (used to prevent duplicate registrations)
  async findByEmail(email) {
    const [rows] = await db.query('SELECT * FROM users WHERE email = ?', [email])
    if (rows.length === 0) return null

    const row = rows[0]
    return new User({
      id: row.id,
      name: row.name,
      username: row.username,
      email: row.email,
      passwordHash: row.password_hash
    })
  },

  // Find a user by username (used to enforce unique usernames)
  async findByUsername(username) {
    const [rows] = await db.query('SELECT * FROM users WHERE username = ?', [username])
    if (rows.length === 0) return null

    const row = rows[0]
    return new User({
      id: row.id,
      name: row.name,
      username: row.username,
      email: row.email,
      passwordHash: row.password_hash
    })
  },

  // Save a new user to the database
  async save(user) {
    const [result] = await db.query(
      'INSERT INTO users (name, username, email, password_hash) VALUES (?, ?, ?, ?)',
      [user.name, user.username, user.email, user.passwordHash]
    )

    user.id = result.insertId
    return user
  }
}

module.exports = userRepository