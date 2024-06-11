var dashboardModel = require("../models/dashboardModel");


function buscarDadosAtuais(req, res) {
    var idEmpresa = req.body.idEmpresaServer;
    dashboardModel.buscarDadosAtuais(idEmpresa)
        .then(
            function (resultadoAutenticar) {
                console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String
                if (resultadoAutenticar.length > 0) {
                    console.log(resultadoAutenticar);
                    res.json(resultadoAutenticar);
                }
                else if (resultadoAutenticar.length == 0) {
                    res.status(403).send("Email e/ou senha inválido(s)");
                } 
            }
        ).catch(
            function (erro) {
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function buscarMediasDaSemanas(req, res) {
    var idEmpresa = req.body.idEmpresaServer;
    dashboardModel.buscarMediasDaSemanas(idEmpresa)
        .then(
            function (resultadoAutenticar) {
                console.log(`\nResultados encontrados: ${resultadoAutenticar.length}`);
                console.log(`Resultados: ${JSON.stringify(resultadoAutenticar)}`); // transforma JSON em String
                if (resultadoAutenticar.length > 0) {
                    console.log(resultadoAutenticar);
                    res.json(resultadoAutenticar);
                }
                else if (resultadoAutenticar.length == 0) {
                    res.status(403).send("Email e/ou senha inválido(s)");
                } 
            }
        ).catch(
            function (erro) {
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function buscarDadosDosGraficos(req, res) {
    var idEmpresa = req.body.idEmpresaServer;
    dashboardModel.buscarDadosDosGraficos(idEmpresa)
        .then(
            function (resultadoAutenticar) {
                if (resultadoAutenticar.length > 0) {
                    console.log(resultadoAutenticar);
                    res.json(resultadoAutenticar);
                }
                else if (resultadoAutenticar.length == 0) {
                    res.status(403).send("Email e/ou senha inválido(s)");
                } 
            }
        ).catch(
            function (erro) {
                res.status(500).json(erro.sqlMessage);
            }
        );
}

module.exports = {
    buscarDadosAtuais,
    buscarMediasDaSemanas,
    buscarDadosDosGraficos
}