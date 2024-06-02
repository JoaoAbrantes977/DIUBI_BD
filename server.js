const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const sql = require('msnodesqlv8');
const app = express();
const port = 3000;

// Configuração de conexão
const connectionString = "Driver={SQL Server};Server=LAPTOP-73LR98JM\\SQLEXPRESS;Database=DIUBI_DB;Trusted_Connection=Yes;";

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors()); // Adiciona middleware cors

// Rota para o formulário de pesquisa dinâmica de projetos
app.post('/search', (req, res) => {
    const { nomeProjeto, tituloProjeto, dataInicio, dataFim, nomePrograma, nomePais, tipoPublicacao, valorPublicacao, nomeMembro, funcaoMembro, estadoProjeto, keyword, dominioCientifico, areaCientifica, nomeDepartamento, nomeEntidade, tipoFinanciamento, competitivo } = req.body;

    let query = `
    SELECT  DISTINCT p.ID_Projeto, p.Nome, p.Titulo, CAST(p.Descricao AS NVARCHAR(MAX)), p.Data_Inicio, p.Data_Fim
    FROM Projeto p
    LEFT JOIN Programa prg ON p.ID_Projeto = prg.ID_Projeto
    LEFT JOIN Projeto_Entidade pe ON p.ID_Projeto = pe.ID_Projeto
    LEFT JOIN Entidade e ON pe.ID_Entidade = e.ID_Entidade
    LEFT JOIN Financiamento f ON p.ID_Projeto = f.ID_Projeto
    LEFT JOIN Tipo_Financiamento tf ON f.ID_Tipo_Financiamento = tf.ID_Tipo_Financiamento
    LEFT JOIN Estado est ON p.ID_Projeto = est.ID_Projeto
    LEFT JOIN Tipo_Estado te ON est.ID_Tipo_Estado = te.ID_Tipo_Estado
    LEFT JOIN Keyword_Projeto kp ON p.ID_Projeto = kp.ID_Projeto
    LEFT JOIN Keywords k ON kp.ID_Keyword = k.ID_Keyword
    LEFT JOIN Dominio d ON p.ID_Projeto = d.ID_Projeto
    LEFT JOIN Tipo_Dominio td ON d.ID_Tipo_Dominio = td.ID_Tipo_Dominio
    LEFT JOIN Area a ON p.ID_Projeto = a.ID_Projeto
    LEFT JOIN Area_Cientifica ac ON a.ID_Area_Cientifica = ac.ID_Area_Cientifica
    LEFT JOIN Funcao_Membro fm ON p.ID_Projeto = fm.ID_Projeto
    LEFT JOIN Membros_DIUBI m ON fm.ID_Membro = m.ID_Membro
    LEFT JOIN Departamento_Investigacao di ON m.ID_Membro = di.ID_Membro
    LEFT JOIN Departamento dep ON di.ID_Departamento = dep.ID_Departamento
    LEFT JOIN Pais pais ON e.ID_Pais = pais.ID_Pais
    WHERE 1=1
    `;

    const conditions = [];

    if (nomeProjeto) conditions.push(`p.Nome LIKE '%${nomeProjeto}%'`);
    if (tituloProjeto) conditions.push(`p.Titulo LIKE '%${tituloProjeto}%'`);
    if (dataInicio) conditions.push(`p.Data_Inicio >= '${dataInicio}'`);
    if (dataFim) conditions.push(`p.Data_Fim <= '${dataFim}'`);
    if (nomePrograma) conditions.push(`prg.Nome_Programa LIKE '%${nomePrograma}%'`);
    if (nomePais) conditions.push(`pais.Nome_do_Pais LIKE '%${nomePais}%'`);
    if (tipoPublicacao) conditions.push(`pub.Tipo LIKE '%${tipoPublicacao}%'`);
    if (valorPublicacao) conditions.push(`pub.Valor LIKE '%${valorPublicacao}%'`);
    if (nomeMembro) conditions.push(`m.Num_Funcionario LIKE '%${nomeMembro}%'`);
    if (funcaoMembro) conditions.push(`m.Funcao LIKE '%${funcaoMembro}%'`);
    if (estadoProjeto) conditions.push(`te.Estado LIKE '%${estadoProjeto}%'`);
    if (keyword) conditions.push(`k.Keyword LIKE '%${keyword}%'`);
    if (dominioCientifico) conditions.push(`td.Dominio_Cientifico LIKE '%${dominioCientifico}%'`);
    if (areaCientifica) conditions.push(`ac.Area_Cientifica LIKE '%${areaCientifica}%'`);
    if (nomeDepartamento) conditions.push(`dep.Nome_Departamento LIKE '%${nomeDepartamento}%'`);
    if (nomeEntidade) conditions.push(`e.Nome LIKE '%${nomeEntidade}%'`);
    if (tipoFinanciamento) conditions.push(`tf.Tipo = ${tipoFinanciamento === 'Interno' ? 1 : 0}`);
    if (competitivo) conditions.push(`tf.Competitivo = ${competitivo === 'Sim' ? 1 : 0}`);
    
    if (conditions.length > 0) {
        query += ` AND ${conditions.join(' AND ')}`;
    }
    
    console.log("Query SQL:", query); 

    sql.query(connectionString, query, (err, rows) => {
        if (err) {
            console.error("Erro ao executar a consulta:", err);
            res.status(500).json({ error: "Erro interno do servidor." });
            return;
        }
        res.json(rows);
    });
});

