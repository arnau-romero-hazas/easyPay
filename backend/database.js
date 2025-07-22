// Import the mysql2 library
const mysql = require('mysql2')

// Create a connection pool to reuse connections efficiently
const pool = mysql.createPool({
  host: 'localhost',        // Docker expone MySQL en localhost (gracias al puerto)
  user: 'root',             // Usuario de MySQL (por defecto en nuestro docker-compose)
  password: 'admin123',     // Contraseña de MySQL (la definimos en el docker-compose)
  database: 'easypay',      // Nombre de la base de datos (también en el docker-compose)
  waitForConnections: true, // Espera conexiones si se excede el límite
  connectionLimit: 10,      // Máximo número de conexiones simultáneas
  queueLimit: 0             // Número máximo de solicitudes en espera (0 = sin límite)
})

// Export a Promise-based version of the pool
const promisePool = pool.promise()

module.exports = promisePool
