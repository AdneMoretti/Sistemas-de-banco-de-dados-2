--   ----------------- TF_scripts ----------------
--                    SCRIPT DE CRIACAO (DDL)
--
-- Data Criacao ...........: 25/01/2023
-- Autor(es) ..............: Adne Moretti Moreira, Ana Beatriz Massuh
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: TF_scripts
--
--              
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
-- ---------------------------------------------------------

CREATE DATABASE IF NOT EXISTS TF_scripts;

USE TF_scripts;

CREATE TABLE CLIENTE (
    cpf BIGINT(11) NOT NULL,
    nomeCompleto VARCHAR(100) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cidade VARCHAR(100),
    bairro VARCHAR(50),
    numero INT(3),
    complemento VARCHAR(50),
    cep INT(8), 
    dataPagamentoCliente INT NOT NULL,
    dataNascimento DATE NOT NULL,
    
     CONSTRAINT CLIENTE_PK PRIMARY KEY (cpf)
) ENGINE = InnoDB;


CREATE TABLE FORNECEDOR (
    numeroConta INT(10) NOT NULL,
    codigoAgencia INT(7) NOT NULL,
    cpf BIGINT(11) NOT NULL,
    
    CONSTRAINT FORNECEDOR_PK PRIMARY KEY (cpf),
    CONSTRAINT FORNECEDOR_CLIENTE_FK FOREIGN KEY (cpf)
        REFERENCES CLIENTE (cpf) ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE AREAATUACAO (
    idAreaAtuacao INT(5) AUTO_INCREMENT,
    nomeAreaAtuaco VARCHAR(50),
    
	CONSTRAINT AREAATUACAO_PK PRIMARY KEY (idAreaAtuacao)
) ENGINE = InnoDB;

CREATE TABLE AGENDAMENTO (
    idAgendamento INT(5) NOT NULL AUTO_INCREMENT,
    dataAgendamento DATE NOT NULL,
    descricaoAgendamento VARCHAR(100) NOT NULL,
    horarioInicio TIME NOT NULL,
    horarioFim TIME NOT NULL,
    valorAgendamento DECIMAL(6, 3) NOT NULL,
    situacaoAgendamento ENUM('PENDENTE', 'PAGO', 'APROVADO', 'CANCELADO'),
    cpfCliente BIGINT(11),
    cpfFornecedor BIGINT(11),
    idAreaAtuacao INT(5), 
    
    CONSTRAINT AGENDAMENTO_PK PRIMARY KEY (idAgendamento),
	CONSTRAINT AGENDAMENTO_CLIENTE_FK FOREIGN KEY (cpfCliente)
	REFERENCES CLIENTE(cpf) ON DELETE CASCADE,
	CONSTRAINT AGENDAMENTO_FORNECEDOR_FK FOREIGN KEY (cpfFornecedor)
	REFERENCES FORNECEDOR(cpf) ON DELETE CASCADE,
    CONSTRAINT AGENDAMENTO_AREAATUACAO_FK FOREIGN KEY (idAreaAtuacao)
	REFERENCES AREAATUACAO(idAreaAtuacao) ON DELETE RESTRICT
) ENGINE = InnoDB;

CREATE TABLE PAGAMENTO (
    idPagamento INT(5) NOT NULL AUTO_INCREMENT,
    dataPagamento DATE NOT NULL,
    horaPagamento TIME NOT NULL,
    idAgendamento INT(5) NOT NULL,
    
	CONSTRAINT PAGAMENTO_PK PRIMARY KEY (idPagamento),
	CONSTRAINT PAGAMENTO_AGENDAMENTO_FK FOREIGN KEY (idAgendamento)
	REFERENCES AGENDAMENTO(idAgendamento)  
) ENGINE = InnoDB;

CREATE TABLE CARTAO (
    numeroCartao BIGINT(16) NOT NULL,
    nomeTitular VARCHAR(100) NOT NULL,
    dataExpiracao DATE NOT NULL,
    idPagamento INT(5) NOT NULL, 
 
	CONSTRAINT CARTAO_PK PRIMARY KEY (numeroCartao),
	CONSTRAINT CARTAO_PAGAMENTO_FK FOREIGN KEY (idPagamento)
	REFERENCES PAGAMENTO(idPagamento) 
) ENGINE = InnoDB;

CREATE TABLE possui (
	cpfCliente BIGINT(11) NOT NULL, 
    numeroCartao BIGINT(16) NOT NULL, 
    
	CONSTRAINT possui_CLIENTE_FK FOREIGN KEY (cpfCliente)
	REFERENCES CLIENTE(cpf) ON DELETE CASCADE,
	CONSTRAINT possui_CARTAO_FK FOREIGN KEY (numeroCartao)
	REFERENCES CARTAO(numeroCartao) ON DELETE CASCADE
) ENGINE = InnoDB;

CREATE TABLE atua (
	cpfFornecedor BIGINT(11) NOT NULL, 
	idAreaAtuacao INT(5) NOT NULL, 
    
	CONSTRAINT atua_FORNECEDOR_FK FOREIGN KEY(cpfFornecedor)
    REFERENCES FORNECEDOR(cpf) ON DELETE CASCADE,
	CONSTRAINT atua_AREAATUACAO_FK FOREIGN KEY (idAreaAtuacao)
    REFERENCES AREAATUACAO(idAreaAtuacao) ON DELETE CASCADE
) ENGINE = InnoDB;
 