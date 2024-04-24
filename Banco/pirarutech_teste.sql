CREATE database pirarutech ;
USE pirarutech ;


CREATE TABLE Empresa (
  idEmpresa INT NOT NULL AUTO_INCREMENT,
  NomeEmpresa VARCHAR(45) NOT NULL,
  CEP CHAR(9) NULL,
  Logradouro VARCHAR(70) NULL,
  Numero INT NULL,
  Complemento VARCHAR(15) NULL,
  PRIMARY KEY (idEmpresa))
;

CREATE TABLE Usuario (
  idUsuario INT NOT NULL,
  NomeUsuario VARCHAR(45) NOT NULL,
  Email VARCHAR(45) NOT NULL,
  Senha VARCHAR(45) NOT NULL,
  fkEmpresa INT NULL,
  PRIMARY KEY (idUsuario),
  CONSTRAINT fk_Usuario_Empresa1
    FOREIGN KEY (fkEmpresa)
    REFERENCES Empresa (idEmpresa)
)
;

CREATE TABLE Tanque (
  idTanque INT NOT NULL auto_increment,
  Identificação VARCHAR(45) NULL,
  Empresa_idEmpresa INT NOT NULL,
  PRIMARY KEY (idTanque, Empresa_idEmpresa),
  CONSTRAINT fk_Tanque_Empresa1
    FOREIGN KEY (Empresa_idEmpresa)
    REFERENCES Empresa (idEmpresa)
)
;


CREATE TABLE Sensor (
  idSensor INT NOT NULL,
  Tipo VARCHAR(45) NOT NULL,
  Apelido VARCHAR(45) NULL,
  NumSerial VARCHAR(45) NOT NULL,
  fk_tanque INT NULL,
  PRIMARY KEY (idSensor),
  CONSTRAINT fk_Sensor_Tanque1
    FOREIGN KEY (fk_tanque)
    REFERENCES Tanque (idTanque)
    )
;



CREATE TABLE Leitura (
  idLeitura INT NOT NULL AUTO_INCREMENT,
  Umidade VARCHAR(45) NOT NULL,
  Temperatura VARCHAR(45) NOT NULL,
  DiaHora DATETIME NOT NULL,
  fk_sensor INT NOT NULL,
  PRIMARY KEY (idLeitura, fk_sensor),
  CONSTRAINT fk_Leitura_Sensor1
    FOREIGN KEY (fk_sensor)
    REFERENCES Sensor (idSensor)
)
;

insert into empresa (nomeEmpresa) values ('Empresa 1');
insert into tanque (identificação, empresa_idEmpresa) values ('Aquário de Estrela-do-mar', 1);

select * from usuario;
select * from empresa;
select * from tanque;
select * from sensor;
select * from leitura;

