-- -----------------------------   << Trabalho Final - Lodoteca (Tema 3) >>   -----------------------------
--
--                                        SCRIPT DE POPULACAO (DDL)                                            
-- 
-- Data Criacao ...........: 11/09/2022
-- Autor(es) ..............: Pedro Lucas Cassiano Martins e Samuel Alves Sato 
-- Banco de Dados .........: MySQL 8.0
-- Banco de Dados(nome) ...: TF_3D2_pedromartins;
-- 
-- PROJETO => 01 Base de Dados
--         => 21 Tabelas
--         => 02 Usuários
--
-- ---------------------------------------------------------------------------------------------------------------------
USE TF_3D2_pedromartins;

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
    ('OS SIMPSONS QUADRINHO',34.99, 'P');
	
INSERT INTO OUTROS (descricao, idProduto) VALUES 
	('CANECA COM LOGO DA LOJA', 6),
    ('CASACO LOGO DA LOJA', 7),
    ('CAPA PROTETORA PARA TABULEIROS', 8),
    ('CAMISA LOGO DA LOJA', 9),
    ('PROTEÇÃO DE CANTOS PARA TABULEIRO', 10);

INSERT INTO QUADRINHO (genero, idProduto) VALUES
	('AÇÃO', 11),
    ('AÇÃO', 12),
    ('TERROR', 13),
    ('SUSPENSE', 14),
    ('COMÉDIA', 15);

INSERT INTO JOGO(categoria, idProduto) VALUES	
	(1,1),
    (2,2),
	(3,3),
    (4,4),
    (5,5);

INSERT INTO CLIENTE (nome, email, CPF, RG, CEP, bairro, cidade, dtNasc, profissao, estadoCivil) VALUES
	('Rebeca Antares Franca','RebecaFranca@gmail.com', 32146578912, 931459999, 12346578, 'MONTE ALEGRE', 'NATAL', '1999-08-18', 'Artista', 'S'),
    ('Jade Tartaruga Leão', 'Jadetoruga@gmail.com', 12433578921, 978979369, 12346587, 'BARATÃO', 'RIO DE JANEIRO',  '1997-08-27', 'Gamer', 'S'),
    ('Jackelliny Cabral Machado', 'CCMATHENA@gmail.com', 35146578955, 994549449, 12346558, 'BAIRRO DAS MARINHAS', 'MARANHÃO',  '1998-05-31', 'Mangaká', 'C'),
    ('Gabriel Cassiano de Olivia', 'Gabreidelas@yahoo.com', 12138778944, 933994121, 12346533, 'MONTE ALTO', 'SOBRADINHO', '2000-05-31', 'Pedreiro', 'V'),
    ('Guilherme Cabral Cassiano Martins', 'snuke123@hotmail.com', 98765432123, 932539796, 12346248, 'ARNIQUEIRAS', 'BRASÍLIA', '1996-06-14', 'Streamer', 'C');

INSERT INTO CONTRATO (idCliente, dataContrato , nomeTestemunha1 , nomeTestemunha2 , rgTestemunha1 , rgTestemunha2 , statusContrato) VALUES
	(1, '2021-05-23', 'Lucas Ferreira', 'Maria Sampaio', '1234123', '4657892', 'C'),
	(2, '2022-05-23', 'Henrique de Oliveira', 'Marta Maria dos Santos', '1244123', '4666892', 'V'),
    (3, '2020-05-23', 'Danielle Nery', 'Daniel Oliveira', '1554323', '4657892', 'C'),
    (4, '2020-03-15', 'Jade Souza', 'Gabriel Gomes', '3234153', '3657892', 'C'),
    (5, '2021-11-27', 'Matheus Marcelo Martins', 'Pedro Cabral', '9236623', '6657892', 'V');

INSERT INTO ASSINATURA (descAssinatura , precoAssinatura, limiteEmprestimo , totalIngresso ) VALUES
	('CASUAL', 12.99, 1, 3),
    ('BOARD', 24.99, 2, 6),
    ('HEAVY', 50.99, 3, 9);
    
INSERT INTO ALUGUEL (tipoAssinatura, numeroDias , valorAlugel, idContrato ) VALUES
	('Semanal', 15, 60.00, 1),
    ('Semanal', 10, 30.00, 2),
    ('Semanal', 5, 20.00, 3),
    ('Semanal', 1, 10.00, 4),
    ('Semanal', 20, 80.00, 5);

