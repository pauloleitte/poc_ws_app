const express = require("express");
const userController = require("../controller/userController");

const routes = express.Router();

//routes login
routes.post("/signup", userController.signup)
routes.post("/login", userController.login)

module.exports = routes;