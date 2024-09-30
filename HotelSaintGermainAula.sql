create database HotelSaintGermainAula;
commit;

use HotelSaintGermainAula;
commit;

create table Cliente (
	Id int primary key auto_increment,
    Nome varchar(100) unique,
    Sexo char(1),
    DtaNasc datetime not null
);
commit;

create table ClienteBrasileiro (
	ClienteId int primary key,
    Cpf numeric(11),
    Rg numeric(10),
    Rua varchar(100),
    Numero smallint,
    Cidade varchar(100),
    Estado char(2),
    Cep numeric(8),
    foreign key (ClienteId) references Cliente(Id)
);
commit;

create table ClienteEstrangeiro (
	ClienteId int primary key,
	Passaporte varchar(20),
    foreign key (ClienteId) references Cliente(Id)
);
commit;

create table Telefone (
	ClienteId int,
    Numero numeric(15),
    primary key (ClienteId, Numero),
    foreign key (ClienteId) references Cliente(Id)
);
commit;

create table Quarto (
	Numero smallint auto_increment primary key,
    Andar tinyint,
    Tipo char(2),
    Descricao varchar(500),
    VlrDiaria decimal(8,2)
);
commit;

create table Reserva (
	Numero int auto_increment primary key,
    ClienteId int,
    QuartoNumero smallint,
    Entrada DateTime,
    Periodo tinyint,
    foreign key (ClienteId) references Cliente(Id),
    foreign key (QuartoNumero) references Quarto(Numero)
);
commit;

create table Gerente (
	Matricula int auto_increment primary key,
    Nome varchar(100)
);
commit;
    
create table Aprovacao (
	ReservaNumero int primary key,
    GerenteMatricula int,
    DataHora datetime,
    foreign key (ReservaNumero) references Reserva(Numero),
    foreign key (GerenteMatricula) references Gerente(Matricula)
);
commit;

create table Ocupacao (
	ReservaNumero int primary key,
	QuartoNumero smallint,
    Entrada datetime,
    Saida datetime,
    foreign key (ReservaNumero) references Reserva(Numero),
    foreign key (QuartoNumero) references Quarto(Numero)
);
commit;
    
create table Restaurante (
	Id int auto_increment primary key,
    Prato varchar(100) not null,
    Preco numeric(6,2)
);
commit;

create table OcupacaoRestaurante (
	ReservaNumero int,
    RestauranteId int,
    DataHora datetime,
    Quantidade tinyint,
    primary key(ReservaNumero, RestauranteId, DataHora),
    foreign key (ReservaNumero) references Ocupacao(ReservaNumero),
    foreign key (RestauranteId) references Restaurante(Id)
);
commit;

create table Frigobar (
	Id int auto_increment primary key,
    Item varchar(100) not null,
    Preco numeric(6,2)
);
commit;

create table OcupacaoFrigobar (
	ReservaNumero int,
    FrigobarId int,
    DataHora datetime,
    Quantidade tinyint,
    primary key(ReservaNumero, FrigobarId, DataHora),
    foreign key (ReservaNumero) references Ocupacao(ReservaNumero),
    foreign key (FrigobarId) references Frigobar(Id)
);
commit;

create table Massagem (
	Id int auto_increment primary key,
    Tipo varchar(100) not null,
    Preco numeric(6,2)
);
commit;

create table OcupacaoMassagem (
	ReservaNumero int,
    MassagemId int,
    DataHora datetime,
    Quantidade tinyint,
    primary key(ReservaNumero, MassagemId, DataHora),
    foreign key (ReservaNumero) references Ocupacao(ReservaNumero),
    foreign key (MassagemId) references Massagem(Id)
);
commit;

insert into Cliente
(Nome, Sexo, DtaNasc)
values
('Jeon Jung-kook', 'M', '1997-09-1');

insert into Cliente
(Nome, Sexo, DtaNasc)
values
('Jimin', 'M', '1995-10-13');

insert into Cliente
(Nome, Sexo, DtaNasc)
values
('Jin', 'M', '1992-12-04');

insert into Cliente
(Nome, Sexo, DtaNasc)
values
('Taehyung', 'M', '1995-12-30');

insert into Cliente
(Nome, Sexo, DtaNasc)
values
('J-Hope', 'M', '1994-02-18');

insert into Cliente
(Nome, Sexo, DtaNasc)
values
('Namjoon', 'M', '1994-09-12');

insert into Cliente
(Nome, Sexo, DtaNasc)
values
('Yoongi', 'M', '1993-03-09');

select * from Cliente;

insert into ClienteBrasileiro
(ClienteId, Cpf, Rg, Rua, Numero, Cidade, Estado, Cep)
values
('1', '1112223334', '1112223334', 'Rua Minas Gerais', '185', 'Curitiba', 'PR', '11122233');

insert into ClienteBrasileiro
(ClienteId, Cpf, Rg, Rua, Numero, Cidade, Estado, Cep)
values
('2', '35241567038', '177427437', 'Rua Alagoas', '177', 'Curitiba', 'PR', '87060224');

insert into ClienteBrasileiro
(ClienteId, Cpf, Rg, Rua, Numero, Cidade, Estado, Cep)
values
('3', '71164028022', '187642904', 'Travessa Primeira', '121', 'Itaituba', 'PA', '68181380');

insert into ClienteBrasileiro
(ClienteId, Cpf, Rg, Rua, Numero, Cidade, Estado, Cep)
values
('4', '93914917075', '368047647', 'Travessa dos Bancários', '653', 'Campo Grande', 'MS', '79043011');

insert into ClienteEstrangeiro
(ClienteId, Passaporte)
values
('5', 'Z626188');

insert into ClienteEstrangeiro
(ClienteId, Passaporte)
values
('6', 'TK147607');

insert into ClienteEstrangeiro
(ClienteId, Passaporte)
values
('7', 'ZW585382');

insert into Telefone
(ClienteId, Numero)
values
('1', '23732298');

insert into Telefone
(ClienteId, Numero)
values
('2', '26923954');

insert into Telefone
(ClienteId, Numero)
values
('3', '37885186');

insert into Telefone
(ClienteId, Numero)
values
('4', '31873371');

insert into Telefone
(ClienteId, Numero)
values
('5', '29861494');

insert into Telefone
(ClienteId, Numero)
values
('6', '24128637');

insert into Telefone
(ClienteId, Numero)
values
('7', '38156285');

insert into Quarto
(Numero, Andar, Tipo, Descricao, VlrDiaria)
values
('101', '4', 'ST', 'Luxo', '570.99');