const mysql = require('mysql2')
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'Giuggiola10',
    database: 'popverso_db',
})

connection.connect((err) => {
    if (err) throw err;
    console.log('Connessione riuscita')
})

module.exports = connection