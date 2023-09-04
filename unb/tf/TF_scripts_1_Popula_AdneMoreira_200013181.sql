--   ----------------- TF_scripts ----------------
--                    SCRIPT DE MANIPULACAO (DML)
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

USE TF_scripts;

INSERT INTO CLIENTE VALUES
(69101434187, 'Melissa Andrea Daiane Assis', 'DF', 'Brasília', 'Setor Oeste', 986, 'Atras da Belo Pao' , 73064234, 10, '2000-01-08'),
(26893067437, 'João de Sousa', 'PB', 'Amparo', 'Centro', 393, 'Rua Vereador Cícero Soares', 58548971, 12, '1997-01-23'), 
(47088554194, 'Benedita Alana Figueiredo', 'DF', 'Brasília', 'Setor Habitacional Samambaia', 891, 'Chácara Gemétris Chácara 7', 73548971, 12, '1988-01-01'), 
(94898779131, 'Stella Aparecida Gomes', 'RN', 'Natal', 'Felipe Camarão',  535, 'Travessa da Iris', 59074133, 5, '2001-01-16'), 
(77359952450, 'Kaique Benedito João Nogueira', 'GO', 'Aparecida de Goiânia', 'Jardim Miramar Sul', 137, 'Rua 144', 74988430, 6, '1998-01-16'), 
(22359069152, 'Thomas Gustavo Matheus da Rocha', 'DF', 'Brasília', 'Asa Norte', 954, 'Quadra SQN 215 Bloco F', 70874060, 8, '1993-01-14'),
(58006539170, 'Juliana Bianca Santos', 'GO', 'Goiânia', 'Setor Goiânia 2', 387, 'Acesso 2', 74663710, 12, '1993-01-21'),
(80076635171, 'Martin Cauê Pinto', 'DF', 'Brasília', 'Gama', 165, 'Núcleo Rural Casa Grande Módulo 10 MA - 3', 72428281, 6, '1993-02-07'),
(38863945144, 'Iago Edson Davi Carvalho', 'RJ', 'Campos dos Goytacazes', 'Parque Leopoldina', 784, 'Rua Prefeito Edgard Machado', 28051280, 5, '1990-06-15'),
(20437961192, 'Evelyn Teresinha da Costa', 'RJ', 'Niterói', 'Centro', 692, 'Rua Marquês de Paraná 142', 24037900, 6, '2001-10-24');

INSERT INTO FORNECEDOR VALUES
(063433, 8842, 69101434187),
(03693635, 3109, 26893067437), 
(12934629, 1379, 47088554194), 
(08102325, 0863, 94898779131), 
(201193, 0195, 77359952450);

INSERT INTO AREAATUACAO VALUES
(NULL, 'Manicure'), 
(NULL, 'Depilação'), 
(NULL, 'Barbeiro'), 
(NULL, 'Personal Trainer'), 
(NULL, 'Professora de Reforço');

INSERT INTO SERVICO VALUES
(NULL, '2023-01-30', 'Unhas pe e mao', '08:30:00', '09:00:00', 100.00, 'PAGO', 22359069152, 69101434187 ,1), 
(NULL, '2023-02-01', 'Corte de cabelo', '08:30:00', '09:00:00', 100.00, 'PENDENTE', 58006539170 , 26893067437,3), 
(NULL, '2023-03-16', 'Treino de membros superiores', '08:30:00', '09:00:00', 100.00, 'PAGO', 80076635171 , 47088554194,4), 
(NULL, '2023-01-29', 'Aula de matemática', '08:30:00', '09:00:00', 100.00, 'CANCELADO', 38863945144 , 94898779131,5), 
(NULL, '2023-02-02', 'Depilação axilas', '08:30:00', '09:00:00', 100.00, 'CANCELADO', 20437961192 , 77359952450,2);

INSERT INTO CARTAO VALUES
(5246386828621215, 'THOMAS G. M. DA ROCHA', '2023-08-26'), 
(4024007196858772, 'JULIANA B. SANTOS', '2024-06-24'), 
(378582276110732, 'MARTIN C. PINTO', '2023-10-25'), 
(4716128410409516, 'IAGO EDSON D. CARVALHO', '2029-03-17'),
(5147555220006395, 'EVELYN TERESINHA DA COS', '2026-06-21');

INSERT INTO PAGAMENTO VALUES
(NULL, '2023-01-25', '10:00:00', 1, 5246386828621215, 69101434187), 
(NULL, '2022-12-17', '16:52:23', 3, 4024007196858772, 26893067437), 
(NULL, '2023-06-19', '18:40:11', 5, 378582276110732, 47088554194), 
(NULL, '2023-03-01', '06:15:30', 4, 4716128410409516, 94898779131), 
(NULL, '2023-01-26', '08:47:22', 2, 4024007196858772, 26893067437);

INSERT INTO possui VALUES
(22359069152, 5246386828621215),
(58006539170, 4024007196858772),
(80076635171, 378582276110732), 
(38863945144, 4716128410409516), 
(20437961192, 5147555220006395);

INSERT INTO atua VALUES
(69101434187, 1), 
(26893067437, 3), 
(47088554194, 4), 
(94898779131, 5), 
(77359952450, 2);