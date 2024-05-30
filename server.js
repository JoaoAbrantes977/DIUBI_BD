const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const sql = require('msnodesqlv8');
const app = express();
const port = 3000;

// Configuração de conexão
const connectionString = "Driver={SQL Server};Server=localhost;Database=seu_banco_de_dados;Trusted_Connection=Yes;";

// Middleware
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors()); // Adiciona middleware cors

// Rota para o formulário de pesquisa
app.post('/search', (req, res) => {
    const { nomeProjeto, tituloProjeto, dataInicio, dataFim, nomePrograma, nomePais, tipoPublicacao, valorPublicacao, nomeMembro, funcaoMembro, estadoProjeto, keyword, dominioCientifico, areaCientifica, nomeDepartamento, nomeEntidade, tipoFinanciamento, competitivo } = req.body;

    let query = `
        SELECT p.Nome, p.Titulo, p.Descricao, p.Data_Inicio, p.Data_Fim
        FROM Projeto p
        LEFT JOIN Programa prg ON p.ID_Projeto = prg.ID_Projeto
        LEFT JOIN Entidade e ON p.ID_Projeto = e.ID_Projeto
        LEFT JOIN Financiamento f ON p.ID_Projeto = f.ID_Projeto
        LEFT JOIN Tipo_Financiamento tf ON f.ID_Tipo_Financiamento = tf.ID_Tipo_Financiamento
        LEFT JOIN Estado est ON p.ID_Projeto = est.ID_Projeto
        LEFT JOIN Tipo_Estado te ON est.ID_Tipo_Estado = te.ID_Tipo_Estado
        LEFT JOIN Keyword_Projeto kp ON p.ID_Projeto = kp.ID_Projeto
        LEFT JOIN Keywords k ON kp.ID_Keyword = k.ID_Keyword
        LEFT JOIN Dominio d ON p.ID_Projeto = d.ID_Tipo_Dominio
        LEFT JOIN Tipo_Dominio td ON d.ID_Tipo_Dominio = td.ID_Tipo_Dominio
        LEFT JOIN Area a ON p.ID_Projeto = a.ID_Area_Cientifica
        LEFT JOIN Area_Cientifica ac ON a.ID_Area_Cientifica = ac.ID_Area_Cientifica
        LEFT JOIN Funcao_Membro fm ON p.ID_Projeto = fm.ID_Projeto
        LEFT JOIN Membros_DIUBI m ON fm.ID_Membro = m.ID_Membro
        LEFT JOIN Departamento_Investigacao di ON m.ID_Membro = di.ID_Membro
        LEFT JOIN Departamento dep ON di.ID_Departamento = dep.ID_Departamento
        WHERE 1=1
    `;

    if (nomeProjeto) query += ` AND p.Nome LIKE '%${nomeProjeto}%'`;
    if (tituloProjeto) query += ` AND p.Titulo LIKE '%${tituloProjeto}%'`;
    if (dataInicio) query += ` AND p.Data_Inicio >= '${dataInicio}'`;
    if (dataFim) query += ` AND p.Data_Fim <= '${dataFim}'`;
    if (nomePrograma) query += ` AND prg.Nome_Programa LIKE '%${nomePrograma}%'`;
    if (nomePais) query += ` AND e.Nome_do_Pais LIKE '%${nomePais}%'`;
    if (tipoPublicacao) query += ` AND pub.Tipo LIKE '%${tipoPublicacao}%'`;
    if (valorPublicacao) query += ` AND pub.Valor LIKE '%${valorPublicacao}%'`;
    if (nomeMembro) query += ` AND m.Num_Funcionario LIKE '%${nomeMembro}%'`;
    if (funcaoMembro) query += ` AND m.Funcao LIKE '%${funcaoMembro}%'`;
    if (estadoProjeto) query += ` AND te.Estado LIKE '%${estadoProjeto}%'`;
    if (keyword) query += ` AND k.Keyword LIKE '%${keyword}%'`;
    if (dominioCientifico) query += ` AND td.Dominio_Cientifico LIKE '%${dominioCientifico}%'`;
    if (areaCientifica) query += ` AND ac.Area_Cientifica LIKE '%${areaCientifica}%'`;
    if (nomeDepartamento) query += ` AND dep.Nome_Departamento LIKE '%${nomeDepartamento}%'`;
    if (nomeEntidade) query += ` AND e.Nome LIKE '%${nomeEntidade}%'`;
    if (tipoFinanciamento) query += ` AND tf.Tipo = ${tipoFinanciamento === 'Interno' ? 1 : 0}`;
    if (competitivo) query += ` AND tf.Competitivo = ${competitivo === 'Sim' ? 1 : 0}`;

    console.log("Consulta SQL:", query); 

    sql.query(connectionString, query, (err, rows) => {
        if (err) {
            console.error("Erro ao executar a consulta:", err);
            res.status(500).json({ error: "Erro interno do servidor." });
            return;
        }
        res.json(rows);
        console.log("rows - " + rows)
    });
});

app.listen(port, () => {
    console.log(`Servidor a correr em http://localhost:${port}`);
});
