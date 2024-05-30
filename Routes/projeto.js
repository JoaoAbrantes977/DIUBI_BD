const express = require('express');
const router = express.Router();
const sql = require("msnodesqlv8");

// Connection string
const connectionString = "Server=LAPTOP-73LR98JM\\SQLEXPRESS;Database=DIUBI_DB;Trusted_Connection=Yes;Driver={SQL Server Native Client 11.0}";

// List all projects
router.get('/', async (req, res) => {
    try {
        // Query to retrieve projects
        const query = "SELECT * FROM Projeto";
        
        // Execute the query using the connection string
        sql.query(connectionString, query, (err, result) => {
            if (err) {
                console.error('Erro ao listar projetos: ', err);
                res.status(500).send('Erro ao listar projetos');
                return;
            }
            
            res.json({"Projeto": result });
        });
    } catch (err) {
        console.error('Erro ao listar projetos: ', err);
        res.status(500).send('Erro ao listar projetos');
    }
});

// Adicionar um projeto
router.post('/projetos', async (req, res) => {
    const { nome, titulo, descricao, data_inicio, data_fim } = req.body;
    try {
        const pool = await sql.connect(dbConfig);
        const result = await pool.request()
            .input('Nome', sql.NVarChar, nome)
            .input('Titulo', sql.NVarChar, titulo)
            .input('Descricao', sql.Text, descricao)
            .input('Data_Inicio', sql.Date, data_inicio)
            .input('Data_Fim', sql.Date, data_fim)
            .query('INSERT INTO Projeto (Nome, Titulo, Descricao, Data_Inicio, Data_Fim) VALUES (@Nome, @Titulo, @Descricao, @Data_Inicio, @Data_Fim)');
        res.redirect('/projetos');
    } catch (err) {
        console.error('Erro ao adicionar projeto: ', err);
        res.status(500).send('Erro ao adicionar projeto');
    }
});

module.exports = router;
