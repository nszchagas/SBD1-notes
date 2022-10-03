-- -----------------------------   << Trabalho Final - Ludoteca (Tema 3) >>   -----------------------------
--
--                                        SCRIPT DE CRIACAO (DDL)                                            
-- 
-- Data Criacao ...........: 11/09/2022
-- Autor(es) ..............: Pedro Lucas Cassiano Martins, Samuel Alves Sato, Nicolas Chagas Souza
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: TF_3D_nicolassouza;
--
-- Ultimas Alteracoes
--   19/09/2022 => Alteração do nome da base de dados;
-- 				=> Inclusão de cpf e email como chaves candidatas na tabela CLIENTE;
-- 				=> Remoção da tabela CARTAO;
-- 				=> Criação da tabela MEMBRO;
-- 				=> Inclusão da coluna telefone na tabela CLIENTE;
-- 				=> Alteração do atributo statusContrato para contratoAtivo na tabela CONTRATO;
--              => Inclusão do atributo idCliente na tabela ALUGUEL como FK referenciando CLIENTE;
--              => Alteração do nome da coluna observação na tabela CLUBEE (erro de digitação);
--              => Inclusão do atributo idMembro na tabela CLUBEE como FK referenciando MEMBRO;
--              => Inclusão da engine para criação automática do idMesa na tabela MESA;
--              => Inclusão do atributo telefone na tabela MONITOR;
--              => Correção de erro de digitação no nome da PK de RODADA;
--              => Remoção da UK de RODADA;
--              => Remoção da tabela telefone;
--              => Remoção da tabela telefoneMonitor;
--              => Remoção da UK da tabela consome;
--              => Criação da tabela VENDA;
--              => Criação da tabela tem;
--              => Criação da tabela contem;
-- 
-- 
-- PROJETO => 01 Base de Dados
--         => 22 Tabelas
--         => 02 Usuários
--
-- ---------------------------------------------------------------------------------------------------------------------
-- BASE DE DADOS
CREATE DATABASE
	IF NOT EXISTS
    TF_3D_nicolassouza;

USE TF_3D_nicolassouza;

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
    telefone BIGINT NOT NULL,
    CONSTRAINT CLIENTE_PK PRIMARY KEY (idCliente),
    CONSTRAINT CLIENTE_CPF_UK UNIQUE KEY (CPF),
    CONSTRAINT CLIENTE_EMAIL_UK UNIQUE KEY (email)    
)ENGINE = INNODB AUTO_INCREMENT=1;

CREATE TABLE CONTRATO (
    idContrato INT NOT NULL AUTO_INCREMENT,
    dataContrato DATE NOT NULL,
    nomeTestemunha1 VARCHAR(100) NOT NULL,
    nomeTestemunha2 VARCHAR(100) NOT NULL,
    rgTestemunha1 VARCHAR(14) NOT NULL,
    rgTestemunha2 VARCHAR(14) NOT NULL,
    contratoAtivo BOOLEAN NOT NULL,
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
    idCliente INT NOT NULL,
    CONSTRAINT ALUGUEL_PK PRIMARY KEY (idAluguel , idContrato),
    CONSTRAINT ALUGUEL_CONTRATO_FK FOREIGN KEY (idContrato)
        REFERENCES CONTRATO (idContrato)
			ON DELETE CASCADE,
	CONSTRAINT ALUGUEL_CLIENTE_FK FOREIGN KEY (idCliente)
		REFERENCES CLIENTE (idCliente)
			ON DELETE CASCADE,
    CONSTRAINT ALUGUEL_UK UNIQUE KEY (idContrato)
)ENGINE = INNODB AUTO_INCREMENT=1;


CREATE TABLE MEMBRO (
	idCliente INT NOT NULL,
    numCartao BIGINT NOT NULL,
    validadeCartao DATE NOT NULL,
    nomeCartao VARCHAR(50) NOT NULL,
    cvc INT NOT NULL,
    CONSTRAINT MEMBRO_CLIENTE_FK FOREIGN KEY(idCliente) 
		REFERENCES CLIENTE(idCliente)
			ON DELETE CASCADE,
	CONSTRAINT MEMBRO_PK PRIMARY KEY (idCliente)
);


CREATE TABLE CLUBEE (
    idClubee INT NOT NULL AUTO_INCREMENT,
    observacao VARCHAR(100) DEFAULT NULL,
    idContrato INT NOT NULL,
    idAssinatura INT NOT NULL,
    idMembro INT NOT NULL,
    CONSTRAINT CLUBEE_PK PRIMARY KEY (idClubee , idContrato),
    CONSTRAINT CLUBEE_CONTRATO_FK FOREIGN KEY (idContrato)
        REFERENCES CONTRATO (idContrato)
			ON DELETE CASCADE,
    CONSTRAINT CLUBEE_ASSINATURA_FK FOREIGN KEY (idAssinatura)
        REFERENCES ASSINATURA (idAssinatura)
			ON DELETE CASCADE,
    CONSTRAINT CLUBEE_UK UNIQUE KEY (idAssinatura , idContrato),
    CONSTRAINT CLUBEE_MEMBRO_FK FOREIGN KEY (idMembro) 
		REFERENCES MEMBRO (idCliente)
			ON DELETE CASCADE
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
)ENGINE = INNODB AUTO_INCREMENT=1;

CREATE TABLE MONITOR (
    idMonitor INT NOT NULL AUTO_INCREMENT,
    nomeMonitor VARCHAR(100) NOT NULL,
    emailMonitor VARCHAR(100) NOT NULL,
    dtNascMonitor DATE NOT NULL,
    telefone BIGINT NOT NULL,
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
    CONSTRAINT RODADA_PK PRIMARY KEY (idRodada),
    CONSTRAINT RODADA_MESA_FK FOREIGN KEY (idMesa)
        REFERENCES MESA (idMesa)
			ON DELETE CASCADE,
    CONSTRAINT RODADA_MONITOR_FK FOREIGN KEY (idMonitor)
        REFERENCES MONITOR (idMonitor)
			ON DELETE CASCADE
)ENGINE = INNODB AUTO_INCREMENT=1;

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
			ON DELETE CASCADE
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

CREATE TABLE VENDA (
	idVenda INT NOT NULL AUTO_INCREMENT,
    dataVenda DATE NOT NULL,
    horaVenda TIME NOT NULL,
    CONSTRAINT VENDA_PK PRIMARY KEY (idVenda)
) ENGINE = INNODB AUTO_INCREMENT=1;


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

CREATE TABLE tem (
	idVenda INT NOT NULL, 
    idProduto INT NOT NULL,
    CONSTRAINT tem_VENDA_FK FOREIGN KEY (idVenda)
		REFERENCES VENDA(idVenda)
			ON DELETE CASCADE,
	CONSTRAINT tem_PRODUTO_FK FOREIGN KEY (idProduto)
		REFERENCES PRODUTO(idProduto)
			ON DELETE CASCADE
);

CREATE TABLE contem (
	idVenda INT NOT NULL,
    idAlimento INT NOT NULL,
    CONSTRAINT contem_VENDA_FK FOREIGN KEY (idVenda) 
		REFERENCES VENDA(idVenda)
			ON DELETE CASCADE,
	CONSTRAINT ccontem_ALIMENTO_FK FOREIGN KEY (idAlimento)
		REFERENCES ALIMENTO(idAlimento)
			ON DELETE CASCADE
);


