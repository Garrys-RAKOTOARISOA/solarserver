create database solarbase;
\c solarbase;
   
drop table typebatterie cascade;
drop table module cascade;
drop table client cascade;
drop table donnees cascade; 
   
create table typebatterie(
    id serial not null,
    valeur real not null,
    primary key(id) 
);   
   
create table module(
    id serial not null,
    qrcode varchar(100) not null,
    nommodule varchar(100) not null,
    idbatterie int not null,
    state bool default false,
    primary key(id),
    foreign key(idbatterie) references typebatterie(id)
);

create table donnees(
    id serial not null,
    idmodule int not null,
    voltagepanneau real not null,
    voltageoutput real not null,
    voltagebatterie real not null,
    production real not null,
    consommation real not null,
    valeurbatterie real not null,
    temps timestamp not null,
    primary key(id),
    foreign key(idmodule) references module(id)
);

create table client(
    id serial not null,
    nom varchar(500) not null,
    prenom varchar(500) not null,
    email varchar(500) not null,
    pass varchar(500) not null,
    codepostal varchar(500) not null,
    lienimage varchar(500) not null,
    idmodule int not null,
    primary key(id),
    foreign key(idmodule) references module(id)
);

insert into typebatterie(valeur) values (12);
insert into typebatterie(valeur) values (24);

insert into module(qrcode,nommodule,idbatterie) values ('qrcode','module1',1);