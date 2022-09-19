-- -----------------------------   << Trabalho Final - Ludoteca (Tema 3) >>   -----------------------------
--
--                                        SCRIPT DE CRIACAO (DDL)                                            
-- 
-- Data Criacao ...........: 11/09/2022
-- Autor(es) ..............: Pedro Lucas Cassiano Martins, Samuel Alves Sato, Nicolas Chagas Souza
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: TF_3D_NicolasSouza;
--
-- Ultimas Alteracoes
--   19/09/2022 => Alteração do nome da base de dados.
-- 				=>
-- 				=>
-- 				=>
-- 				=>
-- 				=>
--                 
-- 
-- 
-- PROJETO => 01 Base de Dados
--         => 21 Tabelas
--         => 02 Usuários
--
-- ---------------------------------------------------------------------------------------------------------------------

-- BASE DE DADOS
CREATE DATABASE
	IF NOT EXISTS
    TF_3D2_pedromartins;

USE TF_3D2_pedromartins;

CREATE TABLE PRODUTO (
    idProduto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(6 , 2 ) NOT NULL,
    statusProduto CHAR(1) NOT NULL,
    CONSTRAINT PRODUTO_PK PRIMARY KEY (idProduto)
)ENGINE = INNODB AUTO_INCREMENT=1;

CREATE TABLE OUTROS (
    idObjeto INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(100) NOT NULL,
    idProduto INT NOT NULL,
    CONSTRAINT OUTROS_PK PRIMARY KEY (idObjeto , idProduto),
    CONSTRAINT OUTROS_PRODUTO FOREIGN KEY (idProduto)
        REFERENCES PRODUTO (idProduto)
        ON DELETE CASCADE
)ENGINE = INNODB AUTO_INCREMENT=1;

CREATE TABLE QUADRINHO (
    idQuadrinho INT NOT NULL AUTO_INCREMENT,
    genero VARCHAR(10) NOT NULL,
    idProduto INT NOT NULL,
    CONSTRAINT QUADRINHO_PK PRIMARY KEY (idQuadrinho , idProduto),
    CONSTRAINT QUADRINHO_PRODUTO FOREIGN KEY (idProduto)
        REFERENCES PRODUTO (idProduto)
        ON DELETE CASCADE
)ENGINE = INNODB AUTO_INCREMENT=1;

CREATE TABLE JOGO (
    idJogo INT NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(8) NOT NULL,
    idProduto INT NOT NULL,
    CONSTRAINT JOGO_PK PRIMARY KEY (idJogo , idProduto),
    CONSTRAINT JOGO_PRODUTO_FK FOREIGN KEY (idProduto)
        REFERENCES PRODUTO (idProduto)
        ON DELETE CASCADE,
    CONSTRAINT JOGO_UK UNIQUE KEY (idProduto)
)ENGINE = INNODB AUTO_INCREMENT=1;

CREATE TABLE CLIENTE (
    idCliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) NOT NULL,
    CEP VARCHAR(8) NOT NULL,
    RG CHAR(9) NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    cidade VARCHAR(30) NOT NULL,
    dtNasc DATE NOT NULL,
    profissao VARCHAR(30) NOT NULL,
    estadoCivil CHAR(1) NOT NULL,
    CONSTRAINT CLIENTE_PK PRIMARY KEY (idCliente),
    CONSTRAINT CLIENTE_UK UNIQUE KEY (email , CPF , CEP , RG)
)ENGINE = INNODB AUTO_INCREMENT=1;

CREATE TABLE CONTRATO (
    idContrato INT NOT NULL AUTO_INCREMENT,
    dataContrato DATE NOT NULL,
    nomeTestemunha1 VARCHAR(100) NOT NULL,
    nomeTestemunha2 VARCHAR(100) NOT NULL,
    rgTestemunha1 VARCHAR(14) NOT NULL,
    rgTestemunha2 VARCHAR(14) NOT NULL,
    statusContrato CHAR(1) NOT NULL,
    idCliente INT NOT NULL,
    CONSTRAINT CONTRATO_PK PRIMARY KEY (idContrato),
    CONSTRAINT CONTRATO_CLIENTE_FK FOREIGN KEY (idCliente)
        REFERENCES CLIENTE (idCliente)
        ON DELETE CASCADE
)ENGINE = INNODB AUTO_INCREMENT=1;

