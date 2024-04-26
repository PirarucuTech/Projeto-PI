drop database if exists pirarutech;
drop database if exists pirarutech;

create database pirarutech;
use pirarutech;

create table usuario(
	idUsuario int primary key auto_increment,
    nomeUsuario varchar (45),
    email varchar (45),
    senha varchar (45)
);

create table empresa (
	idEmpresa int primary key auto_increment,
    nomeEmpresa varchar (45), 
    cep char(9),
    logradouro varchar(70),
    numero int,
    complemento varchar (15),
    fkUsuario int,
    foreign key (fkUsuario) references usuario (idUsuario)
)auto_increment = 100;

create table tanque(
	idTanque int auto_increment,
    identificacao varchar (45),
    fkEmpresa int not null,
    primary key (idTanque, fkEmpresa),
    foreign key (fkEmpresa) references empresa (idEmpresa)
)auto_increment = 1500;

create table sensor(
	idSensor int primary key auto_increment,
    tipo varchar (45),
    apelido varchar (45),
    numSerial varchar (45),
    fkTanque int,
    fkTanqueEmpresa int,
    foreign key (fkTanque, fkTanqueEmpresa) references tanque (idTanque, fkEmpresa)
)auto_increment = 3500;

create table leitura(
	idLeitura int primary key auto_increment,
    umidade decimal (3,1),
    temperatura decimal(3,1),
    diaHora datetime,
    fkSensor int,
    foreign key (fkSensor) references sensor (idSensor)
)auto_increment = 6500;

insert into usuario (nomeUsuario, email, senha)
values ("Emma Stone", "emmastone@gmail.com", "emmastone123"),
("Mia Goth", "miagoth@gmail.com", "miagoth123"),
("Willem Dafoe", "willemdafoe@gmail.com", "willemdafoe123");

insert into empresa (nomeEmpresa, cep, logradouro, numero, complemento, fkUsuario)
values ('Emma Tech', '12345-678', 'Rua Principal', 123, 'Sala 101', 1),
    ('Goth Farm', '54321-987', 'Avenida Secundária', 456, 'Andar 2', 2),
    ('Dafoe Psci', '98765-432', 'Rua Paralela', 789, 'Bloco C', 3);
    
insert into tanque (identificacao, fkEmpresa)
values ("identificacao1A", 100),
("identificacao2A", 100),
("identificacao3A", 100),
("identificacao1B", 101),
("identificacao2B", 101),
("identificacao3B", 101),
("identificacao1C", 102),
("identificacao2C", 102),
("identificacao3C", 102);

insert into sensor (tipo, apelido, numSerial, fkTanque)
values 		("DHT11", "Temp. e Umi.", "111111", 1500),
			("DHT11", "Temp. e Umi.", "333333", 1501),
			("DHT11", "Temp. e Umi.", "111111", 1500),
			("DHT11", "Temp. e Umi.", "333333", 1501),
			("DHT11", "Temp. e Umi.", "111111", 1500),
			("DHT11", "Temp. e Umi.", "333333", 1501),
			("DHT11", "Temp. e Umi.", "555555", 1502);

insert into leitura (umidade, temperatura, diaHora, fkSensor)
values 		(80.0, 35.5, "2024-04-09 11:05:29", 3500),
			(80.0, 31.2, '2024-04-09 12:15:00', 3501),
			(80.0, 30.5, '2024-04-09 13:30:45', 3502),
			(80.0, 33.1, '2024-04-09 14:45:20', 3503),
			(80.0, 29.8, '2024-04-09 16:00:00', 3504),
			(80.0, 28.7, '2024-04-09 17:15:30', 3505);
    
select * from usuario;
select * from empresa;
select * from tanque;
select * from sensor;
select * from leitura;

select * from usuario
join empresa on fkUsuario = idUsuario
join tanque on fkEmpresa = idEmpresa
join sensor on fkTanque = idTanque
join leitura on fkSensor = idSensor;