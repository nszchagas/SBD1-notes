-- --------  Aula 9 Exercício 1  ----------
--
--                    SCRIPT DE CONSULTA (DML)
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

-- A) Projeção de sigla e nome do estado de sigla SP e DF;
select sigla, nome from ESTADO 
	where sigla = 'SP' or sigla = 'DF';


-- B) Selecione somente o nome e a sigla das cidades que são dos estados RJ, DF e GO;
select nome, sigla from CIDADE 
	where sigla = 'RJ' or	sigla = 'DF' or	sigla = 'GO';

-- C) Selecione todas as cidades do primeiro estado que você cadastrou (PR) mostrando somente o nome da cidade, 
-- o nome do estado e sua sigla;
select c.nome Cidade, e.nome Estado, e.sigla Sigla from CIDADE c, ESTADO e 
	where c.sigla = e.sigla and e.sigla = 'PR';
        
-- D) Selecione somente o nome e a sigla do estado que você cadastrou por último (SP) e todas as cidades cadastradas 
-- nele, mostrando o seu nome e a quantidade de habitantes em ordem crescente de nome de estado e nome de cidade.
select c.nome Nome, e.nome Estado, e.sigla, c.habitantes Habitantes from ESTADO e, CIDADE c 
	where 		e.sigla = c.sigla and e.sigla = 'SP' 
	order by 	c.habitantes, c.nome






    
