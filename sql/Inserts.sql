--Projeto--
INSERT INTO Projeto (Nome, Titulo, Descricao, Data_Inicio, Data_Fim)
VALUES 
('Projeto A', 'Investigação em IA', 'Descrição do Projeto A', '2023-01-01', '2023-12-31'),
('Projeto B', 'Desenvolvimento Web', 'Descrição do Projeto B', '2023-02-01', '2023-11-30'),
('Projeto C', 'Projeto C Título', 'Descrição do Projeto C', '2023-03-01', '2023-10-31'),
-- Adicione mais projetos aqui.
('Projeto D', 'Investigação em IoT', 'Descrição do Projeto D', '2023-04-01', '2023-09-30'),
('Projeto E', 'Análise de Dados', 'Descrição do Projeto E', '2023-05-01', '2023-08-31');

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
('França', 33),
-- Adicione mais países aqui.
('Alemanha', 49),
('Itália', 39);

--Publicacao--
INSERT INTO Publicacao (Tipo, Valor)
VALUES 
('DOI', '10.1000/xyz123'),
('URL', 'https://example.com/publicacao1'),
('DOI', '10.1000/abc456'),
-- Adicione mais publicações aqui.
('URL', 'https://example.com/publicacao2'),
('DOI', '10.1000/def789');

--Membros_DIUBI--
INSERT INTO Membros_DIUBI (Num_Funcionario, ORCID, Funcao)
VALUES 
(1001, '0000-0001-2345-6789', 'Investigador Principal'),
(1002, '0000-0002-3456-7890', 'Co-Investigador'),
(1003, '0000-0003-4567-8901', 'Assistente de Investigação'),
-- Adicione mais membros aqui.
(1004, '0000-0004-5678-9012', 'Investigador Júnior'),
(1005, '0000-0005-6789-0123', 'Investigador Associado');

--Tipo_Estado--
INSERT INTO Tipo_Estado (Estado)
VALUES 
('Aprovado'),
('Cancelado'),
('Concluído'),
('Em Curso'),
('Encerrado'),
('Renovado'),
('Em Submissão');

--Keywords--
INSERT INTO Keywords (Keyword)
VALUES 
('Inteligência Artificial'),
('Desenvolvimento Web'),
('Análise de Dados'),
('Internet das Coisas'),
('Big Data');

--Tipo_Dominio--
INSERT INTO Tipo_Dominio (Dominio_Cientifico)
VALUES 
('Ciências da Computação'),
('Engenharia de Software'),
('Ciência de Dados'),
('Engenharia de Redes'),
('Robótica');

--Area_Cientifica--
INSERT INTO Area_Cientifica (Area_Cientifica)
VALUES 
('Machine Learning'),
('Redes Neurais'),
('Data Mining'),
('Segurança Cibernética'),
('Automação');

--Departamento--
INSERT INTO Departamento (Nome_Departamento)
VALUES 
('Informática'),
('Engenharia Eletrotécnica'),
('Física'),
('Química'),
('Matemática');

--Entidade--
INSERT INTO Entidade (Nome, Email, Telefone, Designacao, Morada, URL_Online, ID_Pais)
VALUES 
('Fundação ABC', 'contacto@fundacaoabc.com', '123456789', 'Fundação ABC', 'Rua 123, Cidade X', 'http://fundacaoabc.com', 1),
('Instituto XYZ', 'contato@institutoxyz.com', '987654321', 'Instituto XYZ', 'Av. 456, Cidade Y', 'http://institutoxyz.com', 2),
-- Adicione mais entidades aqui.
('Universidade DEF', 'info@universidadedef.com', '112233445', 'Universidade DEF', 'Praça 789, Cidade Z', 'http://universidadedef.com',3);