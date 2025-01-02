// in questo file controllo le rotte --> index + show

// importo DB connection
const connection = require('../data/db')

// funzione index con connessione a sql --> visualizzare tutti gli elementi
function index(req, res) {
    console.log('Lista Personaggi')
    // creo query da db
    const sql = `SELECT * FROM characters`

    connection.query(sql, (err, results) => {
        if (err) {
            return res.status(500).json({ error: 'Database query failed' })
        } else {
            res.json(results)
        }
    })
}

// funzione show con connessione a sql --> visualizzare un solo elemento tramite id
function show(req, res) {

    // recupero id dalla req
    const id = req.params.id

    // creo query con parametro non definito (evito injection, manomissione)
    const characterIdSql = `SELECT * FROM characters WHERE id = ?`

    // uso la query x trovare elemento tramite id
    connection.query(characterIdSql, [id], (err, characterRes) => {
        if (err)
            return res.status(500).json({ error: 'Database query failed' })

        if (characterRes.length === 0)
            return res.status(404).json({ error: 'Character not found' })

        // salvo il personaggio trovato tramite id in una variabile
        // il personaggio trovato corrisponde al primo el dell'array (indice 0)
        const character = characterRes[0]

        // ritorna un json con personaggio trovato tramite id
        res.json(character)
    })
}

module.exports = { index, show }