/*﻿-- --------  << aula6exer4evolucao4 >>  ----------
--
--                    SCRIPT DE CONSULTAS (DML)
--
-- Data Criacao ...........: 25/01/2023
-- Autor(es) ..............: Adne Moretti Moreira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula6exer4evolucao2
--
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- ---------------------------------------------------------*/

-- A
SELECT * FROM EMPREGADO E, DEPARTAMENTO D 
WHERE E.numeroDepartamento = D.numeroDepartamento AND D.nomeDepartamento = "Requisitos";

-- B
SELECT * FROM DEPARTAMENTO D LEFT JOIN (
SELECT E.*
FROM gerencia g INNER JOIN EMPREGADO E ON g.matricula = E.matricula)
resultado ON D.numeroDepartamento = resultado.numeroDepartamento;

-- C
SELECT * FROM EMPREGADO E 
WHERE E.dtNascimento 
BETWEEN '1990-08-07' AND '1994-02-11';

-- D
SELECT P.nomeProjeto, P.numeroProjeto, COUNT(*) 
FROM PROJETO P, trabalha t 
WHERE t.numeroProjeto = P.numeroProjeto 	
GROUP BY P.numeroProjeto;

-- E
SELECT Dp.*, E.matricula, E.nomeEmpregado 
FROM DEPENDENTE Dp, EMPREGADO E 
WHERE Dp.matricula = E.matricula 
AND Dp.nomeDepedente LIKE '%Diego%'


