-- Dados para a tabela Projeto
INSERT INTO Projeto (Nome, Titulo, Descricao, Data_Inicio, Data_Fim)
VALUES 
    ('Projeto 1', 'Título do Projeto 1', 'Descrição do Projeto 1', '2023-01-10', '2024-06-30'),
    ('Projeto 2', 'Título do Projeto 2', 'Descrição do Projeto 2', '2023-02-15', '2025-03-20'),
    ('Projeto 3', 'Título do Projeto 3', 'Descrição do Projeto 3', '2022-09-05', '2023-12-15'),
    ('Projeto 4', 'Título do Projeto 4', 'Descrição do Projeto 4', '2023-04-20', '2024-09-10'),
    ('Projeto 5', 'Título do Projeto 5', 'Descrição do Projeto 5', '2022-11-08', '2023-08-25'),
    ('Projeto 6', 'Título do Projeto 6', 'Descrição do Projeto 6', '2023-06-12', '2024-07-01'),
    ('Projeto 7', 'Título do Projeto 7', 'Descrição do Projeto 7', '2023-03-03', '2025-01-05'),
    ('Projeto 8', 'Título do Projeto 8', 'Descrição do Projeto 8', '2022-12-22', '2024-04-30'),
    ('Projeto 9', 'Título do Projeto 9', 'Descrição do Projeto 9', '2023-08-18', '2025-02-20'),
    ('Projeto 10', 'Título do Projeto 10', 'Descrição do Projeto 10', '2022-10-30', '2023-11-28');

-- Dados para a tabela Programa
INSERT INTO Programa (Nome_Programa, ID_Projeto)
VALUES 
    ('Programa A', 1),
    ('Programa B', 2),
    ('Programa C', 3),
    ('Programa D', 4),
    ('Programa E', 5),
    ('Programa F', 6),
    ('Programa G', 7),
    ('Programa H', 8),
    ('Programa I', 9),
    ('Programa J', 10);

-- Dados para a tabela Pais
INSERT INTO Pais (Nome_do_Pais, Codigo_Pais)
VALUES 
    ('Portugal', 351),
    ('Espanha', 34),
    ('França', 33),
    ('Alemanha', 49),
    ('Itália', 39),
    ('Reino Unido', 44),
    ('Estados Unidos', 1),
    ('Canadá', 1),
    ('Brasil', 55),
    ('Japão', 81);

-- Dados para a tabela Publicacao
INSERT INTO Publicacao (Tipo, Valor)
VALUES 
    ('URL', 'http://example.com/publication1'),
    ('DOI', '10.1234/56789'),
    ('URL', 'http://example.com/publication2'),
    ('DOI', '10.5678/12345'),
    ('URL', 'http://example.com/publication3'),
    ('DOI', '10.9876/54321'),
    ('URL', 'http://example.com/publication4'),
    ('DOI', '10.4567/89012'),
    ('URL', 'http://example.com/publication5'),
    ('DOI', '10.3456/67890');

-- Dados para a tabela Membros_DIUBI
INSERT INTO Membros_DIUBI (Num_Funcionario, ORCID, Funcao)
VALUES 
    (12345, '0000-0001-2345-6789', 'Pesquisador'),
    (23456, '0000-0002-3456-7891', 'Estudante'),
    (34567, '0000-0003-4567-8912', 'Professor'),
    (45678, '0000-0004-5678-9123', 'Assistente'),
    (56789, '0000-0005-6789-1234', 'Administrador'),
    (67890, '0000-0006-7890-2345', 'Coordenador'),
    (78901, '0000-0007-8901-3456', 'Diretor'),
    (89012, '0000-0008-9012-4567', 'Pesquisador'),
    (90123, '0000-0009-0123-5678', 'Estudante'),
    (12345, '0000-0001-2345-6789', 'Pesquisador');

-- Dados para a tabela Tipo_Estado
INSERT INTO Tipo_Estado (Estado)
VALUES 
    ('Aprovado'),
    ('Cancelado'),
    ('Concluído'),
    ('Em Curso'),
    ('Encerrado'),
    ('Renovado'),
    ('Em Submissão');

-- Dados para a tabela Keywords
INSERT INTO Keywords (Keyword)
VALUES 
    ('Machine Learning'),
    ('Big Data'),
    ('Data Science'),
    ('Artificial Intelligence'),
    ('Internet of Things'),
    ('Blockchain'),
    ('Cybersecurity'),
    ('Cloud Computing'),
    ('Robotics'),
    ('Augmented Reality');

-- Dados para a tabela Tipo_Dominio
INSERT INTO Tipo_Dominio (Dominio_Cientifico)
VALUES 
    ('Ciência da Computação'),
    ('Engenharia Elétrica'),
    ('Matemática'),
    ('Física'),
    ('Química'),
    ('Biologia'),
    ('Medicina'),
    ('Economia'),
    ('Psicologia'),
    ('Sociologia');

