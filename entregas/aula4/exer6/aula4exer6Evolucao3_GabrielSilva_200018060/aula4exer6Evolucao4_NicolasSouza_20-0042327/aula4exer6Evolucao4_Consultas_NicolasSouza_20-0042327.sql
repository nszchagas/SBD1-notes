-- --------  aula4exer6Evolucao4 ----------
--
--                    SCRIPT DE CONSULTAS (DML)
--
-- Data Criacao ...........: 27/07/2022
-- Autor(es) ..............: Nicolas Chagas Souza
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6Evolucao3
--
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
--         => 02 Perfis
--         => 03 Usuários
--         => 01 View
--
-- ---------------------------------------------------------

USE aula4exer6Evolucao4;

-- A) Apresentar todos os dados dos veículos de um determinado proprietário fornecido pelo usuário, 
-- relacionando por extenso a categoria que cada um é classificado (em VIEW) ;
SELECT * FROM V_DADOS_VEICULOS WHERE proprietario = '99988877766';


SELECT * FROM PROPRIETARIO;
SELECT * FROM VEICULO;

-- B) Consultar proprietário(s) por qualquer parte do nome fornecido pelo usuário;

SELECT * FROM PROPRIETARIO p
	WHERE p.nomeProp LIKE '%ict%';
    
-- C) Mostrar os dados da infração e do veículo que tiveram infrações cadastradas 
-- no Detran em um período (ou data) no padrão DE... ATÉ...;

SELECT * 
	FROM INFRACAO i JOIN VEICULO v
		ON i.placa = v.placa
			WHERE i.dataInfracao BETWEEN '2020-06-01' AND '2020-12-31';
        
-- D) Pesquisar quantos veículos existem cadastrados por Modelo, inclusive apresentando os modelos 
-- cadastrados que não tiverem nenhum veículo cadastrado, se existir tal situação.

SELECT m.dsModelo as Modelo, COUNT(v.placa) AS Quantidade FROM
	MODELO m LEFT JOIN VEICULO v
		ON m.idModelo = v.idModelo
			GROUP BY m.dsModelo;