-- --------  Aula 9 Exercício 1  ----------
--
--                    SCRIPT POPULA (DML)
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

use aula9extra1;

insert into ESTADO (sigla, nome) values 
	('PR', 'Paraná'),
    ('GO', 'Goiás'),
    ('DF', 'Distrito Federal'),
    ('SP', 'São Paulo');
    
insert into CIDADE (nome, sigla, habitantes) values
	('Brasília', 'DF', 3094325),
    ('Ponta Grossa', 'PR', 355336),
    ('Goiânia', 'GO', 1555626),
    ('Curitiba', 'PR', 1963726),
    ('Anápolis', 'GO', 391772),
    ('Alexânia','GO',28010),
    ('Foz do Iguaçu','PR', 258248),
  	('Campinas', 'SP', 1223237),
    ('São Carlos', 'SP', 254484), 
    ('Guarulhos', 'SP', 1223237);





    
