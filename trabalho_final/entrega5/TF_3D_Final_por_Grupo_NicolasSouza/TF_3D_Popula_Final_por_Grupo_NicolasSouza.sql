-- -----------------------------   << Trabalho Final - Ludoteca (Tema 3) >>   -----------------------------
--
--                                        SCRIPT DE POPULACAO (DDL)                                            
-- 
-- Data Criacao ...........: 11/09/2022
-- Autor(es) ..............: Pedro Lucas Cassiano Martins, Samuel Alves Sato, Nicolas Chagas Souza, Mateus Vinicius Ferreira Franco e Thiago Franca Vale Oliveira
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: TF_3D_nicolassouza;
--
-- Ultimas Alteracoes
--   19/09/2022 => Alteração do nome da base de dados;
--              => Adição de mais 15 tuplas em Produto;
--              => Adição de mais 05 tuplas em várias tabelas;
--              => Adição de mais 07 tuplas em Assinatura;
--              => Alteração do atributo statusContrato de CHAR para BOOLEAN;
--              => Alteração da relação Cartao para Membro;
--              => Retirada da relação telefone;
--              => Retirada da relação telefone;
--              => Adição de telefone em Cliente;
--              => Adição de telefoneMontior em Monitor;
--              => Adição e população da relação tem;
--              => Adição e população da relação contem;
--              => Adição e população da relação Venda;
-- PROJETO => 01 Base de Dados
--         => 22 Tabelas
--         => 06 Usuários
--
-- ---------------------------------------------------------------------------------------------------------------------
USE TF_3D_nicolassouza;


INSERT INTO PRODUTO (nome, preco, statusProduto) VALUES
	('SPYFALL', 348.99, 'P'),
    ('QUEST', 129.99, 'P'),
    ('DOMINÓ', 99.99, 'D'),
    ('IMAGEM & ACAO', 119.99, 'D'),
    ('JOGO DA VIDA', 199.99, 'P'),
	
	('CANECA LUDOTECA', 70.99, 'P'),
    ('CASACO LUDOTECA', 128.99, 'P'),
    ('CAPA PROTETORA PARA TABULEIROS', 48.99, 'P'),
    ('CAMISA LUDOTECA', 348.99, 'P'),
    ('PROTEÇÃO DE QUINA DE TABULEIRO', 34.99, 'P'),
    
	('HOMEM-ARANHA ANNUAL 4', 34.99, 'P'),
    ('BATMAN ANO 0', 34.99,'P'),
    ('BLOODBORNE TERROR COSMICO',34.99, 'P'),
    ('SANDMAN', 34.99,'P'),
    ('OS SIMPSONS QUADRINHO',34.99, 'P'),
    
    ('IMAGEM & AÇÃO 2', 448.99, 'P'),
    ('QUEST 2', 129.99, 'P'),
    ('BATALHA NAVAL', 79.99, 'D'),
    ('SHERLOCK HOLMES', 139.99, 'D'),
    ('QUEM SOU EU?', 19.99, 'P'),
    
    ('COPO LUDOTECA', 30.99, 'P'),
    ('MOLETOM LUDOTECA', 428.99, 'P'),
    ('CAPA DE HERÓI', 48.99, 'P'),
    ('CAMISA DE HERÓI', 368.99, 'P'),
    ('PEÃO DE XADREZ', 34.99, 'P'),
    
	('SUPERMAN ANNUAL 4', 34.99, 'P'),
    ('BATMAN ANO 1', 34.99,'P'),
    ('DARK SOULS',34.99, 'P'),
    ('ELDEN RING', 34.99,'P'),
    ('DEMOLIDOR ISSUE 23 1995',34.99, 'P');
	
INSERT INTO OUTROS (descricao, idProduto) VALUES 
	('CANECA COM LOGO DA LOJA', 6),
    ('CASACO LOGO DA LOJA', 7),
    ('CAPA PROTETORA PARA TABULEIROS', 8),
    ('CAMISA LOGO DA LOJA', 9),
    ('PROTEÇÃO DE CANTOS PARA TABULEIRO', 10),
    
    ('COPO COM LOGO DA LOJA', 21),
    ('MOLETOM LOGO DA LOJA', 22),
    ('CAPA DO HOMELANDER', 23),
    ('CAMISA DO A-TRAIN', 24),
    ('PEÇA DE XADREZ PEÃO', 25);

INSERT INTO QUADRINHO (genero, idProduto) VALUES
	('AÇÃO', 11),
    ('AÇÃO', 12),
    ('TERROR', 13),
    ('SUSPENSE', 14),
    ('COMÉDIA', 15),
    
    ('HEROI',26),
    ('HEROI', 27),
    ('MEDIEVAL', 28),
    ('MEDIEVAL', 29),
    ('HEROI', 30);

