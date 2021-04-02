const express = require("express");
const patientController = require("../controller/npatientController");

const routes = express.Router();

//routes patient
//patientController.register(routes,"/patient");

routes.get("/patient", patientController.findAll)
routes.get("/patient/:id",  patientController.findOne)
routes.post("/patient", patientController.create)
routes.delete("/patient/:id",  patientController.delete)
routes.put("/patient/:id", patientController.update)


module.exports = routes;