-- Dados para a tabela Area_Cientifica
INSERT INTO Area_Cientifica (Area_Cientifica)
VALUES 
    ('Inteligência Artificial'),
    ('Ciência de Dados'),
    ('Redes de Computadores'),
    ('Engenharia de Software'),
    ('Sistemas Embarcados'),
    ('Bioinformática'),
    ('Econometria'),
    ('Neurociência'),
    ('Robótica'),
    ('Ciências Ambientais');

-- Dados para a tabela Departamento
INSERT INTO Departamento (Nome_Departamento)
VALUES 
    ('Departamento de Informática'),
    ('Departamento de Engenharia'),
    ('Departamento de Matemática'),
    ('Departamento de Física'),
    ('Departamento de Química'),
    ('Departamento de Biologia'),
    ('Departamento de Economia'),
    ('Departamento de Psicologia'),
    ('Departamento de Sociologia'),
    ('Departamento de Medicina');

-- Dados para a tabela Estado
INSERT INTO Estado (ID_Projeto, ID_Tipo_Estado)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 1),
    (5, 2),
    (6, 3),
    (7, 1),
    (8, 2),
    (9, 3),
    (10, 1);

-- Dados para a tabela Keyword_Projeto
INSERT INTO Keyword_Projeto (ID_Projeto, ID_Keyword)
VALUES 
    (1, 1),
    (2, 3),
    (3, 5),
    (4, 7),
    (5, 9),
    (6, 3),
    (7, 2),
    (8, 6),
    (9, 5),
    (10, 8);

-- Dados para a tabela Dominio
INSERT INTO Dominio (ID_Projeto, ID_Tipo_Dominio)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- Dados para a tabela Area
INSERT INTO Area (ID_Projeto, ID_Area_Cientifica)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- Dados para a tabela Departamento_Investigacao
INSERT INTO Departamento_Investigacao (ID_Membro, ID_Departamento)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- Dados para a tabela Funcao_Membro
INSERT INTO Funcao_Membro (ID_Projeto, ID_Membro)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- Dados para a tabela Entidade
INSERT INTO Entidade (Nome, Email, Telefone, Designacao, Morada, URL_Online, ID_Pais)
VALUES 
    ('Entidade 1', 'entidade1@example.com', '123456789', 'Designação Entidade 1', 'Morada Entidade 1', 'http://entidade1.example.com', 1),
    ('Entidade 2', 'entidade2@example.com', '234567890', 'Designação Entidade 2', 'Morada Entidade 2', 'http://entidade2.example.com', 2),
    ('Entidade 3', 'entidade3@example.com', '345678901', 'Designação Entidade 3', 'Morada Entidade 3', 'http://entidade3.example.com', 3),
    ('Entidade 4', 'entidade4@example.com', '456789012', 'Designação Entidade 4', 'Morada Entidade 4', 'http://entidade4.example.com', 4),
    ('Entidade 5', 'entidade5@example.com', '567890123', 'Designação Entidade 5', 'Morada Entidade 5', 'http://entidade5.example.com', 5),
    ('Entidade 6', 'entidade6@example.com', '678901234', 'Designação Entidade 6', 'Morada Entidade 6', 'http://entidade6.example.com', 6),
    ('Entidade 7', 'entidade7@example.com', '789012345', 'Designação Entidade 7', 'Morada Entidade 7', 'http://entidade7.example.com', 7),
    ('Entidade 8', 'entidade8@example.com', '890123456', 'Designação Entidade 8', 'Morada Entidade 8', 'http://entidade8.example.com', 8),
    ('Entidade 9', 'entidade9@example.com', '901234567', 'Designação Entidade 9', 'Morada Entidade 9', 'http://entidade9.example.com', 9),
    ('Entidade 10', 'entidade10@example.com', '012345678', 'Designação Entidade 10', 'Morada Entidade 10', 'http://entidade10.example.com', 10);

-- Dados para a tabela Tipo_Financiamento
INSERT INTO Tipo_Financiamento (Tipo, Competitivo, ID_Programa, Capital)
VALUES 
    (1, 1, 1, 10000),
    (0, 0, 2, 20000),
    (1, 1, 3, 30000),
    (0, 0, 4, 40000),
    (1, 1, 5, 50000),
    (0, 0, 6, 60000),
    (1, 1, 7, 70000),
    (0, 0, 8, 80000),
    (1, 1, 9, 90000),
    (0, 0, 10, 100000);

-- Dados para a tabela Financiamento
INSERT INTO Financiamento (ID_Projeto, ID_Tipo_Financiamento)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- Dados para a tabela Publicacao_Identificadores
INSERT INTO Publicacao_Identificadores (ID_Projeto, ID_Publicacao)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);

-- Dados para a tabela Projeto_Entidade
INSERT INTO Projeto_Entidade (ID_Projeto, ID_Entidade)
VALUES 
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5),
    (6, 6),
    (7, 7),
    (8, 8),
    (9, 9),
    (10, 10);
