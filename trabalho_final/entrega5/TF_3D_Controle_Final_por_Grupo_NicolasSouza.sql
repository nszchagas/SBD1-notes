-- -----------------------------   << Trabalho Final - Lodoteca (Tema 3) >>   -----------------------------
--
--                                        SCRIPT DE CONTROLE DE ACESSO (DDL)                                            
-- 
-- Data Criacao ...........: 11/09/2022
-- Autor(es) ..............: Pedro Lucas Cassiano Martins e Samuel Alves Sato 
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: TF_3D2_pedromartins;
-- 
-- PROJETO => 01 Base de Dados
--         => 21 Tabelas
--         => 02 Usuários
-- 
-- ---------------------------------------------------------------------------------------------------------------------

USE TF_3D2_pedromartins;

-- usuário admin é reponsável por administrar a base de dados (DBA) do database TF_3D2_pedromartins, ele será o único capaz de alterar as estruturas das
-- tabelas, podendo criar novas e exluir tabelas. Usuário destinado ao dono do projeto
CREATE USER 'admin'
IDENTIFIED BY 'admin';

GRANT ALL PRIVILEGES ON TF_3D2_pedromartins.* TO 'admin';


-- usuário 'user' é responsável por manipular os dados guardados, podendo fazer, apenas, inserções, seleções, updates e deletes no database. Esse usuário é destinado às pessoas que 
-- utilizarão o sistema no dia a dia para armazenar e editar os dados.
CREATE USER 'user'
IDENTIFIED BY '123123';

GRANT SELECT,INSERT, UPDATE, DELETE ON TF_3D2_pedromartins.* TO 'user';
