-- ---------------------   < Exercício 2 da Aula 1 Evolucao 6 >   ---------------------
--
--                    			SCRIPT CONSULTAS (DML)
-- 
-- Data Criacao ...........: 19/04/2023
-- Autor(es) ..............: Thiago Siqueira Gomes, Adne Moreira
-- Banco de Dados .........: MySQL8.0
-- Base de Dados(nome) ....: aula1exer2Evolucao6
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 05 Consultas
-- 
-- Ultimas alteracoes
--   28/04/2023 => Coloca em letra minuscula o nome das tabelas de
--                 telefone e compoe
--              => Adiciona numero de consultas na sintese do projeto
--   29/04/2023 => Ajustando padrao de apresentacao de consultas exigido
--                 pela disciplina que resulta na qualidade do projeto
--                 de Engenharia de Software
--              => Trocar tabela compoe por possui que nem existe no projeto
-- 
-- -----------------------------------------------------------------


-- CONSULTAS
-- A) Consultar todas as vendas feitas por um empregado específico que
--    será definido pelo usuário através da chave primária do empregado
--     nessa pesquisa (usuário definirá um empregado específico na consulta);  
SELECT * 
  FROM AMM_VENDA 
 WHERE matricula = 11111
 ORDER BY AMM_VENDA.idVenda ASC;


-- B) Relacionar todos os dados de uma venda específica com todas as informações
--    dos produtos comercializados por esta venda e mostrar o preço total por 
--    item da venda (usuário definirá uma venda específica na consulta);
SELECT v.*, p.*, ps.quantidade, p.idArea, ps.quantidade * p.precoUnitario as precoTotal
  FROM AMM_VENDA v
       JOIN AMM_possui ps ON ps.idVenda = v.idVenda
       JOIN AMM_PRODUTO p ON p.codigo = ps.codigo
 WHERE v.idVenda = 10;


-- C) Mostrar todos os empregados da empresa que NÃO sejam gerentes em ordem
--    alfabética crescente do nome do empregado;
SELECT e.* 
  FROM AMM_PESSOA p 
	   INNER JOIN AMM_EMPREGADO e ON p.cpf = e.cpfPessoa
       LEFT JOIN AMM_GERENTE g ON p.cpf = g.cpfPessoa
 WHERE g.cpfPessoa IS NULL
 ORDER BY p.nome ASC;


-- D) Consultar e mostrar a quantidade de CADA produto que foi vendido por 
--    esta empresa (lembrar que só o código do produto não identifica qual
--    produto é para vários funcionários ou usuários finais da empresa, então
--    reflita de quais atributos deverão ser apresentados e em qual sequência para
--    atender o interesse do usuário final em suas atividades diárias com melhor
--    qualidade e eficiência);
SELECT p.descricao, SUM(ps.quantidade) AS quantidadeVendida, a.descricao
  FROM AMM_PRODUTO p
       JOIN AMM_possui ps ON p.codigo = ps.codigo
       JOIN AMM_AREA a on p.idArea = a.idArea
 GROUP BY p.descricao, a.descricao
 ORDER BY quantidadeVendida DESC;


-- E) Solicitar ao usuário qualquer parte do nome de um produto e apresentar seu código,
--    nome e quantidade de vendas em ordem alfabética do nome do produto de forma decrescente.
SELECT p.codigo, p.descricao, count(ps.quantidade)
  FROM AMM_PRODUTO p
       INNER JOIN AMM_possui ps ON p.codigo = ps.codigo
 WHERE p.descricao LIKE '%a%' GROUP BY p.codigo, p.descricao
 ORDER BY p.descricao DESC;
 
-- F) Consultar a quantidade de vendas por Produto, mostrando o que seria o ranking dos produtos mais vendidos para os menos vendidos 
-- (ajuste a ordenação solicitada apresentando o que identifica o projeto, o nome dele e a quantidade de produtos vendidos);

SELECT p.codigo, p.descricao, count(ps.quantidade)
  FROM AMM_PRODUTO p
    INNER JOIN AMM_possui ps ON p.codigo = ps.codigo
    GROUP BY p.codigo, p.descricao
    ORDER BY count(ps.quantidade) DESC;

-- G) Apresentar a quantidade de vendas por dia mostrando em ordem de data decrescente.
-- Apresentar a quantidade de vendas por dia mostrando em ordem de data decrescente.

SELECT TRUNC(dataVenda) AS data, COUNT(*)
    FROM AMM_VENDA
    GROUP BY TRUNC(dataVenda)
    ORDER BY TRUNC(dataVenda) DESC;

-- H) Mostrar a quantidade de cada Produto vendido por dia e apresentando em ordem crescente da quantidade de produtos vendidos no dia.

SELECT TRUNC(dataVenda) AS data, COUNT(*)
    FROM AMM_VENDA
    GROUP BY TRUNC(dataVenda)
    ORDER BY TRUNC(dataVenda) ASC;