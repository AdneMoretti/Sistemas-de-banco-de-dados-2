-- --------------- revisaoAposP1AdneMoreira ----------------
--             SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 12/06/2023
-- Autor(es) ..............: Adne Moretti Moreira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: bdFinanceiro
--
-- PROJETO => 01 Base de Dados
--         => 03 Tabelas
--         => 01 Visoes
-- Ultimas alterações
-- 		   => 12/06 - Modificando descricao de consulta e adicionando tabela de tempos
-- 
-- ---------------------------------------------------------
USE mercado;

-- AA: 
-- Mostrar o numero de vendas das lojas em dias que sao feriados ordenados por ordem decrescente
-- Consulta importante para a diretoria entender quais as lojas que precisam de maior quantidade de funcionários
-- trabalhando de forma a atender corretamente os clientes nos feriados
-- 
SELECT S.idStore, S.`type`, COUNT(V.idStore) as quantidade_vendas
	FROM STORE S JOIN VENDAS_SEMANAIS V 
    ON V.idStore = S.idStore
    WHERE V.isHoliday = 1
    GROUP BY S.idStore
    ORDER BY quantidade_vendas DESC;
    

-- A consulta em questão não precisa de índice, pois está sendo agrupado e ordenado
-- pelo idStore, que e uma chave primaria da loja, e por ser primaria ja possui indice

-- BB:
-- A consulta consiste em visualizar id da loja, tipo da loja, departamento da venda
-- e a soma da quantidade de vendas por dia.
-- Consulta importante para a diretoria entender quais os tipos de loja que arrecadaram mais dinheiro para investir mais
CREATE OR REPLACE VIEW vTipo AS SELECT S.`type`, SUM(V.weeklySales) as valor_arrecadado
	FROM STORE S LEFT JOIN VENDAS_SEMANAIS V 
    ON V.idStore = S.idStore
    GROUP BY S.`type`
    ORDER BY valor_arrecadado DESC;

-- Seria interessante a criação de um indice para o atributo tipo, que nao possui indice e poderia deixar a criação da view mais otimizada, 
-- a criacao poderia ser por meio do seguinte comando 
CREATE INDEX type_store ON STORE(type);
-- Tempos 
--  # |  SEM    | COM 
-- 	1 |	0.015  | 0.00
-- 	2 | 0.016  | 0.00
-- 	3 | 0.015  | 0.015
-- 	4 | 0.016  | 0.015
-- 	5 | 0.015  | 0.00
-- MEDIA | 0.0154 | 0.06
