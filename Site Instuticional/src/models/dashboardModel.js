var database = require("../database/config")

function buscarDadosAtuais(idEmpresa) {
    var instrucaoSql = `
SELECT  tanque.identificacao
       ,leitura.umidade
       ,leitura.temperatura
       ,leitura.diahora
FROM tanque
JOIN sensor
ON tanque.id = sensor.fkTanque AND tanque.fkEmpresa = sensor.fkTanqueEmpresa
LEFT JOIN leitura
ON sensor.id = leitura.fkSensor
WHERE tanque.fkEmpresa = ${idEmpresa}
AND leitura.diahora IN ( SELECT MAX(leitura.diahora) FROM tanque JOIN sensor ON tanque.id = sensor.fkTanque AND tanque.fkEmpresa = sensor.fkTanqueEmpresa LEFT JOIN leitura ON sensor.id = leitura.fkSensor GROUP BY tanque.identificacao);
    `;
    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarDadosAtuais
};