INSERT INTO CLUBEE(obersvacao, idContrato , idAssinatura) VALUES
	('Contrato sera desfeito no ano seguinte', 1, 2),
    (' ', 2, 3),
    (' ', 4, 3),
    (' ', 3, 2),
    (' ',5, 1);

INSERT INTO ALIMENTO (nomeAlimento, valorAlimento) VALUES
	('Enroladinho de Salsicha', 5.99),
    ('Tapioca de Frango', 11.00),
    ('Chocolate quente', 7.99),
    ('Café Preto', 4.00),
    ('Tapioca de Chocolate', 12.99);

INSERT INTO MESA (numeroAssentos) VALUES
	(3),
	(2),
	(5),
	(7),
	(4);

INSERT INTO MONITOR (nomeMonitor, emailMonitor, dtNascMonitor) VALUES
	('Jorge Matheus Guimarães', 'jmg@gmail.com', '1987-05-05'),
    ('Pedro Henrique Carlos', 'phCarlos@gmail.com', '1998-03-25'),
    ('Matheus Rocha da Silva', 'Matheuzin@gmail.com', '1968-01-22'),
    ('Valéria Matos de Souza', 'ValMatos@yahoo.com', '1992-02-14'),
    ('Maria da Silva Giancarlo', 'MariaGiancarlo213@hotmail.com', '1977-12-07');

INSERT INTO RODADA (dataRodada, horaInicio, faturaJogo, horaFim , comanda, idMesa, idMonitor) VALUES
	('2021-05-23', '14:32', 32.00, '17:00', 15.00, 2, 4),
    ('2021-05-23', '11:30', 52.00, '17:45', 0.00, 4, 5),
	('2021-05-27', '10:30', 72.00, '15:00', 30.00, 1, 3),
    ('2021-05-29', '15:32', 35.00, '18:00', 45.00, 2, 1),
    ('2021-06-02', '09:30', 24.00, '14:00', 105.00, 3, 2);

INSERT INTO CARTAO ( numCartao , cvc, validadeCartao , nomeCartao,  idCliente ) VALUES
	(5444500005055050, 348, '2029-12-31', 'REBECA A FRANCA', 1),
    (4445400004044040, 577, '2030-01-31', 'JADE T LEAO', 2),
    (3000322203033030, 546, '2025-05-31', 'JACKELLINY C MACHADO', 3),
    (2000233302022020, 476, '2027-11-30', 'GABRIEL C DE OLIVIA', 4),
    (1777100001011010, 176, '2028-06-30', 'GUILHERME C C MARTINS', 5);

INSERT INTO telefone (idCliente,telefone) VALUES
	(1, 999459999),
    (2, 999879369),
    (3, 994599499),
    (4, 933991979),
    (5, 991199999);

INSERT INTO telefoneMonitor (idMonitor,telefoneMonitor) VALUES
	(1, 931459999),
    (2, 978979369),
    (3, 994549449),
    (4, 933994121),
    (5, 932539796);

INSERT INTO aluga (idProduto ,idContrato ) VALUES
	(1, 2),
    (4, 5),
    (5, 4),
    (2, 1),
    (3, 3);

INSERT INTO consome (idRodada ,idAlimento ,dataVenda ,horarioVenda ) VALUES
	(1, 2, '2021-05-23', '15:32'),
    (3, 3, '2021-05-27', '14:32'),
    (4, 5, '2021-05-29', '16:32'),
    (5, 3, '2021-06-02', '09:30'),
    (5, 4, '2021-06-02', '11:30');
INSERT INTO joga (idRodada ,idJogo ,idProduto) VALUES
	(1, 3, 3),
    (2, 2, 2),
    (3, 1, 1),
    (4, 4, 4),
    (5, 5, 5);

INSERT INTO participa (idRodada, idCliente) VALUES
	(1, 1),
	(1, 2),
	(2, 2),
	(3, 3),
	(4, 4),
	(4, 5);

INSERT INTO compra (idCliente , idProduto , horarioCompra , dataCompra) VALUES
	(1, 7, '14:30', '2022-02-26'),
    (5, 8, '17:30', '2022-04-13'),
    (3, 9, '10:30', '2022-06-15'),
    (2, 6, '15:30', '2022-08-10'),
    (4, 10, '11:30', '2022-11-20');