-- --------  aula4exer6Evolucao4 ----------
--
--                    CONTROLE
--
-- Data Criacao ...........: 27/07/2022
-- Autor(es) ..............: Nicolas Chagas Souza
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao4
--
-- Ultimas alteracoes:
--   20/09/2022 => Alteração do nome da base. 
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--         => 03 Usuários
--         => 01 View
--
-- ---------------------------------------------------------

USE aula4exer6Evolucao4;

CREATE USER 'admins'
IDENTIFIED BY '2022Root';

CREATE USER 'maria'
IDENTIFIED BY 'airam321';

CREATE USER 'jose'
IDENTIFIED BY 'esoj2022';

CREATE ROLE 'ADM';
CREATE ROLE 'PESSOA';

GRANT ALL PRIVILEGES ON aula4exer6Evolucao4 TO 'ADM';
GRANT SELECT ON aula4exer6Evolucao4 TO 'PESSOA';
GRANT INSERT ON aula4exer6Evolucao4.VEICULO TO 'PESSOA';
GRANT INSERT ON aula4exer6Evolucao4.PROPRIETARIO TO 'PESSOA';

GRANT 'ADM' to 'admins';
GRANT 'PESSOA' to 'maria';
GRANT 'PESSOA' to 'jose';
