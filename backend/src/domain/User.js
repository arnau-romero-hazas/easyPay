class User {
  constructor({ id = null, name, email, passwordHash }) {
    if (!name || !email || !passwordHash) {
      throw new Error('Missing required fields to create a User')
    }

    this.id = id
    this.name = name
    this.email = email
    this.passwordHash = passwordHash
  }
}

module.exports = User