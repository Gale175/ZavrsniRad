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

select * from natjecanja;

insert into natjecanja
(naziv,vrsta,sezona,pobjednik,najbolji_igrac) values
('Liga prvaka','Klupsko prvenstvo','2023','Real Madrid','Vinicius Junior'),
('LaLiga','Klupsko prvenstvo','2023','Real Madrid','Vinicius Junior');

select * from igraci;

insert into igraci
(ime,prezime,dob,golovi,asistencije) values
('Vinicius','Junior','21',23,24);

insert into timovi
(naziv,klub_repka,natjecanje,trener,stadion) values
('Real Madrid',1,2,'Carlo Ancelotti','Santiago Bernabeu');

select * from timovi;