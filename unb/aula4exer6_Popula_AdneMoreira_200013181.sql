-- ----------------- AULA4EXER6 --------------------------
--                 SCRIPT DE MANIPULACAO (DML)
--
-- Data Criacao ...........: 21/12/2022
-- Autor(es) ..............: Adne Moretti Moreira
-- Banco de Dados .........: MySQL 8.0
-- Base de Dados (nome) ...: aula4exer6
--
-- Ultimas Alteracoes
--  21/12/2022 => Criação do script
--  02/01/2023 => Adição de 3 tuplas por tabela
--              
-- PROJETO => 01 Base de Dados
--         => 10 Tabelas
-- ---------------------------------------------------------

USE aula4exer6;

INSERT INTO PROPRIETARIO VALUES(
    05508754261,
    'Joao Costa da Silva',
    '1982-02-28',
    40, 
    'masculino',
    'Distrito Federal',
    'Braslandia', 
    'Incra 8'
), 
(
    06435267117,
    'Caio Vitor Santos',
    '1975-01-09',
    47, 
    'masculino',
    'Distrito Federal',
    'Santa Maria',
    'Quadra CL 213'
), 
(
    054467642116,
    'Aline Ferreira',
    '2000-06-22',
    22, 
    'feminino',
    'Goiás',
    'Goiânia',
    'Setor Bueno'
), 
(
    46654529200,
    'Cleiton Barbosa',
    '1999-10-31',
    23, 
    'masculino',
    'Distrito Federal',
    'Braslandia', 
    'Incra 8'
), 
(
    49452853069,
    'Julia de Castro',
    '2000-10-17',
    22, 
    'feminino',
    'Distrito Federal',
    'Brasília',
    'Santa Maria'
), 
(
    44293742794,
    'Rafael Leandro',
    '1900-08-12',
    32, 
    'masculino',
    'Goiás',
    'Goiânia',
    'Setor Vaca Brava'
);

INSERT INTO MODELO VALUES(
    564782,
    'GOL 1.8'
), 
(
    989954,
    'UNO CS'
), 
(
    122765,
    'GOL MI'
), 
(
    123456,
    'HB20 TURBO'
), 
(
    788754,
    'ETIOS SEDAN'
), 
(
    125874,
    'NOVO POLO'
);

INSERT CATEGORIA VALUES(
    11,
    'AUTOMÓVEL'
),
(
    12,
    'MOTOCICLETA'
), 
(
    13, 
    'CAMINHÃO'
), 
(
    14, 
    'CAMINHONETE'
), 
(
    15, 
    'CAMINHONETA'
), 
(
    16, 
    'ONIBUS'
);

INSERT INTO VEICULO VALUES(
    'KJU1243',
    '50zJGUr9paAlF8280',
    'azul',
    2011,
    05508754261, 
    564782, 
    11
), 
(
    'PQW5623',
    '2V0YndLUeclWH9854',
    'preto',
    2015,
    054467642116, 
    989954, 
    11
), 
(
    'YBH8754',
    '251C8zPdAABf69795',
    'prata',
    2018,
    06435267117, 
    122765, 
    11
), 
(
    'PQB2715',
    '19JPV7saFRlBW1565',
    'vermelho',
    2011,
    46654529200, 
    125874, 
    11
), 
(
    'MBM1753',
    '2My5Bbj7AtTMr2756',
    'branco',
    2017,
    49452853069, 
    788754, 
    11
), 
(
    'MIB3658',
    '5h7V4wfxxmJ552899',
    'prata',
    2021,
    44293742794, 
    123456, 
    11
);


INSERT INTO telefone VALUES (
	06435267117,
    61993127632
), 
(
	054467642116,
    62995378511
), 
(
	05508754261,
    61992392376
), 
(
	46654529200,
    61995378511
), 
(
	49452853069,
    62995875433
), 
(
	44293742794,
    61983126522
);

INSERT INTO LOCAL VALUES(
	NULL,
    80,
    33,
    50
),
(
	NULL,
    40,
    65,
    70
),
(
	NULL,
    30,
    50,
    50
), 
(
	NULL,
    60,
    20,
    80
),
(
	NULL,
    50,
    70,
    30
),
(
	NULL,
    30,
    10,
    15
);

INSERT INTO TIPOINFRACAO VALUES(
    NULL,
	190, 
    'AUSENCIA DE SETA AO MUDAR FAIXA'
), 
(
    NULL,
    132, 
    'VELOCIDADE ACIMA DA PERMITIDA'
), 
(
    NULL,
    110, 
    'ESTACIONAR NA CALCADA'
), 
(
    NULL,
    9, 
    'DIRIGIR ALCOOLIZADO'
), 
(
    NULL,
    200,
    'CONDUZIR VEICULO SEM HABILITACAO'
), 
(
    NULL,
    233,
    'CONDUZIR VEICULO NA CONTRA MAO'
);

INSERT INTO INFRACAO VALUES(
    NULL,
    '2022-12-21',
    '10:00:00', 
    1,
    60, 
    1, 
    762531124, 
    'KJU1243'
), 
(
    NULL,
    '2022-06-19',
    '18:00:00', 
    2,
    110, 
    3, 
    255368923, 
    'PQW5623'
), 
(
    NULL,
    '2022-10-09',
    '12:00', 
    3,
    100, 
    3,
    201056273, 
    'YBH8754'
), 
(
    NULL,
    '2022-07-11',
    '18:56:25', 
    4,
    110, 
    4, 
    676551243, 
    'PQB2715'
), 
(
    NULL,
    '2022-04-10',
    '13:22:58', 
    5,
    150, 
    6, 
    289981267, 
    'MBM1753'
), 
(
    NULL,
    '2022-02-15',
    '16:00', 
    6,
    70, 
    5,
    654456626, 
    'MIB3658'
);


INSERT INTO AGENTE VALUES(
    255368923,
    'Jorge Henrique',
    '2020-01-02',
    5
), 
(
    201056273,
    'Vinicius Silva',
    '2019-01-02',
    10
), 
(
    762531124,
    'Matheus Fernandes',
    '2016-07-17',
    2
),
(
    676551243,
    'Camille Moreira',
    '2019-10-10',
    3
), 
(
    289981267,
    'Alberto de Souza',
    '2010-05-01',
    22
), 
(
    654456626,
    'Julia Bocayuva',
    '2015-04-22',
    7
);
