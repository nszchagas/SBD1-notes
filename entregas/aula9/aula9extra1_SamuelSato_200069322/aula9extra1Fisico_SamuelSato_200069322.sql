--------  << AULA 9 EXTRA 1 >>  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 20/08/2022
-- Autor(es) ..............: Samuel Alves Sato
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula9extra1
--
-- PROJETO => 01 Base de Dados
--         => 2 Tabelas
--
-- ---------------------------------------------------------

CREATE DATABASE IF NOT exists aula9extra1correcao;

USE aula9extra1correcao; 

create table ESTADO(
	sigla char(2) NOT NULL,
    nome varchar(20) NOT NULL,
    CONSTRAINT ESTADO_PK PRIMARY KEY (sigla)
);

create table CIDADE(
	codigo int(5) NOT NULL,
    nome varchar(50) NOT NULL,
    sigla char(2) NOT NULL,
    habitantes bigint,
    CONSTRAINT CIDADE_PK PRIMARY KEY (codigo),
    CONSTRAINT CIDADE_ESTADO_FK FOREIGN KEY (sigla) REFERENCES ESTADO (sigla),
    CONSTRAINT CIDADE_NOME_SIGLA_UK UNIQUE (nome, sigla)
);