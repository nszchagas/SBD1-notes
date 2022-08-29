--------  << AULA 9 EXTRA 1 >>  ----------
--
--                    CONSULTA
--
-- Data Criacao ...........: 20/08/2022
-- Autor(es) ..............: Samuel Alves Sato
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: a9extra1
--
-- Ultimas Alteracoes
--   23/08/2022 => Melhorando apresentacao do script com Consultas
-- 
-- PROJETO => 01 Base de Dados
--         => 02 Tabelas
--
-- ---------------------------------------------------------

-- A) Projeção de sigla e nome do estado de sigla SP e DF;
SELECT sigla,nome FROM ESTADO 
	WHERE sigla = "SP" or sigla ="DF";

select sigla, nome from ESTADO;


-- B) Selecione somente o nome e a sigla das cidades que são dos 
--    estados RJ, DF e GO;
SELECT sigla, count(sigla) FROM CIDADE 
	WHERE sigla IN ("DF", "RJ", "GO") group by sigla;


-- C) Selecione todas as cidades do primeiro estado que você cadastrou
--     mostrando somente o nome da cidade, o nome do estado e sua sigla;
SELECT cid.nome, esta.nome, esta.sigla FROM CIDADE cid, ESTADO esta 
	WHERE cid.sigla = esta.sigla AND esta.sigla = "SP";


-- D) Selecione somente o nome e a sigla do estado que você cadastrou por último
--    e todas as cidades cadastradas nele, mostrando o seu nome e a quantidade de
--    habitantes em ordem crescente de nome de estado e nome de cidade.
SELECT est.nome, est.sigla, cid.nome, cid.habitantes FROM ESTADO est, CIDADE cid 
	WHERE est.sigla = cid.sigla AND est.sigla = "GO"
    ORDER BY cid.habitantes;

