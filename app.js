// creo server
const express = require('express')
const app = express()
const port = 3000

// MIDDLEWARES
// cors --> verifica che la richiesta sia autorizzata prima del trasferimento dati
const cors = require('cors')
const errorsHandler = require('./middlewares/errorHandler')
const notFound = require('./middlewares/notFound')

// ROUTERS
const characterRouter = require('./routers/characterRouter')

// Utilizzo i Middlewares --> gestione errore
app.use(cors())
app.use(errorsHandler)
app.use(notFound)

// accetto file json nella body req
app.use(express.json())

// prima porta
app.get('/', (req, res) => {
    res.send('Prima porta')
})

app.use('/characters', characterRouter)

// ascolto porta
app.listen(port, () => {
    console.log(`Server listening on port ${port}`)
})