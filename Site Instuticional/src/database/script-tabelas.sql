drop database if exists pirarutech;

create database if not exists pirarutech;
use pirarutech;

create table usuario(
	id int primary key auto_increment comment 'Identificação de usuário',
    nomeUsuario varchar (45),
    email varchar (45),
    senha varchar (45) 
) comment 'Tabela responsável pelos dados do cadastro dos usuarios';

create table empresa (
	id int primary key auto_increment comment 'Identificação da empresa',
    nomeEmpresa varchar (45), 
    cep char(9),
    logradouro varchar(70),
    numero int,
    complemento varchar (15),
    fkUsuario int comment 'Identificação da tabela usuario',
    foreign key (fkUsuario) references usuario (id)
)auto_increment = 100, comment 'Tabela responsavel pelos dados da empresa';

create table tanque(
	id int auto_increment comment 'Identificação dos tanques', 
    identificacao varchar (45),
    fkEmpresa int not null comment 'Identificação da tabela empresa',
    primary key (id, fkEmpresa),
    foreign key (fkEmpresa) references empresa (id)
)auto_increment = 1500, comment 'Tabela responsavel pelos dados dos tanques';

create table sensor(
	id int primary key auto_increment comment 'Identificação do sensor',
    tipo varchar (45),
    apelido varchar (45),
    numSerial varchar (45),
    fkTanque int comment 'Identificação da tabela tanque',
    fkTanqueEmpresa int comment 'Identifição da tabela tanque da empresa',
    foreign key (fkTanque, fkTanqueEmpresa) references tanque (id, fkEmpresa)
)auto_increment = 3500, comment 'Tabela responsavel pelos dados do sensor';

create table leitura(
	id int primary key auto_increment,
    umidade decimal (3,1),
    temperatura decimal(3,1),
    diaHora datetime,
    fkSensor int comment 'Identificação da tabela sensor',
    nmrSemana int ,
    foreign key (fkSensor) references sensor (id)
)auto_increment = 6500, comment 'Tabela responsavel pelos dados da leitura dos sensores';

SELECT WEEK(CURDATE());
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

insert into sensor (tipo, apelido, numSerial, fkTanque, fkTanqueEmpresa)
values 		("DHT11", "Temp. e Umi.", "111111", 1500, 100),
			("DHT11", "Temp. e Umi.", "333333", 1501, 100),
			("DHT11", "Temp. e Umi.", "111111", 1503, 101),
			("DHT11", "Temp. e Umi.", "333333", 1504, 101),
			("DHT11", "Temp. e Umi.", "111111", 1506, 102),
			("DHT11", "Temp. e Umi.", "333333", 1507, 102),
			("DHT11", "Temp. e Umi.", "555555", 1508, 102);

insert into leitura (umidade, temperatura, diaHora, fkSensor, nmrSemana)
values 		(80.0, 35.5, "2024-04-09 11:05:29", 3500, WEEK(CURDATE())),
			(80.0, 31.2, '2024-04-09 12:15:00', 3501, WEEK(CURDATE())),
			(80.0, 30.5, '2024-04-09 13:30:45', 3502, WEEK(CURDATE())),
			(80.0, 33.1, '2024-04-09 14:45:20', 3503, WEEK(CURDATE())),
			(80.0, 29.8, '2024-04-09 16:00:00', 3504, WEEK(CURDATE())),
			(80.0, 28.7, '2024-04-09 17:15:30', 3505, WEEK(CURDATE()));
            
            insert into leitura (umidade, temperatura, diaHora, fkSensor, nmrSemana)
values 		(58.0, 28.5, "2024-04-09 11:08:29", 3500, WEEK(CURDATE())),
(60.0, 30.5, "2024-04-09 11:09:29", 3500, WEEK(CURDATE())),
(80.0, 22.5, "2024-04-09 11:10:29", 3500, WEEK(CURDATE())),
(90.0, 28.5, "2024-04-09 11:15:29", 3500, WEEK(CURDATE())),
(59.0, 26.5, "2024-04-09 11:16:29", 3500, WEEK(CURDATE()));