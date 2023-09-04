--   ----------------- AULA4EXER5EVOLUCAO5 ----------------
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 21/12/2022
-- Autor(es) ..............: Adne Moretti Moreira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6
--
-- Ultimas Alteracoes
--   21/12/2022 => Criação do script
-- 	02/01/2022 => Adição do tipo de infracao
--              
-- PROJETO => 01 Base de Dados
--         => 09 Tabelas
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS aula4exer6;
-- DROP DATABASE aula4exer6;
USE aula4exer6;

CREATE TABLE PROPRIETARIO (
    cpf BIGINT(11) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    dataNascimento DATE NOT NULL,
    idade INT(2) NOT NULL, 
    sexo VARCHAR(9) NOT NULL,
    estado VARCHAR(25) NOT NULL,
    cidade VARCHAR(50) NOT NULL,
    bairro VARCHAR(25) NOT NULL,
    
    CONSTRAINT PACIENTE_PK PRIMARY KEY (cpf)
);

CREATE TABLE MODELO (
    codigoModelo INT(6) NOT NULL,
    nomeModelo VARCHAR(50) NOT NULL,
    
    CONSTRAINT MODELO_PK PRIMARY KEY (codigoModelo)
);

CREATE TABLE CATEGORIA (
    codigoCategoria INT(2) NOT NULL ,
    nomeCategoria VARCHAR(50) NOT NULL,
    
    CONSTRAINT CATEGORIA_PK PRIMARY KEY (codigoCategoria)
);

CREATE TABLE VEICULO (
    placa VARCHAR(7) NOT NULL,
    chassi VARCHAR(17) NOT NULL UNIQUE,
    corPredominante VARCHAR(50) NOT NULL,
    anoFabricacao INT NOT NULL,
    cpf BIGINT NOT NULL, 
    codigoModelo INT(6) NOT NULL, 
    codigoCategoria INT(2) NOT NULL, 
    
    CONSTRAINT VEICULO_PK PRIMARY KEY (placa),
	CONSTRAINT VEICULO_PROPRIETARIO_FK FOREIGN KEY (cpf) 
    REFERENCES PROPRIETARIO (cpf),
    CONSTRAINT VEICULO_MODELO_FK FOREIGN KEY (codigoModelo) 
    REFERENCES MODELO (codigoModelo),
    CONSTRAINT VEICULO_CATEGORIA_FK FOREIGN KEY (codigoCategoria) 
    REFERENCES CATEGORIA (codigoCategoria)
);



CREATE TABLE telefone (
	cpf BIGINT NOT NULL, 
    teleFone BIGINT NOT NULL, 
    
	CONSTRAINT telefone_PROPRIETARIO_FK FOREIGN KEY (cpf) 
    REFERENCES PROPRIETARIO (cpf)
);

CREATE TABLE TIPOINFRACAO(
	idTipoInfracao INT(6) NOT NULL AUTO_INCREMENT, 
    valorInfracao DECIMAL(5,2) NOT NULL,
    descricaoInfracao VARCHAR(50) NOT NULL,
    CONSTRAINT TIPOINFRACAO_PK PRIMARY KEY (idTipoInfracao)
);

CREATE TABLE INFRACAO (
    codigoInfracao INT NOT NULL AUTO_INCREMENT,
    data DATE NOT NULL,
    hora TIME NOT NULL, 
    idTipoInfracao INT(6) NOT NULL, 
    velocidadeAferida INT , 
    codigoLocal INT(8) NOT NULL, 
    matriculaFuncional INT(10) NOT NULL, 
    placa VARCHAR(7) NOT NULL, 
    
    CONSTRAINT INFRACAO_PK PRIMARY KEY (codigoInfracao),
    CONSTRAINT VEICULO_INFRACAO_FK FOREIGN KEY (placa) 
    REFERENCES VEICULO (placa),
    CONSTRAINT INFRACAO_TIPOINFRACAO_FK FOREIGN KEY (idTipoInfracao) 
    REFERENCES TIPOINFRACAO (idTipoInfracao)
);

CREATE TABLE LOCAL (
    codigoLocal INT(8) NOT NULL AUTO_INCREMENT,
    velocidadePermitida INT(3) NOT NULL,
    latitude INT(3) NOT NULL, 
    longitude INT(3) NOT NULL,
    
    CONSTRAINT LOCAL_PK PRIMARY KEY (codigoLocal)
);

CREATE TABLE AGENTE (
    matriculaFuncional INT(10) NOT NULL,
    nome VARCHAR(50) NOT NULL,
    dataContratacao DATE NOT NULL,
    tempoServico INT(4), 
    
    CONSTRAINT AGENTE_PK PRIMARY KEY (matriculaFuncional) 
);

