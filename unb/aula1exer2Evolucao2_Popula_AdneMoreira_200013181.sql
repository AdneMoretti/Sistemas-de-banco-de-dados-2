-- ---------------------   << Exercício 2 da Aula 1 Evolucao 3 >>   ---------------------
--
--                    		SCRIPT DE POPULAR (DML)
-- 
-- Data Criacao ...........: 03/04/2023
-- Autor(es) ..............: Cainã Valença de Freitas, Adne Moretti Moreira
-- Banco de Dados .........: MySQL8.0
-- Base de Dados(nome) ...: aula1exer2Evolucao3
-- 
-- Ultimas alteracoes
--   10/04/2023 => Adicionando tabela AREA
--   14/04/2023 => Removendo tabela SUPERVISIONA
-- 				=> Removendo cpfGerente na tabela AREA
-- 
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
-- 
-- -----------------------------------------------------------------

USE aula1exer2Evolucao3;

INSERT INTO
	PESSOA(cpf, nome, senha)
VALUES
('12345678901', 'João da Silva', 'senha123'),
('98765432109', 'Maria Souza', 'abc123'),
('11122233344', 'Pedro Alves', 'p@ssword'),
('55566677788', 'Ana Oliveira', 'secret'),
('99988877766', 'Lucas Santos', 'qwerty'),
('33322211100', 'Carla Fernandes', 'letmein'),
('34512647223', 'Davi de Oliveira', 'user123'),
('08598378743', 'Joana Linhares', 'abelhinh'),
('33325311100', 'Gabriel Costa', '225644'),
('06856473839', 'Gabriel Moreira', '2948844'), 
('32623428400', 'Andreia de Moura', '687844'),
('22233344455', 'Paulo Lima', 'paulo123'),
('23423532555', 'Giovanna Almeida', 'giova321'), 
('03726410000', 'Maria Alice', 'maria123'),
('02283922134', 'Joao Henrique', 'joaoz12');

INSERT INTO 
	GERENTE(cpfGerente, email, formacao)
VALUES
('12345678901', 'joao.silva@empresa.com', 'Superior Completo'),
('98765432109', 'maria.souza@empresa.com', 'Médio Completo'),
('11122233344', 'pedro.alves@empresa.com', 'Doutor'), 
('33322211100', 'Gabriel Costa', 'Superior incompleto'), 
('06856473839', 'Gabriel Moreira', 'Médio incompleto'), 
('32623428400', 'Andreia de Moura', 'Superior'), 
('22233344455', 'paulo.lima@empresa.com', 'Superior Completo'),
('23423532555', 'giovanna.almeida@empresa.com', 'Doutor'), 
('02283922134', 'ciclano.santos@empresa.com', 'Doutorado em Física'),
('03726410000', 'maria.silva@empresa.com', 'Superior Incompleto');

INSERT INTO 
	EMPREGADO(matricula, cpf, estado, cidade, bairro, rua, numero)
VALUES
('11111', '55566677788', 'PE', 'Recife', 'Boa Viagem', 'Avenida Boa Viagem', 100),
('22222', '99988877766', 'RS', 'Porto Alegre', 'Moinhos de Vento', 'Rua Padre Chagas', 300),
('33333', '33322211100', 'BA', 'Salvador', 'Barra', 'Avenida Oceânica', 50), 
('44444', '34512647223', 'RJ', 'Rio de Janeiro', 'Barra', 'Tijuca', 30),
('55555', '08598378743', 'BA', 'Salvador', 'Barra', 'Avenida Oceânica', 10),
('66666', '06856473839', 'SP', 'Sao Paulo', 'Paulo', 'Piracanjuba', 7), 
('77777', '22233344455', 'MG', 'Belo Horizonte', 'São Lucas', 'Rua do Carmo', 50),
('88888', '11122233344', 'GO', 'Goiania', 'Setor Central', 'Rua 5', 12),
('99999', '12345678901', 'MG', 'Belo Horizonte', 'Santo Agostinho', 'Rua dos Guajajaras', 123),
('10101', '98765432109', 'PR', 'Curitiba', 'Centro', 'Avenida Marechal Deodoro', 789);

INSERT INTO 
	AREA(idArea, nomeArea, cpfGerente)
VALUES 
(NULL, 'Sapatos', '12345678901'),
(NULL, 'Camisas', '98765432109'), 
(NULL, 'Bomboniere', '11122233344'), 
(NULL, 'Eletrodomesticos', '33322211100'), 
(NULL, 'Eletronicos', '33322211100'),
(NULL, 'Flores', '06856473839'), 
(NULL, 'Livros', '06856473839'),
(NULL, 'Decoração', '22233344455'),
(NULL, 'Móveis', '22233344455'),
(NULL, 'Informática', '22233344455');


INSERT INTO
	telefone (telefone, matricula)
VALUES
('1199998888', '11111'),
('1188887777', '22222'),
('2133334444', '33333'),
('6199254361', '44444'),
('6185541131', '55555'),
('6299312763', '66666'), 
('1198765432', '77777'),
('1197654321', '88888'),
('1196543210', '99999'),
('1195432109', '10101');

INSERT INTO 
	VENDA (matricula, dataVenda)
VALUES
('11111', '1990-05-15'),
('22222', '1987-10-05'),
('33333', '2003-09-12'), 
('44444', '2022-06-19'), 
('55555', '2023-01-03'), 
('66666', '2021-05-05'), 
('55555', '2023-04-10'),
('99999', '2023-04-11'),
('11111', '2023-04-12'),
('33333', '2023-04-13');

INSERT INTO
	PRODUTO (descricao, precoUnico)
VALUES
('Caneta Azul', 1.99),
('Caderno Universitário', 15.99),
('Lápis de Cor', 4.50),
('Borracha Branca', 0.99),
('Mochila Escolar', 89.99),
('Livro de Matemática', 25.50),
('Régua 30cm', 2.99), 
('Borracha Colorida', 1.50),
('Folhas de Papel A4', 10.99),
('Tesoura Escolar', 3.99),
('Estojo para Lápis', 5.50);

INSERT INTO 
	compoe (idVenda, idProduto, quantidade)
VALUES
(1, '1', 2),
(2, '2', 5),
(3, '3', 6), 
(4, '4', 8), 
(5, '6', 7), 
(6, '6', 12), 
(7, 7, '2'),
(8, 8, '1'),
(9, 9, '20'),
(10, 10, '3');
