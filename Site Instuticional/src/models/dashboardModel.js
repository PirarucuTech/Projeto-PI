var database = require("../database/config");

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
AND leitura.diahora IN ( SELECT MAX(leitura.diahora) 
FROM tanque 
JOIN sensor ON tanque.id = sensor.fkTanque AND tanque.fkEmpresa = sensor.fkTanqueEmpresa 
LEFT JOIN leitura ON sensor.id = leitura.fkSensor 
GROUP BY tanque.identificacao);
    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarMediasDaSemanas(idEmpresa) {
  let instrucaoSql = `
    select round(avg(leitura.umidade), 1) umidade, round(avg(leitura.temperatura),1) temperatura from tanque  
join sensor on tanque.id = sensor.fkTanque and tanque.fkEmpresa = sensor.fkTanqueEmpresa
left join leitura on sensor.id = leitura.fkSensor where tanque.fkEmpresa = ${idEmpresa}
group by leitura.nmrSemana
order by leitura.nmrSemana desc
limit 1;
    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarDadosDosGraficos(idEmpresa) {
  let instrucaoSql = `
    select count(leitura.temperatura) alertas, leitura.nmrSemana from tanque  
join sensor on tanque.id = sensor.fkTanque and tanque.fkEmpresa = sensor.fkTanqueEmpresa
left join leitura on sensor.id = leitura.fkSensor where tanque.fkEmpresa = ${idEmpresa} and (leitura.temperatura >=31 or leitura.temperatura <= 24 or leitura.umidade <=89)
group by leitura.nmrSemana
order by leitura.nmrSemana desc
limit 5;
    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarMedidaTempoReal(idEmpresa, idTanque) {
  let instrucaoSql = `
    select leitura.umidade, leitura.temperatura 
from tanque  
join sensor on tanque.id = sensor.fkTanque and tanque.fkEmpresa = sensor.fkTanqueEmpresa
left join leitura on sensor.id = leitura.fkSensor 
where tanque.fkEmpresa = ${idEmpresa} and tanque.identificacao = "${idTanque}"
order by leitura.diahora desc
limit 1;
    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarMedidasGraficoTempoReal(idEmpresa, idTanque) {
  let instrucaoSql = `
    select leitura.umidade, leitura.temperatura, DATE_FORMAT(leitura.diahora ,'%H:%i') hora
from tanque  
join sensor on tanque.id = sensor.fkTanque and tanque.fkEmpresa = sensor.fkTanqueEmpresa
left join leitura on sensor.id = leitura.fkSensor 
where tanque.fkEmpresa = ${idEmpresa} and tanque.identificacao = "${idTanque}"
order by leitura.diahora desc
limit 5;
    `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarHorasAlertasDias(idEmpresa, idTanque) {
  let instrucaoSql = `
select round(count(leitura.temperatura) * 15 / 60,1) alertas from tanque   
join sensor on tanque.id = sensor.fkTanque and tanque.fkEmpresa = sensor.fkTanqueEmpresa
left join leitura on sensor.id = leitura.fkSensor 
where tanque.fkEmpresa = ${idEmpresa} and 
(leitura.temperatura >=31 or leitura.temperatura <= 24 or leitura.umidade <=89)
and tanque.identificacao like "${idTanque}"
and leitura.diahora > DATE_SUB(now(), interval 2 day)
group by leitura.nmrSemana; `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function buscarAlertasSemana(idEmpresa, idTanque) {
  let instrucaoSql = `
select count(leitura.temperatura) alertas, leitura.nmrSemana  from tanque  
join sensor on tanque.id = sensor.fkTanque and tanque.fkEmpresa = sensor.fkTanqueEmpresa
left join leitura on sensor.id = leitura.fkSensor 
where tanque.fkEmpresa = ${idEmpresa} and 
(leitura.temperatura >=31 or leitura.temperatura <= 24 or leitura.umidade <=89)
and tanque.identificacao like "${idTanque}"
group by leitura.nmrSemana
order by leitura.nmrSemana
limit 6; `;
  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

module.exports = {
  buscarDadosAtuais,
  buscarMediasDaSemanas,
  buscarDadosDosGraficos,
  buscarMedidaTempoReal,
  buscarMedidasGraficoTempoReal,
  buscarHorasAlertasDias,
  buscarAlertasSemana
};
