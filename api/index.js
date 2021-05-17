const express = require("express");
const router = express.Router();

router.use('/form', require('./routes/formRoute'));

module.exports = router;