// in questo file controllo le rotte --> index + show

// importo DB connection
const connection = require('../data/db')

// funzione index con connessione a sql --> visualizzare tutti gli elementi
function index(req, res) {
    const sql = `SELECT * FROM characters`

    connection.query(sql, (err, results) => {
        if (err) {
            res.status(500).json({ error: 'Database query failed' })
        } else {
            res.json(results)
        }
    })
}

module.exports = { index }