INSERT INTO JOGO(categoria, idProduto) VALUES	
	('AMARELO',1),
    ('AZUL',2),
	('AMARELO',3),
    ('DOURADO',4),
    ('ROSA',5),
    
    ('AMARELO',16),
    ('AZUL',17),
	('DOURADO',18),
    ('ROSA',19),
    ('ROSA',20);

INSERT INTO CLIENTE (nome, email, CPF, RG, CEP, bairro, cidade, dtNasc, profissao, estadoCivil, telefone) VALUES
	('Rebeca Antares Franca','RebecaFranca@gmail.com', 32146578912, 9314599, 12346578, 'MONTE ALEGRE', 'NATAL', '1999-08-18', 'Artista', 'S', 999459999),
    ('Jade Tartaruga Leão', 'Jadetoruga@gmail.com', 12433578921, 9789799, 12346587, 'BARATÃO', 'RIO DE JANEIRO',  '1997-08-27', 'Gamer', 'S', 999879369),
    ('Jackelliny Cabral Machado', 'CCMATHENA@gmail.com', 35146578955, 9945499, 12346558, 'BAIRRO DAS MARINHAS', 'MARANHÃO',  '1998-05-31', 'Mangaká', 'C', 994599499),
    ('Gabriel Cassiano de Olivia', 'Gabreidelas@yahoo.com', 12138778944,9339921, 12346533, 'MONTE ALTO', 'SOBRADINHO', '2000-05-31', 'Pedreiro', 'V', 933991979),
    ('Guilherme Cabral Cassiano Martins', 'snuke123@hotmail.com', 9876532, 932539796, 12346248, 'ARNIQUEIRAS', 'BRASÍLIA', '1996-06-14', 'Streamer', 'C', 991199999),
    
	('Vanderlea Roque','vcmr@gmail.com', 34657818912, 9314539, 72346578, 'MONTE FELIZ', 'NATAL', '1965-09-18', 'Dona de Empresa', 'V', 989459999),
    ('Ana Lúcia', 'aninha2312@gmail.com', 21443578921, 9889839, 32146587, 'NOVA COLINA', 'BRASÍLIA',  '1966-08-27', 'SEGURANÇA', 'S', 987879369),
    ('Victor de Souza', 'vasco2501@gmail.com', 35146577755, 9945949, 22246558, 'SAMAMBAIA', 'BRASÍLIA',  '2001-05-31', 'MASSAGISTA', 'C', 998979499),
    ('Larisa de Oliveira', 'larissinha@yahoo.com', 12138758944, 9224411, 23146533, 'RIACHO FUNDO', 'BRASÍLIA', '1989-01-31', 'ENGENHEIRA', 'V', 933990079),
    ('Márcia Cabral', 'masco@hotmail.com', 97865432123, 9885976, 13442248, 'RIACHO FUNDO 2', 'BRASÍLIA', '2003-06-14', 'Streamer', 'C', 990800999);

INSERT INTO CONTRATO (idCliente, dataContrato , nomeTestemunha1 , nomeTestemunha2 , rgTestemunha1 , rgTestemunha2 , contratoAtivo) VALUES
	(1, '2021-05-23', 'Lucas Ferreira', 'Maria Sampaio', '1234123', '4657892', true),
	(2, '2022-05-23', 'Henrique de Oliveira', 'Marta Maria dos Santos', '1244123', '4666892', true),
    (3, '2020-05-23', 'Danielle Nery', 'Daniel Oliveira', '1554323', '4657892', true),
    (4, '2020-03-15', 'Jade Souza', 'Gabriel Gomes', '3234153', '3657892', true),
    (5, '2021-11-27', 'Matheus Marcelo Martins', 'Pedro Cabral', '9236623', '6657892', false),
    
	(6, '2021-12-23', 'Mateus Ferreira', 'Chico Souza', '2234123', '4657892', true),
	(7, '2022-02-14', 'Gabriel de Oliveira', 'Maria dos Santos', '1244123', '4666892', false),
    (8, '2022-02-27', 'Heitor Nery', 'Daniel Oliveira', '5554323', '4657892', true),
    (9, '2022-03-13', 'Suna Izidro', 'Isis Sozua', '3334153', '3657892', false),
    (10, '2022-05-30', 'Pedro Marcelo Martins', 'Jaqueline Cabral', '9236623', '6657892', true);

