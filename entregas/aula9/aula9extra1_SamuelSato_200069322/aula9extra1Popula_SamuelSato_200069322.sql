--------  << AULA 9 EXTRA 1 >>  ----------
--
--                    POPULA
--
-- Data Criacao ...........: 20/08/2022
-- Autor(es) ..............: Samuel Alves Sato
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: a9extra1
--
-- PROJETO => 01 Base de Dados
--         => 2 Tabelas
--
-- ---------------------------------------------------------
USE aula9extra1correcao;

INSERT INTO ESTADO(sigla, nome) VALUES
	('SP', 'São Paulo'),
    ("DF", "Distrito Federal"),
    ("GO", "Goiás");
    
INSERT INTO CIDADE(codigo, nome, sigla, habitantes) VALUES
	(1, "Niterói", "SP", 10),
    (2, "Guarulhos", "SP", 20),
    (3, "Guará", "DF", 30),
    (4, "Gama", "DF", 40),
    (5, "Goiania", "GO", 50),
    (6, "Trindade", "GO", 60),
    (7, "Alexiania", "GO", 70),
    (8, "Alexiania", "MG", 70);