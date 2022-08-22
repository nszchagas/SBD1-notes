-- --------  Aula 9 Exercício 1  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 22/08/2022
-- Autor(es) ..............: Nicolas Chagas Souza
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula9extra1
--
--
-- PROJETO => 01 Base de Dados
--         => 02 Tabelas
--
-- ---------------------------------------------------------

create database if not exists aula9extra1;

use aula9extra1; 

create table ESTADO (
	sigla 		varchar(2) 		not null, 
    nome 		varchar(20) 	not null, 
    constraint 	estado_pk 		primary key(sigla),
    constraint 	nome_uk 		unique key(nome)
);


create table CIDADE (
	codigo 		int 				not null auto_increment, 
    nome 		varchar(50)			not null, 
    sigla		varchar(2)			not null, 
    habitantes	bigint				not null,
    constraint 	cidade_pk			primary key(codigo), 
    constraint 	cidade_estado_fk	foreign key(sigla) references ESTADO(sigla),
    constraint 	cidade_uk 			unique key(nome, sigla)
    ) engine = InnoDB auto_increment=1;
