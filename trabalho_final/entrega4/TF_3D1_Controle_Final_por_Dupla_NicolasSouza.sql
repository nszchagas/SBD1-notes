-- --------  Trabalho Final  ----------
--
--                    SCRIPT DE CONTROLE (DDL)
--
-- Data Criacao ...........: 11/09/2022
-- Autor(es) ..............: Nicolas Chagas Souza, Mateus Vinicius Ferreira Franco e Thiago Franca Vale Oliveira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_3D1_nicolassouza
--
-- Ultimas Alteracoes
--   11/09/2022 => Criacao do script
--
-- PROJETO => 01 Base de Dados
--         => 18 Tabelas
-- 		   => 04 Usuarios
--
-- ---------------------------------------------------------
use TF_3D1_nicolassouza;

-- ROLES
create role administrador;
create role gerente;
create role garcom;
create role monitor;

-- USUÁRIOS
create user administradorSistema
	identified by '@dmin123';
create user gerenteLoja 
	identified by 'gerenci@321';    
create user garcomJoao
	identified by 'j0ao123';
create user monitorLucas
	identified by 'luca$123';

-- AUTORIZACOES
-- ADMIN
grant all privileges on TF_3D1_nicolassouza.* to administrador;

-- GERENTE
grant select, insert, update, delete on TF_3D1_nicolassouza.* to gerente with grant option;

-- GARCOM
grant select, insert on TF_3D1_nicolassouza.LANCHE  to garcom;
grant select, insert on TF_3D1_nicolassouza.COMANDA to garcom;
grant select, insert on TF_3D1_nicolassouza.CONTA   to garcom;
grant select, insert on TF_3D1_nicolassouza.contem  to garcom;

-- MONITOR
grant select, insert on TF_3D1_nicolassouza.PARTIDA to monitor;
grant select, insert on TF_3D1_nicolassouza.ARTIGO  to monitor;
grant select, insert on TF_3D1_nicolassouza.MESA 	to monitor;
grant select, insert on TF_3D1_nicolassouza.ALUGUEL to monitor;
grant select, insert on TF_3D1_nicolassouza.MEMBRO  to monitor;
grant select, insert on TF_3D1_nicolassouza.CONTA 	to monitor;
grant select, insert on TF_3D1_nicolassouza.COMANDA to monitor;
grant select, insert on TF_3D1_nicolassouza.inclui  to monitor;
grant select, insert on TF_3D1_nicolassouza.joga 	to monitor;


grant administrador to administradorSistema;
grant gerente		to gerenteLoja;
grant garcom 		to garcomJoao;
grant monitor 		to monitorLucas;



	