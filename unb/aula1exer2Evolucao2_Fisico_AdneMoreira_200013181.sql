-- ---------------------   << Exercício 2 da Aula 1 Evolucao 3 >>   ---------------------
--
--                    		SCRIPT DE CRIAÇÃO (DDL)
-- 
-- Data Criacao ...........: 03/04/2023
-- Autor(es) ..............: Cainã Valença de Freitas, Adne Moretti Moreira
-- Banco de Dados .........: MySQL8.0
-- Base de Dados(nome) ...: aula1exer2Evolucao3
-- 
-- Ultimas alteracoes
--   10/04/2023 => Adicionando tabela AREA
--   14/04/2023 => Removendo tabela SUPERVISIONA
-- 				=> Removendo PK de telefone
-- 				=> Removendo PK de Gerente
-- 				=> Adicionando ON DELETE ON UPDATE
-- 
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
-- 
-- -----------------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula1exer2Evolucao3
    DEFAULT CHARACTER SET utf8
    DEFAULT COLLATE utf8_general_ci;
USE aula1exer2Evolucao3;


CREATE TABLE PESSOA (
    cpf BIGINT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    senha VARCHAR(8) NOT NULL,
    
    CONSTRAINT PESSOA_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB;

CREATE TABLE EMPREGADO (
    matricula INT(8) NOT NULL,
    cpf BIGINT NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(50) NOT NULL,
    rua VARCHAR(50) NOT NULL,
    numero INT(5) NOT NULL,
    
    CONSTRAINT EMPREGADO_PK PRIMARY KEY (matricula),
    CONSTRAINT EMPREGADO_UK UNIQUE KEY (cpf),
    CONSTRAINT EMPREGADO_PESSOA_FK FOREIGN KEY (cpf)
        REFERENCES PESSOA(cpf)
			ON DELETE RESTRICT 
			ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE GERENTE (
    cpfGerente BIGINT NOT NULL,
    email VARCHAR(50) NOT NULL,
    formacao VARCHAR(50) NOT NULL,

	CONSTRAINT GERENTE_PK UNIQUE KEY (cpfGerente),
    CONSTRAINT GERENTE_PESSOA_FK FOREIGN KEY (cpfGerente)
        REFERENCES PESSOA(cpf) 
			ON DELETE RESTRICT 
			ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE AREA(
	idArea INT(5) AUTO_INCREMENT NOT NULL, 
    nomeArea VARCHAR(50) NOT NULL, 
    cpfGerente BIGINT NOT NULL, 
    CONSTRAINT AREA_GERENTE_FK FOREIGN KEY (cpfGerente)
        REFERENCES GERENTE(cpfGerente) 
			ON DELETE RESTRICT 
            ON UPDATE CASCADE, 
	CONSTRAINT AREA_PK PRIMARY KEY (idArea)
) ENGINE=InnoDB;


CREATE TABLE telefone (
    telefone BIGINT NOT NULL,
    matricula INT(8) NOT NULL,

	CONSTRAINT telefone_UK UNIQUE KEY (telefone, matricula),
    CONSTRAINT telefone_EMPREGADO_FK FOREIGN KEY (matricula)
        REFERENCES EMPREGADO(matricula)
			ON DELETE CASCADE 
			ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE VENDA (
    idVenda INT(8) AUTO_INCREMENT NOT NULL,
    matricula INT(8) NOT NULL,
    dataVenda DATE NOT NULL,

	CONSTRAINT VENDA_PK PRIMARY KEY (idVenda),
    CONSTRAINT VENDA_EMPREGADO_FK FOREIGN KEY (matricula)
        REFERENCES EMPREGADO(matricula) 
			ON DELETE RESTRICT 
			ON UPDATE CASCADE
) ENGINE = InnoDB;

CREATE TABLE PRODUTO (
    idProduto INT(8) AUTO_INCREMENT NOT NULL,
    descricao VARCHAR(50) NOT NULL,
    precoUnico DECIMAL(7,2) NOT NULL,

	CONSTRAINT PRODUTO_PK PRIMARY KEY (idProduto)
) ENGINE = InnoDB;

CREATE TABLE compoe (
    idVenda INT(8) NOT NULL,
    idProduto INT(8) NOT NULL,
    quantidade INT(5) NOT NULL, 

	CONSTRAINT compoe_VENDA_FK FOREIGN KEY (idVenda)
        REFERENCES VENDA(idVenda)
		ON DELETE RESTRICT 
        ON UPDATE CASCADE,
    CONSTRAINT compoe_PRODUTO_FK FOREIGN KEY (idProduto)
        REFERENCES PRODUTO(idProduto)
		ON DELETE RESTRICT 
        ON UPDATE CASCADE
) ENGINE = InnoDB;