CREATE TABLE ASSINATURA (
    idAssinatura INT NOT NULL AUTO_INCREMENT,
    descAssinatura VARCHAR(30) NOT NULL,
    precoAssinatura DECIMAL(6 , 2 ) NOT NULL,
    limiteEmprestimo INT NOT NULL,
    totalIngresso INT NOT NULL,
    CONSTRAINT ASSINATURA_PK PRIMARY KEY (idAssinatura)
)ENGINE = INNODB AUTO_INCREMENT=1;

CREATE TABLE ALUGUEL (
    idAluguel INT NOT NULL AUTO_INCREMENT,
    tipoAssinatura VARCHAR(30) NOT NULL,
    numeroDias INT NOT NULL,
    valorAlugel DECIMAL(6 , 2 ) NOT NULL,
    idContrato INT NOT NULL,
    CONSTRAINT ALUGUEL_PK PRIMARY KEY (idAluguel , idContrato),
    CONSTRAINT ALUGUEL_CONTRATO_FK FOREIGN KEY (idContrato)
        REFERENCES CONTRATO (idContrato)
        ON DELETE CASCADE,
    CONSTRAINT ALUGUEL_UK UNIQUE KEY (idContrato)
)ENGINE = INNODB AUTO_INCREMENT=1;

CREATE TABLE CLUBEE (
    idClubee INT NOT NULL AUTO_INCREMENT,
    obersvacao VARCHAR(100) DEFAULT NULL,
    idContrato INT NOT NULL,
    idAssinatura INT NOT NULL,
    CONSTRAINT CLUBEE_PK PRIMARY KEY (idClubee , idContrato),
    CONSTRAINT CLUBEE_CONTRATO_FK FOREIGN KEY (idContrato)
        REFERENCES CONTRATO (idContrato)
        ON DELETE CASCADE,
    CONSTRAINT CLUBEE_ASSINATURA_FK FOREIGN KEY (idAssinatura)
        REFERENCES ASSINATURA (idAssinatura)
        ON DELETE CASCADE,
    CONSTRAINT CLUBEE_UK UNIQUE KEY (idAssinatura , idContrato)
)ENGINE = INNODB AUTO_INCREMENT=1;

CREATE TABLE ALIMENTO (
    idAlimento INT NOT NULL AUTO_INCREMENT,
    nomeAlimento VARCHAR(30) NOT NULL,
    valorAlimento DECIMAL(6 , 2 ) NOT NULL,
    CONSTRAINT ALIMENTO_PK PRIMARY KEY (idAlimento)
)ENGINE = INNODB AUTO_INCREMENT=1;

CREATE TABLE MESA (
    idMesa INT NOT NULL AUTO_INCREMENT,
    numeroAssentos INT NOT NULL,
    CONSTRAINT MESA_PK PRIMARY KEY (idMesa)
);

CREATE TABLE MONITOR (
    idMonitor INT NOT NULL AUTO_INCREMENT,
    nomeMonitor VARCHAR(100) NOT NULL,
    emailMonitor VARCHAR(100) NOT NULL,
    dtNascMonitor DATE NOT NULL,
    CONSTRAINT MONITOR_PK PRIMARY KEY (idMonitor)
)ENGINE = INNODB AUTO_INCREMENT=1;

CREATE TABLE RODADA (
    idRodada INT NOT NULL AUTO_INCREMENT,
    dataRodada DATE NOT NULL,
    horaInicio TIME NOT NULL,
    faturaJogo DECIMAL(6 , 2 ) NOT NULL,
    horaFim TIME NOT NULL,
    comanda DECIMAL(6 , 2 ) NOT NULL,
    idMesa INT NOT NULL,
    idMonitor INT NOT NULL,
    CONSTRAINT RODARA_PK PRIMARY KEY (idRodada),
    CONSTRAINT RODADA_MESA_FK FOREIGN KEY (idMesa)
        REFERENCES MESA (idMesa)
        ON DELETE CASCADE,
    CONSTRAINT RODADA_MONITOR_FK FOREIGN KEY (idMonitor)
        REFERENCES MONITOR (idMonitor)
        ON DELETE CASCADE,
    CONSTRAINT RODADA_UK UNIQUE KEY (idMesa , idMonitor)
)ENGINE = INNODB AUTO_INCREMENT=1;

