const User = require('../domain/User')

async function loginUser({ email, password }, { userRepository, hashService, tokenService }) {
  if (!email || !password) {
    throw new Error('Missing login data')
  }

  // Find user by email
  const user = await userRepository.findByEmail(email)
  if (!user) {
    throw new Error('Invalid credentials')
  }

  // Compare password
  const isMatch = await hashService.compare(password, user.passwordHash)
  if (!isMatch) {
    throw new Error('Invalid credentials')
  }

  // Generate auth token
  const token = tokenService.generate({ userId: user.id })

  // Return user DTO and token
  return {
    id: user.id,
    name: user.name,
    username: user.username,
    email: user.email,
    token
  }
}

module.exports = loginUser
