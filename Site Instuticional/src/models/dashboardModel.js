var database = require("../database/config")

function buscarDadosAtuais(idEmpresa) {
    var instrucaoSql = `
    select tanque.identificacao, leitura.umidade, leitura.temperatura from tanque  
    join sensor on tanque.id = sensor.fkTanque and tanque.fkEmpresa = sensor.fkTanqueEmpresa
    left join leitura on sensor.id = leitura.fkSensor where tanque.fkEmpresa = ${idEmpresa};
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarDadosAtuais
};