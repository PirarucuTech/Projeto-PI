var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

//Recebendo os dados do html e direcionando para a função cadastrar de dashboardController.js
router.post("/buscarDadosAtuais", function (req, res) {
    dashboardController.buscarDadosAtuais(req, res);
});

module.exports = router;