// Obter toda a informação de um unico projeto
app.post('/projectDetails', (req, res) => {
    const { id_projeto } = req.body;

    const query = `
        SELECT 
            p.Nome AS Projeto_Nome,
            p.Titulo AS Projeto_Titulo,
            p.Descricao AS Projeto_Descricao,
            p.Data_Inicio AS Projeto_Data_Inicio,
            p.Data_Fim AS Projeto_Data_Fim,
            prg.Nome_Programa,
            pais.Nome_do_Pais,
            pub.Tipo AS Publicacao_Tipo,
            pub.Valor AS Publicacao_Valor,
            m.Num_Funcionario,
            m.ORCID,
            m.Funcao,
            te.Estado,
            k.Keyword,
            td.Dominio_Cientifico,
            ac.Area_Cientifica,
            dep.Nome_Departamento,
            e.Nome AS Entidade_Nome,
            e.Email AS Entidade_Email,
            e.Telefone AS Entidade_Telefone,
            e.Designacao AS Entidade_Designacao,
            e.Morada AS Entidade_Morada,
            e.URL_Online AS Entidade_URL_Online,
            tf.Tipo AS Tipo_Financiamento_Tipo,
            tf.Competitivo AS Tipo_Financiamento_Competitivo,
            tf.Capital AS Tipo_Financiamento_Capital
        FROM 
            Projeto p
        LEFT JOIN 
            Programa prg ON p.ID_Projeto = prg.ID_Projeto
        LEFT JOIN 
            Projeto_Entidade pe ON p.ID_Projeto = pe.ID_Projeto
        LEFT JOIN 
            Entidade e ON pe.ID_Entidade = e.ID_Entidade
        LEFT JOIN 
            Pais pais ON e.ID_Pais = pais.ID_Pais
        LEFT JOIN 
            Financiamento f ON p.ID_Projeto = f.ID_Projeto
        LEFT JOIN 
            Tipo_Financiamento tf ON f.ID_Tipo_Financiamento = tf.ID_Tipo_Financiamento
        LEFT JOIN 
            Estado est ON p.ID_Projeto = est.ID_Projeto
        LEFT JOIN 
            Tipo_Estado te ON est.ID_Tipo_Estado = te.ID_Tipo_Estado
        LEFT JOIN 
            Keyword_Projeto kp ON p.ID_Projeto = kp.ID_Projeto
        LEFT JOIN 
            Keywords k ON kp.ID_Keyword = k.ID_Keyword
        LEFT JOIN 
            Dominio d ON p.ID_Projeto = d.ID_Projeto
        LEFT JOIN 
            Tipo_Dominio td ON d.ID_Tipo_Dominio = td.ID_Tipo_Dominio
        LEFT JOIN 
            Area a ON p.ID_Projeto = a.ID_Projeto
        LEFT JOIN 
            Area_Cientifica ac ON a.ID_Area_Cientifica = ac.ID_Area_Cientifica
        LEFT JOIN 
            Funcao_Membro fm ON p.ID_Projeto = fm.ID_Projeto
        LEFT JOIN 
            Membros_DIUBI m ON fm.ID_Membro = m.ID_Membro
        LEFT JOIN 
            Departamento_Investigacao di ON m.ID_Membro = di.ID_Membro
        LEFT JOIN 
            Departamento dep ON di.ID_Departamento = dep.ID_Departamento
        LEFT JOIN 
            Publicacao_Identificadores pi ON p.ID_Projeto = pi.ID_Projeto
        LEFT JOIN 
            Publicacao pub ON pi.ID_Publicacao = pub.ID_Publicacao
        WHERE 
         p.ID_Projeto = ?
    `;

    sql.query(connectionString, query, [id_projeto], (err, rows) => {
        if (err) {
            console.error('Erro ao buscar detalhes do projeto:', err);
            res.status(500).json({ error: 'Erro interno do servidor.' });
            return;
        }

        if (rows.length === 0) {
            res.status(404).json({ error: 'Projeto não encontrado.' });
            return;
        }

        res.json(rows[0]);
    });
});

