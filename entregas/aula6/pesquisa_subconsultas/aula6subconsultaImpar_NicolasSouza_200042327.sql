--           ---------- PESQUISA - SUBCONSULTAS -------------
--
--                    SCRIPT DE CRIACAO, INSERÇÃO E CONSULTA (DDL e DML)
--
-- Data Criacao ...........: 07/09/2022
-- Autor(es) ..............: Nicolas Chagas Souza
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: subconsultaImpar
--
-- Ultimas Alteracoes
--
-- PROJETO => 01 Base de Dados
--         => 04 Tabelas
--
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS subconsultaImpar;

USE subconsultaImpar;

CREATE TABLE PESSOA (
	cpfPessoa BIGINT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    dataNascimento DATE NOT NULL,  
    CONSTRAINT PESSOA_PK PRIMARY KEY(cpfPessoa)
);

CREATE TABLE CLIENTE (
	cpfCliente BIGINT NOT NULL,
    nome VARCHAR(100) NOT NULL,    
    CONSTRAINT CLIENTE_PK PRIMARY KEY(cpfCliente)
);

CREATE TABLE PRODUTO(
	codProduto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(7,2) NOT NULL,
    CONSTRAINT PRODUTO_PK PRIMARY KEY(codProduto),
    CONSTRAINT PRODUTO_UK UNIQUE KEY(nome)
) ENGINE = InnoDB AUTO_INCREMENT = 1;	


CREATE TABLE VENDA(
	cpfCliente BIGINT NOT NULL,
    codProduto INT NOT NULL, 
    quantidade INT NOT NULL,
    dataHora TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT VENDA_PRODUTO_FK FOREIGN KEY (codProduto) 
		REFERENCES PRODUTO(codProduto),
	CONSTRAINT VENDA_CLIENTE_FK FOREIGN KEY (cpfCliente)
		REFERENCES CLIENTE(cpfCliente)
);

INSERT INTO PESSOA(cpfPessoa, nome, dataNascimento) VALUES 
	(45678965412, 'Yasmim Costa', '2004-05-22'),
    (98742139451, 'Luiza Frade', '2004-04-29'),
    (16516511231, 'Vitória Braga', '2004-12-30');

INSERT INTO CLIENTE(cpfCliente, nome) VALUES
	(12345678910,'Jéssica Valença'),
    (45678912311,'Guilherme Brito'),
    (78912345612,'Thais Rebouças');

INSERT INTO PRODUTO(nome, preco) VALUES 
	('Vinho Malbec 2015', 75.99),
	('Queijo de Cabra', 36.99),
	('Presunto Parma', 42.99),
	('Azeitona Preta', 8.99),
	('Damasco', 12.99);

INSERT INTO VENDA(cpfCliente, codProduto, quantidade) VALUES
	(12345678910, 1, 3),
    (12345678910, 2, 1),
    (12345678910, 3, 2),
    (45678912311, 5, 2),
    (45678912311, 3, 1),
    (78912345612, 1, 4),
    (78912345612, 3, 2);


-- Insere na tabela cliente todas as pessoas cadastradas que possuam idade maior ou igual a 18 anos. 
INSERT INTO CLIENTE(cpfCliente, nome) 
	SELECT cpfPessoa, nome FROM PESSOA p 
		WHERE TIMESTAMPDIFF(YEAR, p.dataNascimento, CURDATE()) >= 18;

-- Apaga todas as vendas feitas para clientes que possuem 'ça' no nome.
DELETE FROM VENDA 
	WHERE cpfCliente=ANY(SELECT cpfCliente FROM CLIENTE WHERE nome LIKE '%ça%');
