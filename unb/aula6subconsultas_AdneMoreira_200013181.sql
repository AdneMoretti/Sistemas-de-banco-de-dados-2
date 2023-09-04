-- ---------------------   << subconsultaImpar >>   ---------------------
--
--                        SCRIPT DE CRIACAO, CONSULTA (DDL, DML)                                   
-- 
-- Data Criacao ...........: 16/02/2023
-- Autor(es) ..............: Adne Moreira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: subconsultaImpar
--
--
-- PROJETO => 01 Base de Dados
--         => 02 Tabelas
--
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS subconsultaImpar; 
USE subconsultaImpar;
CREATE TABLE CONTA(
	idConta INT(6) NOT NULL, 
    numConta INT(10) NOT NULL, 
    numAgencia INT(10) NOT NULL,
    CONSTRAINT CONTA_PK PRIMARY KEY(idConta) 
);
CREATE TABLE CLIENTE(
	cpfCliente BIGINT(11) NOT NULL, 
    nomeCliente VARCHAR(100) NOT NULL, 
    dataNascimento DATE NOT NULL, 
    idConta INT(5), 
    
    CONSTRAINT CLIENTE_PK PRIMARY KEY(cpfCliente), 
    CONSTRAINT CLIENTE_CONTA FOREIGN KEY (idConta) REFERENCES CONTA(idConta)
);
INSERT INTO CLIENTE VALUES
(064782425, 'Joana Linhares', '2016-08-23', 2), 
(777635125, 'Pedro Augusto', '2007-03-30', 3), 
(673465832, 'Augusto Linhares', '2016-09-11', 3);

INSERT INTO CONTA VALUES
(1, 263743, 32543), 
(2, 237533, 00001),
(3, 743853, 00002); 

-- -- Questao 1 -  Instrução SQL que realiza uma operação de INSERÇÃO através de uma CONSULTA (SELECT) integrada na instrução INSERT
INSERT INTO CLIENTE values(73127, 'Andressa Neves', '2010-02-11', (SELECT idConta FROM CONTA WHERE numconta=263743));

-- -- Questao 3 -  Instrução SQL que realiza uma operação de EXCLUSÃO envolvendo uma CONSULTA (SELECT) integrada na instrução DELETE;
DELETE FROM CLIENTE WHERE idConta IN(SELECT idConta FROM CONTA WHERE numConta=743853);