create database sprint1;
use sprint1;

-- CRIANDO TABELAS --
create table Tanque(
id int primary key auto_increment,
descricao varchar(45)
);

insert into Tanque (descricao)
values ("30000L"),
	   ("20000L"),
       ("18000L"),
       ("22000L"),
       ("25000L"),
       ("30000L");
       
       
create table Sensor(
id int primary key auto_increment,
serial_sensor varchar(45),
tipo varchar(45),
fkTanque int,
foreign key (fkTanque) references Tanque(id)
);

insert into Sensor (serial_sensor, tipo, fkTanque)
values ("x01", "DHT-11", 1),
	   ("x02", "DHT-11", 2),
       ("x03", "DHT-11", 3),
       ("x04", "DHT-11", 4),
       ("x05", "DHT-11", 5),
       ("x06", "DHT-11", 6);
       
create table Leituras(
fkSensor INT,
sequencia INT,
data datetime,
medicao varchar(50),
primary key (fkSensor, sequencia),
foreign key (fkSensor) references Sensor(id)
);

insert into Leituras (fkSensor, sequencia, data, medicao)
values (1, 1, "2024-01-01 10:00:00", "24.5 | 65"),
	   (2, 1, "2024-01-01 10:01:00", "26 | 60"),
       (3, 1, "2024-01-01 10:02:00", "24 | 60"),
       (4, 1, "2024-01-01 10:03:00", "27.5 | 55"),
       (5, 1, "2024-01-01 10:04:00", "23.5 | 70"),
       (6, 1, "2024-01-01 10:05:00", "25 | 65");

select ta.id as Tanque, ta.descricao as VolumeTanque, se.id as IDSensor, se.serial_sensor as SerialSensor, se.tipo as ModeloSensor, le.data as HoraMedição, le.sequencia as SequecinaMedição, le.medicao as TempUmi 
from Tanque as ta join Sensor as se on ta.id = se.fkTanque join Leituras as le on se.id = le.fkSensor;

insert into Leituras (fkSensor, sequencia, data, medicao)
values (1,2, "2024-01-01 10:10:00", "24.5 | 65");