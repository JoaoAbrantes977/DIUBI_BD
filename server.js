const express = require('express');
const bodyParser = require('body-parser');
const sql = require("msnodesqlv8");
const app = express();
const port = 3000;
const cors = require('cors');

app.use(cors());

const connectionString = "Server=LAPTOP-73LR98JM\\SQLEXPRESS;Database=DIUBI_DB;Trusted_Connection=Yes;Driver={SQL Server Native Client 11.0}";
const query = "SELECT * FROM Departamento";

sql.query(connectionString, query, (err, rows) =>{

    console.log(rows)
})


/*
// Configurar a conexão com a base de dados SQL Server
const dbConfig = {
    user: 'sa',
    password: 'root',
    server: 'localhost',
    database: 'DIUBI_DB',
    options: {
        trustedConnection: true
    }
};

// Conectar ao SQL Server
sql.connect(dbConfig, (err) => {
    if (err) {
        console.error('Erro ao conectar ao SQL Server: ', err);
    } else {
        console.log('Conectado ao SQL Server');
    }
});

*/
// Middleware
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.set('view engine', 'ejs');
app.use(express.static('public'));
const projectRoute = require("./Routes/projeto");
app.use('/projeto', projectRoute);


// Rota principal
app.get('/', (req, res) => {
    res.send('Bem-vindo à aplicação DIUBI');

});

// Iniciar o servidor
app.listen(port, () => {
    console.log(`Servidor a correr em http://localhost:${port}`);
});
