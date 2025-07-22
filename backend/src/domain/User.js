class User {
  constructor({ id = null, name, username, email, passwordHash }) {
    if (!name || !username || !email || !passwordHash) {
      throw new Error('Missing required fields to create a User')
    }

    this.id = id
    this.name = name
    this.username = username
    this.email = email
    this.passwordHash = passwordHash
  }
}

module.exports = User