// Needed Resources
const express = require("express");
const router = new express.Router();

const accountController = require("../controllers/accountController");
const utilities = require("../utilities");


// router.get("/", utilities.checkLogin, utilities.handleErrors(accountController.buildAccountManagementView));

// Route to build account view
router.get("/login", utilities.handleErrors(accountController.buildLogin));


// Registration handlers
router.get("/registration", utilities.handleErrors(accountController.buildRegister));
router.post('/register', utilities.handleErrors(accountController.registerAccount));

module.exports = router;