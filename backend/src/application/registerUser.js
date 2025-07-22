const User = require('../domain/User')

// Register a new user, enforcing unique email and username
async function registerUser({ name, username, email, password }, { userRepository, hashService }) {
  // Validate required fields
  if (!name || !username || !email || !password) {
    throw new Error('Missing registration data')
  }

  // Check if email is already in use
  const existingEmail = await userRepository.findByEmail(email)
  if (existingEmail) {
    throw new Error('Email already registered')
  }

  // Check if username is already in use
  const existingUsername = await userRepository.findByUsername(username)
  if (existingUsername) {
    throw new Error('Username already taken')
  }

  // Hash the password
  const passwordHash = await hashService.hash(password)

  // Create and save the user
  const user = new User({ name, username, email, passwordHash })
  const savedUser = await userRepository.save(user)

  return savedUser
}

module.exports = registerUser