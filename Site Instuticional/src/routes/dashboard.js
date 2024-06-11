var express = require("express");
var router = express.Router();

var dashboardController = require("../controllers/dashboardController");

//Recebendo os dados do html e direcionando para a função cadastrar de dashboardController.js
router.post("/buscarDadosAtuais", function (req, res) {
    dashboardController.buscarDadosAtuais(req, res);
});

router.post("/buscarMediasDaSemanas", function (req, res) {
    dashboardController.buscarMediasDaSemanas(req, res);
});

router.post("/buscarDadosDosGraficos", function (req, res) {
    dashboardController.buscarDadosDosGraficos(req, res);
});

module.exports = router;