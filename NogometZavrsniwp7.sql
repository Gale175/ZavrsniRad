use master;
go
drop database if exists nogomet_zavr;
go
create database nogomet_zavr;
go
use nogomet_zavr;
go

create table natjecanja(
sifra int not null primary key identity(1,1),
naziv varchar(80) not null,
vrsta varchar(50) not null,
drzava varchar (80) not null,
sezona datetime not null,
pobjednik varchar(80) not null,
najbolji_igrac varchar(100)
);

create table timovi(
sifra int not null primary key identity(1,1),
naziv varchar(80) not null,
klub_repka bit not null,
natjecanje int not null references natjecanja(sifra),
trener varchar(80),
stadion varchar(80)
);

create table igraci(
sifra int not null primary key identity(1,1),
ime varchar(50) not null,
prezime varchar(80) not null,
dob int,
golovi int not null,
asistencije int not null
);

create table timovi_igraci(
tim int not null references timovi(sifra),
igrac int not null references igraci(sifra)
);


insert into natjecanja
(naziv,vrsta,drzava,sezona,pobjednik,najbolji_igrac) values
('Liga prvaka','Klupsko prvenstvo','Europa','2023','Real Madrid','Vinicius Junior'),
('Premier League','Klupsko prvenstvo','Engleska','2023','Manchester City','Kevin de Bruyne'),
('Francuska Liga','Klupsko prvenstvo','Francuska','2023','Paris Saint Germain','Kylian Mbappe'),
('La Liga','Klupsko prvenstvo','Španjolska','2023','Real Madrid','Vinicius Junior'),
('Serie A','Klupsko prvenstvo','Italija','2023','Real Madrid','Vinicius Junior'),
('Bundesliga','Klupsko prvenstvo','Njemačka','2023','Real Madrid','Vinicius Junior');

insert into igraci
(ime,prezime,dob,golovi,asistencije) values
('Vinicius','Junior','21',23,24),
('Thibaut','Courtois', 33, 0, 0),
('Kepa','Arrizabalaga', 31, 0, 0),
('Andriy','Lunin', 28, 0, 1),
('Dani','Carvajal', 32, 10, 7),
('Antonio','Rudiger', 30, 4, 1),
('Luka','Modrić', 39, 8, 18),
('Toni','Kroos', 34, 10, 18),
('Jude','Bellingham', 23, 18, 14),
('Kylian','Mbappe', 23, 24, 26),
('Ederson','Moreira', 33, 0, 0),
('Ruben','Dias', 28, 5, 2),
('Josko','Gvardiol', 21, 6, 10),
('Kevin','De Bruyne', 30, 14, 19),
('Rodri','Ivan', 30, 2, 4),
('Bernardo','Silva',28,10, 13),
('Erling','Haaland', 22, 29, 14);

insert into timovi
(naziv,klub_repka,natjecanje,trener,stadion) values
('Real Madrid',1,4,'Carlo Ancelotti','Santiago Bernabeu'),
('Manchester City',1,2,'Pep Guardiola','Etihad'),
('Barcelona',1,4,'Xavi Hernandez','Camp Nou'),
('Bayern Munich',1,6,'Hansi Flick','Alianz Arena'),
('Juventus',1,5,'Thiago Motta','Stadio Olympico'),
('Paris Saint Germain',1,3,'Luis Enrique','Parc de princes');

insert into timovi_igraci
(tim,igrac) values
(1,1),
(1,2),
(1,7),
(1,9),
(2,11),
(2,12),
(2,13),
(2,14),
(2,15),
(2,17);

select * from igraci;
select * from natjecanja;
select * from timovi;
select * from timovi_igraci;