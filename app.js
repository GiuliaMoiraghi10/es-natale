// creo server
const express = require('express')
const app = express()
const port = 3000

// cors --> verifica che la richiesta sia autorizzata prima del trasferimento dati
const cors = require('cors')

// prima porta
app.get('/', (req, res) => {
    res.send('Prima porta')
})

// ascolto porta
app.listen(port, () => {
    console.log(`Server listening on port ${port}`)
})