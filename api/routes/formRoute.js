const express = require("express");
const router = express.Router();
const form = require("../controllers/formController");

router.post("/save-form", form.saveForm);
router.post("/save-response", form.saveResponse);
router.post("/get-form", form.getForm);
router.post("/get-forms", form.getForms);

module.exports = router;