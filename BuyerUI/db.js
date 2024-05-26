const mysql = require('mysql2/promise');

const pool = mysql.createPool({
  host: '0.0.0.0',
  port: '3306',
  user: 'admin',
  password: 'admin1234',
  database: 'online_shop',
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

module.exports = pool;