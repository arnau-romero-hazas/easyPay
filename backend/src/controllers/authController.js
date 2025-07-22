const registerUser = require('../application/registerUser')
const loginUser = require('../application/loginUser')
const userRepository = require('../infrastructure/userRepository')
const hashService = require('../services/hashService')
const tokenService = require('../services/tokenService')

// Handle user registration
async function register(req, res) {
  const { name, username, email, password } = req.body

  try {
    const user = await registerUser(
      { name, username, email, password },
      { userRepository, hashService }
    )

    res.status(201).json({
      message: 'User registered successfully',
      user
    })
  } catch (error) {
    res.status(400).json({ error: error.message })
  }
}

// Handle user login
async function login(req, res) {
  const { email, password } = req.body

  try {
    const userWithToken = await loginUser(
      { email, password },
      { userRepository, hashService, tokenService }
    )

    res.status(200).json({
      message: 'Login successful',
      user: userWithToken
    })
  } catch (error) {
    res.status(401).json({ error: error.message })
  }
}

module.exports = {
  register,
  login
}