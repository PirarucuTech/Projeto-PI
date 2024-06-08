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
                    res.json(resultadoAutenticar[0]);
                }
               else if (resultadoAutenticar.length == 0) {
                    res.status(403).send("Email e/ou senha inválido(s)");
                    console.log('qq')
                } 
            }
        ).catch(
            function (erro) {
                res.status(500).json(erro.sqlMessage);
            }
        );


}

module.exports = {
    buscarDadosAtuais
}