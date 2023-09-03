-- ---------------------   < Exercício 2 da Aula 1 Evolucao 7 >   ---------------------
--
--                    			SCRIPT CONSULTAS (DML)
-- 
-- Data Criacao ...........: 19/04/2023
-- Autor(es) ..............: Thiago Siqueira Gomes, Adne Moreira
-- Banco de Dados .........: MySQL8.0
-- Base de Dados(nome) ....: aula1exer2Evolucao7
--
-- PROJETO => 01 Base de Dados
--         => 08 Tabelas
--         => 02 Sequencias
-- 
-- Ultimas alteracoes
--   28/04/2023 => Coloca em letra minuscula o nome das tabelas de
--                 telefone e compoe
--              => Adiciona numero de consultas na sintese do projeto
--   29/04/2023 => Ajustando padrao de apresentacao de consultas exigido
--                 pela disciplina que resulta na qualidade do projeto
--                 de Engenharia de Software
--              => Trocar tabela compoe por possui que nem existe no projeto
--   17/05/2023 => Adicionando mais 3 consultas no script
--   22/05/2023 => Adicionando consultas do forum 
--              => Corrigindo consultas F, G, H
-- 
-- -----------------------------------------------------------------


-- CONSULTAS
-- A) Consultar todas as vendas feitas por um empregado específico que
--    será definido pelo usuário através da chave primária do empregado
--     nessa pesquisa (usuário definirá um empregado específico na consulta);  

SELECT v.idVenda, v.dataVenda, p.descricao, p.precoUnitario
  FROM GMDS_VENDA v
  JOIN GMDS_POSSUI pos ON v.idVenda = pos.idVenda
  JOIN GMDS_PRODUTO p ON pos.codigoProduto = p.codigo
WHERE v.matricula = 1; 

-- B) Relacionar todos os dados de uma venda específica com todas as informações
--    dos produtos comercializados por esta venda e mostrar o preço total por 
--    item da venda (usuário definirá uma venda específica na consulta);
SELECT v.idVenda, v.dataVenda, p.codigo, p.descricao, p.precoUnitario, pos.quantidade, p.precoUnitario * pos.quantidade AS precoTotal
  FROM GMDS_VENDA v
  JOIN GMDS_POSSUI pos ON v.idVenda = pos.idVenda
  JOIN GMDS_PRODUTO p ON pos.codigoProduto = p.codigo
WHERE v.idVenda = 1;


-- C) Mostrar todos os empregados da empresa que NÃO sejam gerentes em ordem
--    alfabética crescente do nome do empregado;
SELECT p.nome, e.*FROM GMDS_EMPREGADO e
  JOIN GMDS_PESSOA p ON e.cpfPessoa = p.cpfWHERE e.cpfPessoa 
  NOT IN (SELECT cpfPessoa FROM GMDS_GERENTE)
  ORDER BY p.nome ASC;


-- D) Consultar e mostrar a quantidade de CADA produto que foi vendido por 
--    esta empresa (lembrar que só o código do produto não identifica qual
--    produto é para vários funcionários ou usuários finais da empresa, então
--    reflita de quais atributos deverão ser apresentados e em qual sequência para
--    atender o interesse do usuário final em suas atividades diárias com melhor
--    qualidade e eficiência);
SELECT p.descricao, SUM(pos.quantidade) AS quantidadeVendida
  FROM GMDS_POSSUI pos
  JOIN GMDS_PRODUTO p ON pos.codigoProduto = p.codigo
  GROUP BY p.descricao
ORDER BY quantidadeVendida;


-- E) Solicitar ao usuário qualquer parte do nome de um produto e apresentar seu código,
--    nome e quantidade de vendas em ordem alfabética do nome do produto de forma decrescente.
SELECT p.codigo, p.descricao, COUNT(pos.idVenda) AS quantidadeVendas
  FROM GMDS_PRODUTO p
  LEFT JOIN GMDS_POSSUI pos ON p.codigo = pos.codigoProduto
  WHERE p.descricao LIKE '%C%'
  GROUP BY p.codigo, p.descricao
  ORDER BY p.descricao DESC;
 
-- F) Consultar a quantidade de vendas por Produto, mostrando o que seria o ranking dos produtos mais vendidos para os menos vendidos 
-- (ajuste a ordenação solicitada apresentando o que identifica o projeto, o nome dele e a quantidade de produtos vendidos);

SELECT p.codigo, p.descricao, count(ps.quantidade)
  FROM GMDS_PRODUTO p
    INNER JOIN GMDS_possui ps ON p.codigo = ps.codigoProduto
    GROUP BY p.codigo, p.descricao
    ORDER BY count(ps.quantidade) DESC;

-- G) Apresentar a quantidade de vendas por dia mostrando em ordem de data decrescente
SELECT TRUNC(v.dataVenda) AS diaVenda, COUNT(*) AS quantidadeVendas
FROM GMDS_VENDA v
GROUP BY TRUNC(v.dataVenda)
ORDER BY TRUNC(v.dataVenda) DESC;

-- H) Mostrar a quantidade de cada produto vendido por dia e apresentar em ordem crescente da quantidade de produtos vendidos no dia
SELECT TRUNC(v.dataVenda) AS diaVenda, p.descricao, SUM(pos.quantidade) AS quantidadeVendida
FROM GMDS_VENDA v
JOIN GMDS_POSSUI pos ON v.idVenda = pos.idVenda
JOIN GMDS_PRODUTO p ON pos.codigoProduto = p.codigo
GROUP BY TRUNC(v.dataVenda), p.descricao
ORDER BY quantidadeVendida ASC;