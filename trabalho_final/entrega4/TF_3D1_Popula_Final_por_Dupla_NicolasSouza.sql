-- -------  Trabalho Final  ----------
--
--                    SCRIPT DE POPULA (DML)
--
-- Data Criacao ...........: 31/08/2022
-- Autor(es) ..............: Nicolas Chagas Souza, Mateus Vinicius Ferreira Franco e Thiago Franca Vale Oliveira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_3D1_nicolassouza
--
-- Ultimas Alteracoes
--   31/08/2022 => Criacao do script
-- 	 12/09/2022 => Criacao da tabela joga
--
-- PROJETO => 01 Base de Dados
--         => 18 Tabelas
-- 		   => 04 Usuarios
--
-- ---------------------------------------------------------

USE TF_3D1_nicolassouza;

-- ---------- POPULA 1 -------------
INSERT INTO PESSOA VALUES
	(12018485040, 'João Pedro da Silva', '2002-03-12', 61975863254, 'joao@gmail.com', 71996580, 'Rua 7', 'Setor Habitacional Arniqueira', 5, 'Brasília', 'DF', 'C'),
    (78704526023, 'Pedro Sampaio Correa', '1980-05-21', 6196582563, 'pedro@gmail.com', 70070701, 'Rua 8', 'Asa Norte', 6, 'Brasília', 'DF', 'C'),
    (38312426078, 'Matheus Fernandes Lima', '2001-08-07', 6175652305, 'matheus@gmail.com', 70252020, 'Rua 9', 'Varjão', 7, 'Brasília', 'DF', 'C'),
    (95123866078, 'Bianca Rodrigues Nunes', '1990-12-31', 6141536852, 'bianca@gmail.com', 72150113, 'Rua 10', 'Núcleo Bandeirante', 8, 'Brasília', 'DF', 'F'),
    (50375636072, 'Amanda Cristina Pereira ', '1992-05-03', 6185632547, 'amanda@gmail.com', 72015040, 'Rua 11', 'Cruzeiro Velho', 9, 'Brasília', 'DF', 'F'),
    (59386100010, 'Rogério Mücke Ceni', '1973-01-22', 61985652536,'rogeriocenisp@gmail.com', 04338030, 'Rua 12', 'Americanópolis', 10, 'São Paulo', 'SP', 'F'),
    (10613963040, 'Anderson Silva', '1975-04-14', 6199639851, 'andersonsilva@gmail.com', 56508365, 'Rua 13', 'Boa Esperança', 11, 'ArcoVerde', 'PE', 'F'),
    (70406645000, 'Luana Piovani','1976-08-29', 6199797165, 'luanapiovani@gmail.com', 69850970, 'Rua 14', 'Boca do Acre', 12, 'Platô do Piquiá' ,'AM', 'F'),
    (97770635047, 'Ciro Gomes da Cruz', '1930-05-01', 6186163666,'gomesciro@gmail.com', 58030350, 'Rua 15','Estados', 13, 'João Pessoa', 'PB', 'C'),
    (46918558072, 'Giorgian De Arrascaeta', '1994-06-01', 62985632541, 'arrascaeta@gmail.com', 75349980, 'Rua 16', 'Setor Central', 14, 'Abadia de Goias', 'GO', 'C'),
    (41984981235, 'Elizabeth da Silva Santos', '2000-01-16', 63991812324, 'elizabeth@gmail.com', 88062204, 'Rua 10', 'Lagoa da Conceição', 25, 'Florianópolis', 'SC', 'F');
    

INSERT INTO FUNCIONARIO VALUES 
	('2022-05-14', 1800, 'M', 95123866078, null), -- Amanda
    ('2022-06-15', 1850, 'M', 50375636072, null),	-- Bianca
    ('2022-07-07', 1850, 'M', 59386100010, null),	-- Rogério
    ('2021-01-25', 1800, 'G', 10613963040, null), -- Anderson Silva
    ('2022-08-30', 1850, 'G', 70406645000, null), -- Luana Piovani
    ('2022-01-01', 1850, 'G', 41984981235, '2022-06-30'); -- Elizabeth
    
INSERT INTO CLUBE (limiteJogos, preco) VALUES
	(5,	50.0), 
    (10, 100.00),
    (15, 150.00),
    (20, 200.00),
    (25, 250.00);
    
