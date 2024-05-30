--Projeto--
INSERT INTO Projeto (Nome, Titulo, Descricao, Data_Inicio, Data_Fim)
VALUES 
('Projeto A', 'Investiga��o em IA', 'Descri��o do Projeto A', '2023-01-01', '2023-12-31'),
('Projeto B', 'Desenvolvimento Web', 'Descri��o do Projeto B', '2023-02-01', '2023-11-30'),
('Projeto C', 'Projeto C T�tulo', 'Descri��o do Projeto C', '2023-03-01', '2023-10-31'),
-- Adicione mais projetos aqui.
('Projeto D', 'Investiga��o em IoT', 'Descri��o do Projeto D', '2023-04-01', '2023-09-30'),
('Projeto E', 'An�lise de Dados', 'Descri��o do Projeto E', '2023-05-01', '2023-08-31');

--Programa--
INSERT INTO Programa (Nome_Programa, ID_Projeto)
VALUES 
('Programa X', 1),
('Programa Y', 2),
('Programa Z', 3),
-- Adicione mais programas aqui.
('Programa W', 4),
('Programa V', 5);

--Pais--
INSERT INTO Pais (Nome_do_Pais, Codigo_Pais)
VALUES 
('Portugal', 351),
('Espanha', 34),
('Fran�a', 33),
-- Adicione mais pa�ses aqui.
('Alemanha', 49),
('It�lia', 39);

--Publicacao--
INSERT INTO Publicacao (Tipo, Valor)
VALUES 
('DOI', '10.1000/xyz123'),
('URL', 'https://example.com/publicacao1'),
('DOI', '10.1000/abc456'),
-- Adicione mais publica��es aqui.
('URL', 'https://example.com/publicacao2'),
('DOI', '10.1000/def789');

--Membros_DIUBI--
INSERT INTO Membros_DIUBI (Num_Funcionario, ORCID, Funcao)
VALUES 
(1001, '0000-0001-2345-6789', 'Investigador Principal'),
(1002, '0000-0002-3456-7890', 'Co-Investigador'),
(1003, '0000-0003-4567-8901', 'Assistente de Investiga��o'),
-- Adicione mais membros aqui.
(1004, '0000-0004-5678-9012', 'Investigador J�nior'),
(1005, '0000-0005-6789-0123', 'Investigador Associado');

--Tipo_Estado--
INSERT INTO Tipo_Estado (Estado)
VALUES 
('Aprovado'),
('Cancelado'),
('Conclu�do'),
('Em Curso'),
('Encerrado'),
('Renovado'),
('Em Submiss�o');

--Keywords--
INSERT INTO Keywords (Keyword)
VALUES 
('Intelig�ncia Artificial'),
('Desenvolvimento Web'),
('An�lise de Dados'),
('Internet das Coisas'),
('Big Data');

--Tipo_Dominio--
INSERT INTO Tipo_Dominio (Dominio_Cientifico)
VALUES 
('Ci�ncias da Computa��o'),
('Engenharia de Software'),
('Ci�ncia de Dados'),
('Engenharia de Redes'),
('Rob�tica');

--Area_Cientifica--
INSERT INTO Area_Cientifica (Area_Cientifica)
VALUES 
('Machine Learning'),
('Redes Neurais'),
('Data Mining'),
('Seguran�a Cibern�tica'),
('Automa��o');

--Departamento--
INSERT INTO Departamento (Nome_Departamento)
VALUES 
('Inform�tica'),
('Engenharia Eletrot�cnica'),
('F�sica'),
('Qu�mica'),
('Matem�tica');

--Entidade--
INSERT INTO Entidade (Nome, Email, Telefone, Designacao, Morada, URL_Online, ID_Projeto, ID_Pais)
VALUES 
('Funda��o ABC', 'contacto@fundacaoabc.com', '123456789', 'Funda��o ABC', 'Rua 123, Cidade X', 'http://fundacaoabc.com', 1, 1),
('Instituto XYZ', 'contato@institutoxyz.com', '987654321', 'Instituto XYZ', 'Av. 456, Cidade Y', 'http://institutoxyz.com', 2, 2),
-- Adicione mais entidades aqui.
('Universidade DEF', 'info@universidadedef.com', '112233445', 'Universidade DEF', 'Pra�a 789, Cidade Z', 'http://universidadedef.com', 3, 3);