INSERT INTO ASSINATURA (descAssinatura , precoAssinatura, limiteEmprestimo , totalIngresso ) VALUES
	('CASUAL', 12.99, 1, 3),
    ('BOARD', 24.99, 2, 6),
    ('HEAVY', 50.99, 3, 9),
    
    ('CASUAL SIMPLES', 7.99, 1, 1),
    ('BOARD PREMIUM', 30.99, 3, 5),
    ('HEAVY DUTY', 60.99, 4, 10),
    
	('CASUAL DELUXE', 7.99, 2, 4),
    ('BOARD ESSENTIAL', 40.99, 4, 7),
    ('HEAVY PLATINUM', 70.99, 5, 11),
    
    ('PLUS CORE MASTER', 150.00, 10, 10); 
    
INSERT INTO ALUGUEL (tipoAssinatura, numeroDias , valorAlugel, idContrato, idCliente ) VALUES
	('Semanal', 15, 60.00, 1, 1),
    ('Semanal', 10, 30.00, 2, 2),
    ('Semanal', 5, 20.00, 3, 3),
    ('Semanal', 1, 10.00, 4, 4),
    ('Semanal', 20, 80.00, 5, 5),
    
	('Diário', 1, 2.00, 6, 6),
    ('Diário', 2, 4.00, 7, 7),
    ('Diário', 3, 5.00, 8, 8),
    ('Diário', 4, 8.00, 9, 9),
    ('Semanal', 25, 90.00, 10, 10);

INSERT INTO MEMBRO (idCliente, numCartao , cvc, validadeCartao , nomeCartao) VALUES
	(1, 5444500005055050, 348, '2029-12-31', 'REBECA A FRANCA'),
    (2, 4445400004044040, 577, '2030-01-31', 'JADE T LEAO'),
    (3, 3000322203033030, 546, '2025-05-31', 'JACKELLINY C MACHADO'),
    (4, 2000233302022020, 476, '2027-11-30', 'GABRIEL C DE OLIVIA'),
    (5, 1777100001011010, 176, '2028-06-30', 'GUILHERME C C MARTINS'),
    
	(6, 5224500005055050, 344, '2029-12-31', 'VANDERLEA R CASSIANO'),
    (7, 4005400004044040, 227, '2030-01-31', 'VICTOR DE S CABRAL'),
    (8, 3220322203033030, 576, '2025-05-31', 'ANA L R CASSIANO'),
    (9, 3400233302022020, 686, '2027-11-30', 'LARISSA ROQUE'),
    (10, 1557100001011010, 694, '2028-06-30', 'MARCIA C CABRAL');
    

INSERT INTO CLUBEE(observacao, idContrato , idAssinatura, idMembro) VALUES
	('Contrato sera desfeito no ano seguinte', 1, 2, 3),
    (' ', 2, 3, 2),
    (' ', 4, 3, 1),
    (' ', 3, 2, 6),
    (' ', 5, 1, 5),
    
	('Contrato sera desfeito na semana seguinte', 6, 6, 7),
    (' ', 7, 7, 8),
    (' ', 8, 8, 9),
    (' ', 9, 9, 10),
    (' ', 10, 10, 4);

INSERT INTO ALIMENTO (nomeAlimento, valorAlimento) VALUES
	('Enroladinho de Salsicha', 5.99),
    ('Tapioca de Frango', 11.00),
    ('Chocolate quente', 7.99),
    ('Café Preto', 4.00),
    ('Tapioca de Chocolate', 12.99),
    
	('Enroladinho de Queijo', 5.99),
    ('Tapioca de Tomate', 11.00),
    ('Chá quente', 7.99),
    ('Café com leite', 4.00),
    ('Tapioca de Morango', 12.99);

INSERT INTO MESA (numeroAssentos) VALUES
	(3),
	(2),
	(5),
	(7),
	(4),
	(3),
	(2),
	(8),
	(7),
	(10);

INSERT INTO MONITOR (nomeMonitor, emailMonitor, dtNascMonitor, telefone) VALUES
	('Jorge Matheus Guimarães', 'jmg@gmail.com', '1987-05-05', 931459229),
    ('Pedro Henrique Carlos', 'phCarlos@gmail.com', '1998-03-25', 978979779),			
    ('Matheus Rocha da Silva', 'Matheuzin@gmail.com', '1968-01-22', 994542349),
    ('Valéria Matos de Souza', 'ValMatos@yahoo.com', '1992-02-14', 933304121),
    ('Maria da Silva Giancarlo', 'MariaGiancarlo213@hotmail.com', '1977-12-07', 932659796),
    
	('Ítalo de Souza', 'italis@gmail.com', '1988-05-05', 931989999),
    ('Pedro Henrique Carlos', 'phCarlos@gmail.com', '1998-03-25', 978669369),
    ('Carlos da Silva', 'carloschico@gmail.com', '1964-01-22', 932549449),
    ('Vanessa de Rocha', 'VRock@yahoo.com', '1992-02-14', 935594121),
    ('Silva Machado', 'SilvaMachado1@hotmail.com', '1987-12-07', 943539796);

