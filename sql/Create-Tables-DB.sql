CREATE TABLE Projeto (
    ID_Projeto INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100) NOT NULL,
    Titulo NVARCHAR(150) NOT NULL,
    Descricao TEXT,
    Data_Inicio DATE,
    Data_Fim DATE
);

CREATE TABLE Programa (
    ID_Programa INT PRIMARY KEY IDENTITY(1,1),
	Nome_Programa NVARCHAR(100),
    ID_Projeto INT,
    FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto)
);

CREATE TABLE Pais (
    ID_Pais INT PRIMARY KEY IDENTITY(1,1),
    Nome_do_Pais NVARCHAR(100) NOT NULL,
	Codigo_Pais INT NOT NULL
);

CREATE TABLE Publicacao (
	ID_Publicacao INT PRIMARY KEY IDENTITY(1,1),
	Tipo NVARCHAR(100) NOT NULL, -- (URL OU DOI)
	Valor NVARCHAR(100) NOT NULL
);

CREATE TABLE Membros_DIUBI (
	ID_Membro INT PRIMARY KEY IDENTITY(1,1),
	Num_Funcionario INT NOT NULL,
	ORCID NVARCHAR(30) NOT NULL,
	Funcao NVARCHAR(30) NOT NULL
);

CREATE TABLE Tipo_Estado (
	ID_Tipo_Estado INT PRIMARY KEY IDENTITY(1,1),
	Estado NVARCHAR(30) NOT NULL
);

CREATE TABLE Keywords (
	ID_Keyword INT PRIMARY KEY IDENTITY(1,1),
	Keyword NVARCHAR(30) NOT NULL
);

CREATE TABLE Tipo_Dominio (
	ID_Tipo_Dominio INT PRIMARY KEY IDENTITY(1,1),
	Dominio_Cientifico NVARCHAR(30) NOT NULL
);

CREATE TABLE Area_Cientifica (
	ID_Area_Cientifica INT PRIMARY KEY IDENTITY(1,1),
	Area_Cientifica NVARCHAR(30) NOT NULL
);
CREATE TABLE Departamento (
	ID_Departamento INT PRIMARY KEY IDENTITY(1,1),
	Nome_Departamento NVARCHAR(30) NOT NULL
);

CREATE TABLE Estado (
    ID_Projeto INT,
    ID_Tipo_Estado INT,
    PRIMARY KEY (ID_Projeto, ID_Tipo_Estado),
    FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
    FOREIGN KEY (ID_Tipo_Estado) REFERENCES Tipo_Estado(ID_Tipo_Estado)
);

CREATE TABLE Keyword_Projeto (
    ID_Projeto INT,
    ID_Keyword INT,
    PRIMARY KEY (ID_Projeto, ID_Keyword),
    FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
    FOREIGN KEY (ID_Keyword) REFERENCES Keywords(ID_Keyword)
);

CREATE TABLE Dominio (
    ID_Projeto INT,
    ID_Tipo_Dominio INT,
    PRIMARY KEY (ID_Projeto, ID_Tipo_Dominio),
    FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
    FOREIGN KEY (ID_Tipo_Dominio) REFERENCES Tipo_Dominio(ID_Tipo_Dominio)
);

CREATE TABLE Area (
    ID_Projeto INT,
    ID_Area_Cientifica INT,
    PRIMARY KEY (ID_Projeto, ID_Area_Cientifica),
    FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
    FOREIGN KEY (ID_Area_Cientifica) REFERENCES Area_Cientifica(ID_Area_Cientifica)
);

CREATE TABLE Departamento_Investigacao (
    ID_Membro INT,
    ID_Departamento INT,
    PRIMARY KEY (ID_Membro, ID_Departamento),
    FOREIGN KEY (ID_Membro) REFERENCES Membros_DIUBI(ID_Membro),
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento)
);

CREATE TABLE Funcao_Membro (
    ID_Projeto INT,
    ID_Membro INT,
    PRIMARY KEY (ID_Projeto, ID_Membro),
    FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
    FOREIGN KEY (ID_Membro) REFERENCES Membros_DIUBI(ID_Membro)
);

CREATE TABLE Entidade (
	ID_Entidade INT PRIMARY KEY IDENTITY(1,1),
	Nome NVARCHAR(100) NOT NULL,
	Email NVARCHAR(40) NOT NULL,
	Telefone NVARCHAR(13) NOT NULL,
	Designacao NVARCHAR(100) NOT NULL,
	Morada NVARCHAR(100) NOT NULL,
	URL_Online NVARCHAR(100) NOT NULL,
    ID_Pais INT ,
    FOREIGN KEY (ID_Pais) REFERENCES Pais(ID_Pais)
);

CREATE TABLE Tipo_Financiamento (
    ID_Tipo_Financiamento INT PRIMARY KEY IDENTITY(1,1),
	Tipo BIT NOT NULL, --(Interno ou Externo) 1 - INTERNO / 0 - EXTERNO
	Competitivo BIT NOT NULL, --(sim ou nao) 1 - TRUE / 0 - FALSO
    ID_Programa INT,
	Capital INT,
    FOREIGN KEY (ID_Programa) REFERENCES Programa(ID_Programa)
);

CREATE TABLE Financiamento (
    ID_Projeto INT,
    ID_Tipo_Financiamento INT,
    PRIMARY KEY (ID_Projeto, ID_Tipo_Financiamento),
    FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
    FOREIGN KEY (ID_Tipo_Financiamento) REFERENCES Tipo_Financiamento(ID_Tipo_Financiamento)
);

CREATE TABLE Publicacao_Identificadores (
    ID_Projeto INT,
    ID_Publicacao INT,
    PRIMARY KEY (ID_Projeto, ID_Publicacao),
    FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
    FOREIGN KEY (ID_Publicacao) REFERENCES Publicacao(ID_Publicacao)
);

CREATE TABLE Projeto_Entidade (
    ID_Projeto INT,
    ID_Entidade INT,
    PRIMARY KEY (ID_Projeto, ID_Entidade),
    FOREIGN KEY (ID_Projeto) REFERENCES Projeto(ID_Projeto),
    FOREIGN KEY (ID_Entidade) REFERENCES Entidade(ID_Entidade)
);
