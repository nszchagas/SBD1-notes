-- --------  aula4exer6Evolucao3  ----------
--
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 27/07/2022
-- Autor(es) ..............: Gabriel Ferreira da Silva
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao3
--
-- Ultimas Alteracoes
--   02/08/2022 => Ajustando padrao exigido no script
-- 			    => Adição da Engine InnoDB em todas as tabelas
-- 				=> Adição de AUTO_INCREMENT em todos os atributos como ID
--   25/08/2022 => Mudança de tipo do atributo cpf da tabela PROPRIETARIO de BIGINT para DECIMAL(11)
--              => Mudança de tipo do atributo sexo da tabela PROPRIETARIO de CHAR(1) para ENUM('M','F')
--              => Mudança de tamanho do atributo nomeProp da tabela PROPRIETARIO de 30 para 100  
--              => Mudança de tamanho do atributo idModelo da tabela MODELO de não especificado para 6
--                 como pedido pelo enunciado
--              => Mudança de tamanho do atributo idCategoria da tabela Categoria de não especificado para 2
--                 como pedido pelo enunciado
--              => Mudança de tamanho dos atributos latitude e longitude da tabela LOCALINFRACAO
--                 de DECIMAL para DECIMAL(3,5)
--              => Mudança de tamanho de letra da tabela TELEFONE para telefone
--              => Adicionando Unique keys como descrito no DLD, nas tabelas CATEGORIA,MODELO,VEICULO e telefone
--   25/08/2022 => Atualiza sintese do projeto com Perfis.
--
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--         => 02 Perfis
--         => 03 Usuários
--
-- ---------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE IF NOT EXISTS aula4exer6Evolucao3;

USE aula4exer6Evolucao3;


-- TABELAS
CREATE TABLE MODELO(
	idModelo INT(6)      NOT NULL AUTO_INCREMENT,
    dsModelo VARCHAR(30) NOT NULL,
    CONSTRAINT MODELO_PK PRIMARY KEY (idModelo),
    CONSTRAINT MODELO_dsModelo_UK UNIQUE KEY(dsModelo)
) ENGINE = InnoDB AUTO_INCREMENT=1;

CREATE TABLE CATEGORIA(
	idCategoria INT(2)      NOT NULL AUTO_INCREMENT,
    dsCategoria VARCHAR(30) NOT NULL,
    CONSTRAINT CATEGORIA_PK PRIMARY KEY (idCategoria),
    CONSTRAINT CATEGORIA_dsCategoria_UK UNIQUE KEY(dsCategoria)
) ENGINE = InnoDB AUTO_INCREMENT=1;

CREATE TABLE PROPRIETARIO(
	cpf            DECIMAL(11) NOT NULL,
	nomeProp       VARCHAR(100) NOT NULL,
    bairro         VARCHAR(30) NOT NULL,
    cidade         VARCHAR(30) NOT NULL,
    estado         CHAR(2)     NOT NULL,
    sexo           ENUM('M','F') NOT NULL,
    dataNascimento DATE        NOT NULL,
    CONSTRAINT PROPRIETARIO_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB;

CREATE TABLE telefone (
	cpf         DECIMAL(11) NOT NULL,
    telefone    BIGINT NOT NULL,
    CONSTRAINT telefone_cpf_telefone_UK UNIQUE KEY(cpf,telefone),
	CONSTRAINT telefone_PROPRIETARIO_FK FOREIGN KEY (cpf)
    REFERENCES PROPRIETARIO (cpf)
) ENGINE = InnoDB;

CREATE TABLE VEICULO(
	placa         VARCHAR(8)  NOT NULL,
    cor           VARCHAR(20) NOT NULL,
    anoFabricacao INT         NOT NULL,
    chassi        VARCHAR(17) NOT NULL,
    idModelo      INT         NOT NULL, 
    idCategoria   INT         NOT NULL,
    cpf           DECIMAL(11) NOT NULL,
    CONSTRAINT VEICULO_PK PRIMARY KEY (placa),
    CONSTRAINT VEICULO_chassi_UK UNIQUE KEY(chassi),
    CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (idModelo)
      REFERENCES MODELO (idModelo),
    CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (idCategoria)
      REFERENCES CATEGORIA (idCategoria),
    CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpf)
      REFERENCES PROPRIETARIO (cpf)
) ENGINE = InnoDB;

CREATE TABLE TIPOINFRACAO(
	idTipoInfracao INT         NOT NULL AUTO_INCREMENT,
    dsInfracao     VARCHAR(40) NOT NULL,
    valorInfracao  INT         NOT NULL,
    CONSTRAINT TIPOINFRACAO_PK PRIMARY KEY (idTipoInfracao)
) ENGINE = InnoDB AUTO_INCREMENT=1;

CREATE TABLE LOCALINFRACAO(
	idLocal             INT     NOT NULL AUTO_INCREMENT,
    latitude            DECIMAL(9,5) NOT NULL,
    longitude           DECIMAL(9,5) NOT NULL,
    velocidadePermitida INT     NOT NULL,
    CONSTRAINT LOCALINFRACAO_PK PRIMARY KEY (idLocal)
) ENGINE = InnoDB AUTO_INCREMENT=1;

CREATE TABLE AGENTE(
	matriculaAgente INT         NOT NULL,
    nomeAgente      VARCHAR(30) NOT NULL,
    dataContratacao DATE        NOT NULL,
    CONSTRAINT AGENTE_PK PRIMARY KEY (matriculaAgente)
) ENGINE = InnoDB;

CREATE TABLE INFRACAO(
	idInfracao        INT        NOT NULL AUTO_INCREMENT,
	dataInfracao      DATE       NOT NULL,
    horarioInfracao   TIME       NOT NULL,
	velocidadeAferida INT,
    placa             VARCHAR(8) NOT NULL,
    idTipoInfracao    INT        NOT NULL,
    idLocal           INT        NOT NULL,
    matriculaAgente   INT        NOT NULL,
    CONSTRAINT INFRACAO_PK PRIMARY KEY (idInfracao),
    CONSTRAINT INFRACAO_VEICULO_FK FOREIGN KEY (placa)
      REFERENCES VEICULO (placa),
    CONSTRAINT INFRACAO_TIPOINFRACAO_FK FOREIGN KEY (idTipoInfracao)
      REFERENCES TIPOINFRACAO (idTipoInfracao),
    CONSTRAINT INFRACAO_LOCALINFRACAO_FK FOREIGN KEY (idLocal)
      REFERENCES LOCALINFRACAO (idLocal),
    CONSTRAINT INFRACAO_AGENTE_FK FOREIGN KEY (matriculaAgente)
      REFERENCES AGENTE (matriculaAgente)
) ENGINE = InnoDB AUTO_INCREMENT=1;
    