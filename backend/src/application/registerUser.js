const User = require('../domain/User')

async function registerUser({ name, email, password }, { userRepository, hashService }) {
  if (!name || !email || !password) {
    throw new Error('Missing registration data')
  }

  const existingUser = await userRepository.findByEmail(email)
  if (existingUser) {
    throw new Error('Email already registered')
  }

  const passwordHash = await hashService.hash(password)

  const user = new User({ name, email, passwordHash })

  const savedUser = await userRepository.save(user)

  return savedUser
}

module.exports = registerUser