// Obter todos os projetos
app.get('/allProjects', (req, res) => {
    const query = `
        SELECT 
            p.ID_Projeto,
            p.Nome AS Projeto_Nome,
            p.Titulo AS Projeto_Titulo,
            p.Descricao AS Projeto_Descricao,
            p.Data_Inicio AS Projeto_Data_Inicio,
            p.Data_Fim AS Projeto_Data_Fim
        FROM 
            Projeto p
    `;

    sql.query(connectionString, query, (err, rows) => {
        if (err) {
            console.error('Erro ao buscar todos os projetos:', err);
            res.status(500).json({ error: 'Erro interno do servidor.' });
            return;
        }

        res.json(rows);
    });
});

// Inserir uma entidade
app.post('/entidade', (req, res) => {
    const { Nome, Email, Telefone, Designacao, Morada, URL_Online, Pais } = req.body;
    const query = 'INSERT INTO Entidade (Nome, Email, Telefone, Designacao, Morada, URL_Online, ID_Pais) VALUES (?, ?, ?, ?, ?, ?, ?)';
    const values = [Nome, Email, Telefone, Designacao, Morada, URL_Online, parseInt(Pais)];

    sql.query(connectionString, query, values, (err, rows) => {
        if (err) {
            console.error("Erro ao executar a consulta:", err);
            res.status(500).json({ error: "Erro interno do servidor." });
            return;
        }
        res.json(rows);
    });
});

app.get('/allMembers', async (req, res) => {
    try {
        sql.query(connectionString, 'SELECT * FROM Membros_DIUBI', (err, rows) => {
            if (err) {
                console.error('Erro ao procurar membros:', err);
                res.status(500).json({ message: 'Erro ao procurar membros' });
                return;
            }
            res.json(rows);
        });
    } catch (error) {
        console.error('Erro ao procurar membros:', error);
        res.status(500).json({ message: 'Erro ao procurar membros' });
    }
});

//Inserir um membro num projeto
app.patch('/addMemberToProject/:projectId', async (req, res) => {
    const projectID = req.params.projectId;
    const { memberId} = req.body;

     let query = `INSERT INTO Funcao_Membro (ID_Projeto, ID_Membro) VALUES (?, ?)`;

    try {
        await sql.query(connectionString, query, [projectID, memberId]);

        res.status(200).json({ message: 'Membro adicionado ao projeto com sucesso' });
    } catch (error) {
        console.error('Erro ao adicionar membro ao projeto:', error);
        res.status(500).json({ message: 'Erro ao adicionar membro ao projeto' });
    }
});

app.listen(port, () => {
    console.log(`Servidor a correr em http://localhost:${port}`);
});
