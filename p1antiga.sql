create database 
    if not exists p1antiga;

use p1antiga;

create table estado (
    sigla varchar(2) not null, 
    nome varchar(20),
    constraint estado_pk primary key(sigla)
);

create table sintoma (
    id int not null auto_increment,
    descricao varchar(20),
    constraint sintoma_pk primary key(id),
    constraint unique (descricao)
) engine = InnoDB;

create table pessoa (
    id int not null auto_increment,
    dtNascimento date not null,
    nome varchar(50) not null, 
    situacaoSaude ENUM('C', 'S', 'T') not null,
    sexo ENUM('M', 'F') not null,
    constraint pessoa_dtNasc_nome_uk unique key(nome, dtNascimento),
    constraint pessoa_pk primary key(id)

) engine = InnoDB auto_increment = 100;

create table homem (
    fatorRh enum('+', '-') not null, 
    tipoSanguineo enum('a', 'b', 'o', 'ab') not null,
    idPessoa int not null, 
    constraint pessoa_fk foreign key(idPessoa) references pessoa(id)
);

create table mulher (
    gestante enum('s', 'n', 'c') not null, 
    idEstado int not null, 
    idPessoa int not null, 
    constraint pessoa_fk foreign key(idPessoa) references pessoa(id)
    constraint estado_fk foreign key(idEstado) references estado(id)
);