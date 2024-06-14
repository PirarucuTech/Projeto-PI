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
    umidade decimal (4,1),
    temperatura decimal(4,1),
    diaHora datetime,
    fkSensor int comment 'Identificação da tabela sensor',
    nmrSemana int ,
    foreign key (fkSensor) references sensor (id)
)auto_increment = 6500, comment 'Tabela responsavel pelos dados da leitura dos sensores';


insert into usuario (nomeUsuario, email, senha)
values ("Emma Stone", "emmastone@gmail.com", "emmastone123");

insert into empresa (nomeEmpresa, cep, logradouro, numero, complemento, fkUsuario)
values ('Emma Tech', '12345-678', 'Rua Principal', 123, 'Sala 101', 1);

insert into tanque (identificacao, fkEmpresa)
values ("identificacao1A", 100),
("identificacao2A", 100),
("identificacao3A", 100),
("identificacao4A", 100),
("identificacao4B", 100),
("identificacao4C", 100),
("identificacao5A", 100),
("identificacao6A", 100),
("identificacao6B", 100),
("identificacao7A", 100);

insert into sensor (id, tipo, apelido, numSerial, fkTanque, fkTanqueEmpresa)
values 
(3500,'DHT11', 'Temp. e Umi', 6666, 1500, 100),
(3501,'DHT11', 'Temp. e Umi', 6667, 1501, 100),
(3502,'DHT11', 'Temp. e Umi', 6668, 1502, 100),
(3503,'DHT11', 'Temp. e Umi', 6669, 1503, 100),
(3504,'DHT11', 'Temp. e Umi', 6670, 1504, 100),
(3505,'DHT11', 'Temp. e Umi', 6671, 1505, 100),
(3506,'DHT11', 'Temp. e Umi', 6672, 1506, 100),
(3507,'DHT11', 'Temp. e Umi', 6673, 1507, 100),
(3508,'DHT11', 'Temp. e Umi', 6674, 1508, 100),
(3509,'DHT11', 'Temp. e Umi', 6675, 1509, 100);

insert into leitura (umidade, temperatura, diaHora, fkSensor, nmrSemana)
values 		(90.0, 30.5, "2024-06-13 11:05:29", 3500, WEEK(CURDATE())),
			(90.0, 31.2, '2024-06-13 12:15:00', 3501, WEEK(CURDATE())),
			(90.0, 30.5, '2024-06-13 13:30:45', 3502, WEEK(CURDATE())),
			(90.0, 23.1, '2024-06-13 14:45:20', 3503, WEEK(CURDATE())),
			(90.0, 29.8, '2024-06-13 16:00:00', 3504, WEEK(CURDATE())),
			(30.0, 28.7, '2024-06-13 17:15:30', 3505, WEEK(CURDATE())),
            (78.0, 22.7, '2024-06-13 17:15:30', 3506, WEEK(CURDATE())),
            (94.0, 35.7, '2024-06-13 17:15:30', 3507, WEEK(CURDATE())),
            (92.0, 19.7, '2024-06-13 17:15:30', 3508, WEEK(CURDATE())),
            (72.0, 28.7, '2024-06-13 17:15:30', 3509, WEEK(CURDATE()));
            
            
insert into leitura (umidade, temperatura, diaHora, fkSensor, nmrSemana)
values 		(90.0, 30.5, "2024-06-02 11:05:29", 3500, 22),
			(90.0, 31.2, '2024-06-02 12:15:00', 3501, 22),
			(90.0, 30.5, '2024-06-02 13:30:45', 3502, 22),
			(90.0, 23.1, '2024-06-02 14:45:20', 3503, 22),
			(90.0, 29.8, '2024-06-02 16:00:00', 3504, 22),
			(90.0, 28.7, '2024-06-02 17:15:30', 3505, 22),
            (90.0, 28.7, '2024-06-02 17:15:30', 3506, 22),
            (90.0, 28.7, '2024-06-02 17:15:30', 3507, 22),
            (90.0, 28.7, '2024-06-02 17:15:30', 3508, 22),
            (90.0, 28.7, '2024-06-02 17:15:30', 3509, 22);
insert into leitura (umidade, temperatura, diaHora, fkSensor, nmrSemana)
values 		(60.0, 30.5, "2024-05-26 11:05:29", 3500, 21),
			(60.0, 31.2, '2024-05-26 12:15:00', 3501, 21),
			(90.0, 30.5, '2024-05-26 13:30:45', 3502, 21),
			(90.0, 35.1, '2024-05-26 14:45:20', 3503, 21),
			(90.0, 29.8, '2024-05-26 16:00:00', 3504, 21),
			(90.0, 28.7, '2024-05-26 17:15:30', 3505, 21),
            (90.0, 28.7, '2024-05-26 17:15:30', 3506, 21),
            (90.0, 28.7, '2024-05-26 17:15:30', 3507, 21),
            (90.0, 28.7, '2024-05-26 17:15:30', 3508, 21),
            (90.0, 28.7, '2024-05-26 17:15:30', 3509, 21);
            
insert into leitura (umidade, temperatura, diaHora, fkSensor, nmrSemana)
values 		(90.0, 30.5, "2024-05-19 11:05:29", 3500, 20),
			(90.0, 31.2, '2024-05-19 12:15:00', 3501, 20),
			(90.0, 30.5, '2024-05-19 13:30:45', 3502, 20),
			(90.0, 35.1, '2024-05-19 14:45:20', 3503, 20),
			(90.0, 35.8, '2024-05-19 16:00:00', 3504, 20),
			(90.0, 35.7, '2024-05-19 17:15:30', 3505, 20),
            (90.0, 35.7, '2024-05-19 17:15:30', 3506, 20),
            (90.0, 28.7, '2024-05-19 17:15:30', 3507, 20),
            (90.0, 28.7, '2024-05-19 17:15:30', 3508, 20),
            (90.0, 28.7, '2024-05-19 17:15:30', 3509, 20);


