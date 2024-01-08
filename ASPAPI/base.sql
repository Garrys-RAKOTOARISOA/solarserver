create database solarbase;
\c solarbase;
   
drop table typebatterie cascade;
drop table module cascade;
drop table client cascade;
drop table batteriedata cascade;
drop table prisedata cascade;
drop table panneaudata cascade; 
drop table couleuboutonbatterie cascade;
drop table couleurboutonprise cascade;
drop table planningbatterie cascade;
drop table planningprise cascade;
drop table totalconsommationprise cascade;
drop table totalproductionpanneau cascade;
drop table relaisbatterie cascade;
drop table relaisprise cascade; 
drop table dureeutilisationbatterie cascade;
drop table notificationmodule cascade;
drop table typebatterie cascade; 
   
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
    ssid varchar(1500) not null,
    pass varchar(1500) not null,
    primary key(id),
    foreign key(idbatterie) references typebatterie(id)
);

create table batteriedata(
    id serial not null,
    idmodule int not null,
    tension real not null,
    energie real not null,
    courant real not null,
    pourcentage real not null,
    temps timestamp not null,
    puissance real not null,
    primary key(id),
    foreign key(idmodule) references module(id)
);

create table prisedata(
    id serial not null,
    idmodule int not null,
    consommation real not null,
    tension real not null,
    puissance real not null,
    courant real not null,
    temps timestamp not null,
    primary key(id),
    foreign key(idmodule) references module(id)
);

create table panneaudata(
    id serial not null,
    idmodule int not null,
    production real not null,
    tension real not null,
    puissance real not null,
    courant real not null,
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

create table dureeutilisationbatterie(
    id serial not null,
    idmodule int not null,
    duree real not null,
    date date not null,
    primary key(id),
    foreign key(idmodule) references module(id)
);

create table totalconsommationprise(
    id serial not null,
    idmodule int not null,
    total real not null,
    date date not null,
    primary key(id),
    foreign key(idmodule) references module(id)
);

create table totalproductionpanneau(
    id serial not null,
    idmodule int not null,
    total real not null,
    date date not null,
    primary key(id),
    foreign key(idmodule) references module(id)
);

create table notificationmodule(
    id serial not null,
    idmodule int null,
    texte varchar(1000) not null,
    temps timestamp not null,
    seen boolean not null default false,
    primary key(id),
    foreign key(idmodule) references module(id)                    
);

create table couleurboutonprise(
    id serial not null,
    idmodule int not null,
    couleur varchar(100) not null,
    primary key(id),
    foreign key(idmodule) references module(id)
);

create table couleuboutonbatterie(
    id serial not null,
    idmodule int not null,
    couleur varchar(100) not null,
    primary key(id),
    foreign key(idmodule) references module(id) 
);

create table planningprise(
    id serial not null,
    idmodule int not null,
    datedebut timestamp not null,
    datefin timestamp not null,
    dateaction timestamp not null,
    valeurconsommation real not null,
    done boolean not null default false,
    primary key(id),
    foreign key(idmodule) references module(id)
);

create table planningbatterie(
    id serial not null,
    idmodule int not null,
    datedebut timestamp not null,
    datefin timestamp not null,
    dateaction timestamp not null,
    valeurenergie real not null,
    done boolean not null default false,
    primary key(id),
    foreign key(idmodule) references module(id)
);

create table relaisbatterie(
    id serial not null,
    idmodule int not null,
    state boolean default false,
    primary key(id),
    foreign key(idmodule) references module(id)
);

create table relaisprise(
    id serial not null,
    idmodule int not null,
    state boolean default false,
    primary key(id),
    foreign key(idmodule) references module(id)
);

insert into typebatterie(valeur) values (12);
insert into typebatterie(valeur) values (24);

insert into module(qrcode,nommodule,idbatterie,ssid,pass) values ('qrcode','module1',1,'wifi','wifipass');