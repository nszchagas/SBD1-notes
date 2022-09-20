-- --------  aula4exer6Evolucao3 ----------
--
--                    CONTROLE
--
-- Data Criacao ...........: 27/07/2022
-- Autor(es) ..............: Gabriel Ferreira da Silva
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao3
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--         => 03 Usuários
--
-- ---------------------------------------------------------

USE aula4exer6Evolucao3;

CREATE USER 'root'
IDENTIFIED BY '2022Root';

CREATE USER 'maria'
IDENTIFIED BY 'airam321';

CREATE USER 'jose'
IDENTIFIED BY 'esoj2022';

CREATE ROLE 'ADM';
CREATE ROLE 'PESSOA';

GRANT ALL PRIVILEGES ON aula4exer6Evolucao3 TO 'ADM';
GRANT SELECT ON aula4exer6Evolucao3 TO 'PESSOA';
GRANT INSERT ON aula4exer6Evolucao3.VEICULO TO 'PESSOA';
GRANT INSERT ON aula4exer6Evolucao3.PROPRIETARIO TO 'PESSOA';

GRANT 'ADM' to 'root';
GRANT 'PESSOA' to 'maria';
GRANT 'PESSOA' to 'jose';