INSERT INTO RODADA (dataRodada, horaInicio, faturaJogo, horaFim , comanda, idMesa, idMonitor) VALUES
	('2021-05-23', '14:32', 32.00, '17:00', 15.00, 2, 4),
    ('2021-05-23', '11:30', 52.00, '17:45', 0.00, 4, 5),
	('2021-05-27', '10:30', 72.00, '15:00', 30.00, 1, 3),
    ('2021-05-29', '15:32', 35.00, '18:00', 45.00, 2, 1),
    ('2021-06-02', '09:30', 24.00, '14:00', 105.00, 3, 2),
    
	('2021-06-03', '14:32', 32.00, '17:00', 15.00, 7, 10),
    ('2021-06-04', '11:30', 52.00, '17:45', 0.00, 8, 8),
	('2021-06-22', '10:30', 72.00, '15:00', 30.00, 9, 6),
    ('2021-06-29', '15:32', 35.00, '18:00', 45.00, 6, 7),
    ('2021-06-30', '09:30', 24.00, '14:00', 105.00, 10, 9);
    
INSERT INTO aluga (idProduto ,idContrato ) VALUES
	(1, 2),
    (4, 5),
    (5, 4),
    (2, 1),
    (3, 3),
	(7, 7),
    (6, 6),
    (8, 8),
    (9, 9),
    (10, 10);

INSERT INTO consome (idRodada ,idAlimento ,dataVenda ,horarioVenda ) VALUES
	(1, 2, '2021-05-23', '15:32'),
    (3, 3, '2021-05-27', '14:32'),
    (4, 5, '2021-05-29', '16:32'),
    (5, 3, '2021-06-02', '09:30'),
    (5, 4, '2021-06-02', '11:30'),
	(6, 6, '2021-06-03', '15:32'),
    (7, 3, '2021-06-04', '14:32'),
    (8, 5, '2021-06-22', '16:32'),
    (9, 3, '2021-06-29', '09:30'),
    (10, 4, '2021-06-30', '11:30');

INSERT INTO joga (idRodada ,idJogo ,idProduto) VALUES
	(1, 3, 3),
    (2, 2, 2),
    (3, 1, 1),
    (4, 4, 4),
    (5, 5, 5),
	(6, 8, 18),
    (7, 9, 19),
    (8, 7, 17),
    (9, 6, 16),
    (10, 10, 20);

INSERT INTO participa (idRodada, idCliente) VALUES
	(1, 1),
	(1, 2),
	(2, 2),
	(3, 3),
	(4, 4),
	(4, 5),
	(1, 7),
	(6, 8),
	(6, 9),
	(7, 10),
	(8, 9),
	(10, 6);

INSERT INTO VENDA (dataVenda ,horaVenda) VALUES
	('2021-05-23', '15:32'),
    ('2021-05-27', '14:32'),
    ( '2021-05-29', '16:32'),
    ( '2021-06-02', '09:30'),
    ('2021-06-02', '11:30'),
	( '2021-06-03', '15:32'),
    ( '2021-06-04', '14:32'),
    ( '2021-06-22', '16:32'),
    ('2021-06-29', '09:30'),
    ( '2021-06-30', '11:30');
    
INSERT INTO tem (idVenda , idProduto) VALUES
(1, 1),
(2,2),
(3,3),
(4,7),
(5,12),
(6, 15),
(7, 18),
(8, 23),
(9, 11),
(10, 16);


INSERT INTO compra (idCliente , idProduto , horarioCompra , dataCompra) VALUES
	(1, 7, '14:30', '2022-02-26'),
    (5, 8, '17:30', '2022-04-13'),
    (3, 9, '10:30', '2022-06-15'),
    (2, 6, '15:30', '2022-08-10'),
    (4, 10, '11:30', '2022-11-20'),
	(6, 15, '14:30', '2022-02-26'),
    (7, 18, '17:30', '2022-04-13'),
    (8, 20, '10:30', '2022-06-15'),
    (8, 30, '15:30', '2022-08-10'),
    (10, 29, '11:30', '2022-11-20');
    
INSERT INTO contem (idVenda , idAlimento) VALUES
	(1, 1),
	(1, 2),
	(2, 2),
	(3, 3),
	(4, 4),
	(4, 5),
	(1, 7),
	(6, 8),
	(6, 9),
	(7, 10),
	(8, 9),
	(10, 6);