INSERT INTO MEMBRO VALUES 
	(12018485040, 552602541254, '2022-04-25', 171, 'JOAO PEDRO DA SILVA',  1, '2022-05-01'),
    (97770635047, 965835266541, '2022-04-25',1172, 'CIRO GOMES', 2, '2022-08-15'),
    (78704526023, 523641256325, '2022-04-25', 173, 'PEDRO SAMPAIO', 3, '2022-09-05'),
    (38312426078, 147258369123, '2022-04-25', 174,'MATHEUS FERNANDES', 4, '2021-12-10'),
    (46918558072, 589625631452, '2022-04-25', 175, 'GIORGIAN ARRASCAETA', 5, '2022-09-01');
    
INSERT INTO CATEGORIA (cor, descricao) VALUES
	('AZUL', 'Ação e Aventura'),
    ('VERMELHO', 'RPG'),
    ('LARANHA', 'Estratégia'),
    ('ROXO', 'Esportes');
    
INSERT INTO ARTIGO VALUES
	(1, 'XADREZ', 'J', FALSE, FALSE, 3),
    (2, 'DETETIVE', 'J', TRUE, FALSE, 3),
    (4, 'MONOPOLY', 'J', FALSE, FALSE, 1),
    (5, 'BATMAN', 'Q', TRUE, FALSE, 1),
    (3, 'SUPERMAN', 'Q', TRUE, FALSE, 1);
    
INSERT INTO MESA VALUES 
	(1),
    (2),
    (3),
    (4),
    (5);

INSERT INTO JOGADOR VALUES
	('Jogador1', 2),
    ('Jogador2', 2),
    ('Jogador3', 2),
    ('Rodinei',	3),
    ('ViniciusJr', 3);
    
INSERT INTO COMANDA (idMesa, idGarcom) VALUES
	(1, 10613963040),
    (1, 10613963040),
    (2, 10613963040),
    (3,	70406645000),
    (5, 70406645000);

INSERT INTO LANCHE (nome, preco) VALUES
	('Crepe de Frango', 20.00),
    ('Crepe de Carne', 25.00),
    ('Sanduíche de Mortadela', 5.50),
    ('X-TUDO', 12.00),
    ('X-SALADA', 10.00);
    
INSERT INTO PRODUTO (nome, valor) VALUES 
	('Camiseta Simples', 45.00),
	('Camiseta Estampada', 55.00),
    ('Moletom Estampado', 95.00),
    ('Caneca Personalizada', 20.00),
    ('Chaveiro', 5.00);
    
INSERT INTO CONTA (dataPagamento, formaPagamento, idComanda) VALUES
	('2022-08-30', 'DEB', 1),
    ('2022-07-30', 'CRE', 2),
    ('2022-06-14', 'DEB', 3),
    ('2022-08-12', 'PIX', 4),
    ('2022-08-30', 'DIN', 5);
    
INSERT INTO PARTIDA (dtPartida, copiaArtigo, nomeArtigo, idMonitor) VALUES
	('2022-08-30', 1, 'XADREZ', 95123866078),
    ('2022-08-30', 2, 'DETETIVE', 50375636072),
    ('2022-07-26', 2, 'DETETIVE', 50375636072),
    ('2022-06-15', 2, 'DETETIVE', 95123866078),
    ('2022-07-26', 1, 'XADREZ', 95123866078);

INSERT INTO ALUGUEL (dtAluguel, valor, contratoPath, idCliente, dtDevolucao) VALUES
	('2022-05-14', 50.0, '/data/contratos/2022/maio/12018485040.pdf', 12018485040, '2022-06-21'),
    ('2022-06-15', 60.0, '/data/contratos/2022/junho/46918558072.pdf', 46918558072, '2022-06-25'),
    ('2022-07-26', 70.0, '/data/contratos/2022/julho/38312426078.pdf', 38312426078, '2022-08-17'),
    ('2022-06-15', 100.00, '/data/contratos/2022/junho/78704526023.pdf', 78704526023, '2022-06-30'),
    ('2022-07-26', 120.00, '/data/contratos/2022/julho/12018485040.pdf', 12018485040, '2022-08-10');
    
INSERT INTO inclui VALUES
	(1, 1, 'XADREZ'),
    (2, 1, 'XADREZ'),
    (3, 2, 'DETETIVE'),
    (4, 2, 'DETETIVE'),
    (5, 4, 'MONOPOLY');

INSERT INTO possui VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);


INSERT INTO contem VALUES
	(1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);
    
INSERT INTO joga VALUES 
	('Jogador1', 150, 2),
    ('Jogador2', 100, 2),
    ('Jogador3', 190, 2),
    ('Rodinei', 100, 1),
    ('ViniciusJr', 90, 1);
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
	