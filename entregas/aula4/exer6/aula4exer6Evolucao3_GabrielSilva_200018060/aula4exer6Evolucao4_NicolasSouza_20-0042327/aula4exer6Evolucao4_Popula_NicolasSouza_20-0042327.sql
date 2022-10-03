-- --------  aula4exer6Evolucao4 ----------
--
--                    SCRIPT DE POPULA (DML)
--
-- Data Criacao ...........: 27/07/2022
-- Autor(es) ..............: Nicolas Chagas Souza
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao4
--
-- Ultimas Alteracoes
--   02/08/2022 => Nas tabelas com ID, a população ocorre só dos outros atributos 
--   25/08/2022 => Atualiza sintese do projeto com Perfis.
--   20/09/2022 => Alteração do nome da base. 
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--         => 02 Perfis
--         => 03 Usuários
-- 		   => 01 View
-- ---------------------------------------------------------

USE aula4exer6Evolucao4;

-- -------- POPULA 1 --------

INSERT INTO MODELO (dsModelo) VALUES
('CARRO'),
('MOTOCICLETA'),
('CAMINHÃO'),
('TRICICLO'),
('MONOCICLO ELERICO'),
('BICICLETA ELETRICA'),
('QUADRICICLO');

INSERT INTO CATEGORIA (dsCategoria) VALUES
('GOL 1.8'),
('Honda PCX 150'),
('MB 2220'),
('C-230 Kompressor Avantgarde'),
('Brasinca Blazer'),
('Hyundai Ix35'),
('BMX Elétrica');


INSERT INTO PROPRIETARIO VALUES 
(05784210114, 'Victor Leão', 'Águas Claras', 'Brasília', 'DF', 'M', '2002-03-12'),
(33311122266, 'Yure Breno', 'Guará II', 'Brasília', 'DF', 'M', '2001-08-07'),
(99988877766, 'Vandor da Silva', 'Gama', 'Brasília', 'DF', 'M', '1990-12-31'),
(02255500167, 'Claúdio Roger Guedes', 'Candagolândia', 'Brasília', 'DF', 'M', '1992-05-03'),
(01877116157, 'Gabriel Ferreira', 'Santa Maria', 'Brasília', 'DF', 'M', '2000-04-07'),
(95971440187, 'Raquel de Castro', 'Vicente Pires', 'Brasília', 'DF', 'F', '1985-11-20'),
(39691147130, 'Sofia Menezes', 'Guará I', 'Brasília', 'DF', 'F', '1970-02-09');

INSERT INTO telefone VALUES
(05784210114, 991844198),
(33311122266, 993549134),
(33311122266, 998833123),
(02255500167, 985157271),
(01877116157, 985843148),
(95971440187, 980835181),
(39691147130, 972677614);

INSERT INTO VEICULO VALUES
('JWL9999', 'Rosa', 2020, '9BWHE21JX24060831', 1, 1, 05784210114),
('KQK3K12', 'Vinho', 2015, '1JRKQ21JX93817456', 3, 3, 33311122266),
('VRV1B91', 'Vinho', 2022, '9YYLL39XJ00000000', 2, 2, 33311122266),
('GGG6G66', 'Prata', 1999, '1ZZZZ11XJ66688822', 3, 3, 99988877766),
('JDR2222', 'Dourado', 1996, '7MgA1A85pMlAA9527', 4, 4, 02255500167),
('JGN7063', 'Marrom', 1986,'2A6lcDVsAlAXJ9984', 6, 5, 01877116157),
('JJT1279', 'Verde', 2016, '6XZGDLP192T973012', 4, 6, 99988877766);

INSERT INTO TIPOINFRACAO (dsInfracao, valorInfracao) VALUES
('Velocidade acima da permitida', 550),
('Avanço de sinal vermelho', 300),
('Mexendo no celular enquanto dirige', 1000),
('Direção Perigosa', 2400),
('Embriaguez', 4000),
('Parada na Faixa de Pedestre', 500),
('Cor Ilegal', 1750);

INSERT INTO LOCALINFRACAO (latitude, longitude, velocidadePermitida) VALUES
(113.59006, 3321.10, 60),
(-9.11440, 1234.56, 40),
(50.145, 666.0, 77),
(-123.000, -50.0, 100),
(45.0, 70.0, 80),
(-16.00907, 666.0, 50),
(17.0045, 20.4475, 80);

INSERT INTO AGENTE VALUES
(123456, 'Vinícius Souza', '2022-03-27'),
(456123, 'João Pedro Germano', '2021-03-12'),
(321987, 'Benjamin Lacerda', '2020-01-01'),
(10170041,'LEONARDO CARRIJO','2017-06-08'),
(13736655,'DANIEL RUAS','2020-01-05'),
(11401635,'ADRIANA MIRANDA','2015-09-12'),
(782123, 'Jaco Costa Neto', '2022-04-01');

INSERT INTO INFRACAO (dataInfracao, horarioInfracao, velocidadeAferida, placa, idTipoInfracao, idLocal, matriculaAgente) VALUES
('2022-05-22', '04:33:39', 84, 'JWL9999', 1, 1, 123456),
('2021-12-12', '12:12:12', NULL, 'KQK3K12', 2, 2, 456123),
('2024-12-31', '23:59:59', 99, 'GGG6G66', 3, 3, 456123),
('2016-01-04', '23:59:59', NULL, 'KQK3K12', 5, 3, 456123),
('2020-03-01', '23:59:59', NULL, 'JWL9999', 6, 1, 123456),
('2020-12-05', '23:59:59', NULL, 'KQK3K12', 7, 3, 456123),
('2020-07-03', '23:59:59', 99, 'KQK3K12', 3, 3, 456123);