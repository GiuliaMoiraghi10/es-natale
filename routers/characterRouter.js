// in questo file registro le rotte --> index + show

const express = require('express')
const router = express.Router()

//importo file controller
const characterController = require('../controllers/characterController')

//index
router.get('/', characterController.index)

//show
router.get('/:id', characterController.show)

module.exports = router


