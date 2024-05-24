// const mysql = require('mysql2/promise');

// const pool = mysql.createPool({
//   host: '0.0.0.0',
//   port: '3306',
//   user: 'admin',
//   password: 'admin1234',
//   database: 'online_shop'
// });

// module.exports = pool;
const mysql = require('mysql2');

const db = mysql.createConnection({
  host: '0.0.0.0',
  port: '3306',
  user: 'admin',
  password: 'admin1234',
  database: 'online_shop'
});

db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('MySQL connected...');
});

module.exports = db;