CREATE TABLE CARTAO (
    numCartao BIGINT NOT NULL,
    validadeCartao DATE NOT NULL,
    nomeCartao VARCHAR(50) NOT NULL,
    cvc INT NOT NULL,
    idCliente INT NOT NULL,
    CONSTRAINT CARTAO_PK PRIMARY KEY (numCartao),
    CONSTRAINT CARTAO_CLIENTE_FK FOREIGN KEY (idCliente)
        REFERENCES CLIENTE (idCliente)
        ON DELETE CASCADE,
    CONSTRAINT CARTAO_UK UNIQUE KEY (idCliente , cvc)
)ENGINE = INNODB;

CREATE TABLE telefone (
    idCliente INT NOT NULL,
    telefone BIGINT NOT NULL,
    CONSTRAINT telefone_CLIENTE_FK FOREIGN KEY (idCliente)
        REFERENCES CLIENTE (idCliente),
    CONSTRAINT telefone_UK UNIQUE KEY (idCliente , telefone)
)ENGINE = INNODB;

CREATE TABLE telefoneMonitor (
    idMonitor INT NOT NULL,
    telefoneMonitor BIGINT NOT NULL,
    CONSTRAINT telefoneMonitor_MONITOR_FK FOREIGN KEY (idMonitor)
        REFERENCES MONITOR (idMonitor),
    CONSTRAINT telefoneMonitor_UK UNIQUE KEY (idMonitor , telefoneMonitor)
)ENGINE = INNODB;

CREATE TABLE aluga (
    idProduto INT NOT NULL,
    idContrato INT NOT NULL,
    CONSTRAINT aluga_PRODUTO_FK FOREIGN KEY (idProduto)
        REFERENCES PRODUTO (idProduto)
        ON DELETE CASCADE,
    CONSTRAINT aluga_CONTRATO_FK FOREIGN KEY (idContrato)
        REFERENCES CONTRATO (idContrato)
        ON DELETE CASCADE,
    CONSTRAINT aluga_UK UNIQUE KEY (idProduto , idContrato)
)ENGINE = INNODB;

CREATE TABLE consome (
    idRodada INT NOT NULL,
    idAlimento INT NOT NULL,
    dataVenda DATE NOT NULL,
    horarioVenda TIME NOT NULL,
    CONSTRAINT consome_RODADA_FK FOREIGN KEY (idRodada)
        REFERENCES RODADA (idRodada)
        ON DELETE CASCADE,
    CONSTRAINT consome_ALIMENTO_FK FOREIGN KEY (idAlimento)
        REFERENCES ALIMENTO (idAlimento)
        ON DELETE CASCADE,
    CONSTRAINT consome_UK UNIQUE KEY (idRodada , idAlimento)
)ENGINE = INNODB;

CREATE TABLE joga (
    idRodada INT NOT NULL,
    idJogo INT NOT NULL,
    idProduto INT NOT NULL,
    CONSTRAINT joga_RODADA_FK FOREIGN KEY (idRodada)
        REFERENCES RODADA (idRodada)
        ON DELETE CASCADE,
    CONSTRAINT joga_JOGO_FK FOREIGN KEY (idJogo , idProduto)
        REFERENCES JOGO (idJogo , idProduto)
        ON DELETE CASCADE,
    CONSTRAINT joga_UK UNIQUE KEY (idRodada , idJogo , idProduto)
)ENGINE = INNODB;

CREATE TABLE participa (
    idRodada INT NOT NULL,
    idCliente INT NOT NULL,
    CONSTRAINT participa_RODADA_FK FOREIGN KEY (idRodada)
        REFERENCES RODADA (idRodada)
        ON DELETE CASCADE,
    CONSTRAINT participa_CLIENTE_FK FOREIGN KEY (idCliente)
        REFERENCES CLIENTE (idCliente)
        ON DELETE CASCADE,
    CONSTRAINT participa_UK UNIQUE KEY (idRodada , idCliente)
)ENGINE = INNODB;

CREATE TABLE compra (
    idCliente INT NOT NULL,
    idProduto INT NOT NULL,
    horarioCompra TIME NOT NULL,
    dataCompra DATE NOT NULL,
    CONSTRAINT compra_CLIENTE_FK FOREIGN KEY (idCliente)
        REFERENCES CLIENTE (idCliente)
        ON DELETE CASCADE,
    CONSTRAINT compra_PRODUTO_FK FOREIGN KEY (idProduto)
        REFERENCES PRODUTO (idProduto)
        ON DELETE CASCADE,
    CONSTRAINT compra_UK UNIQUE KEY (idCliente , idProduto)
)ENGINE = INNODB;