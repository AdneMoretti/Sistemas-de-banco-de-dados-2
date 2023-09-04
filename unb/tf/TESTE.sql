CREATE DATABASE IF NOT EXISTS teste;
USE teste;
CREATE TABLE usuario(
	id INT NOT NULL, 
    nome VARCHAR(20) NOT NULL,
    CONSTRAINT usuario_PK PRIMARY KEY(id)
);

CREATE TABLE cliente(
	idCliente INT NOT NULL, 
    idade INT NOT NULL,
     CONSTRAINT usuario_PK PRIMARY KEY(idCliente)
);

INSERT INTO usuario VALUES(1, 'adne'), (2, 'gabriel'), (3, 'matheus');
INSERT INTO cliente VALUES(1, 3), (2, 4), (3, 5);