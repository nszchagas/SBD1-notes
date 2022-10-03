-- -----------------------------   << Trabalho Final - Ludoteca (Tema 3) >>   -----------------------------
--
--                                        SCRIPT DE CONTROLE DE ACESSO (DDL)                                            
-- 
-- Data Criacao ...........: 11/09/2022
-- Autor(es) ..............: Pedro Lucas Cassiano Martins, Samuel Alves Sato, Nicolas Chagas Souza, Mateus Vinicius Ferreira Franco e Thiago Franca Vale Oliveira
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: TF_3D_nicolassouza;
--
-- Ultimas Alteracoes
--   19/09/2022 => Alteração do nome da base de dados;
-- 
-- PROJETO => 01 Base de Dados
--         => 22 Tabelas
--         => 06 Usuários
-- 
-- ---------------------------------------------------------------------------------------------------------------------

USE TF_3D_nicolassouza;


-- role 'administrador' é reponsável por administrar a base de dados (DBA) do database TF_3D2_pedromartins, ele será o único capaz de alterar as estruturas das
-- tabelas, podendo criar novas, exluir e editar tabelas. Usuário destinado ao dono do projeto
CREATE ROLE administrador;
GRANT ALL PRIVILEGES ON TF_3D2_pedromartins.* 
TO administrador;


-- role 'gerente' é responsável por manipular os dados guardados, podendo fazer, apenas, inserções, seleções, updates e deletes no database. Esse usuário é destinado às pessoas que 
-- utilizarão o sistema no dia a dia para armazenar e editar os dados.
CREATE ROLE gerente;
GRANT SELECT,INSERT, UPDATE, DELETE ON TF_3D2_pedromartins.* 
TO gerente
WITH GRANT OPTION;


-- Usuários com role de administrador
CREATE USER 'admin1'
IDENTIFIED BY 'admin';
GRANT administrador TO 'admin1';


CREATE USER 'dono1'
IDENTIFIED BY '1234';
GRANT administrador TO 'dono1';

CREATE USER 'dono2'
IDENTIFIED BY '4321';
GRANT administrador TO 'dono2';

-- Usuários com role de gerente
CREATE USER 'user'
IDENTIFIED BY '123123';
GRANT gerente TO 'user';


CREATE USER 'gerente1'
IDENTIFIED BY '12345678';
GRANT gerente TO 'gerente1';

CREATE USER 'gerente2'
IDENTIFIED BY '87654321';
GRANT gerente TO 'gerente2';
