const mysql = require('mysql2')

const pool = mysql.createPool({
  host: '127.0.0.1', // o puedes probar también 'localhost'
  port: 3306,
  user: 'easypay_user',
  password: 'easypay_pass',
  database: 'easypay',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
})

const promisePool = pool.promise()

async function testConnection() {
  try {
    const [rows] = await promisePool.query('SELECT 1 + 1 AS result')
    console.log('DB connection successful! Result:', rows[0].result)
  } catch (error) {
    console.error('Error connecting to DB:', error)
  }
}

testConnection()
