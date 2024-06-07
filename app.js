const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');
const swaggerUi = require('swagger-ui-express');
const swaggerJsdoc = require('swagger-jsdoc');
const helmet = require('helmet');
const bcrypt = require('bcrypt');

const app = express();
const port = 3000;

app.use(express.static('public'));
app.use(bodyParser.json()); 
app.use(helmet());

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'seguimiento_salud'
});

const swaggerOptions = {
    swaggerDefinition: {
        info: {
            title: 'Seguimiento de Salud API',
            version: '1.0.0'
        }
    },
    apis: ['app.js']
};

const swaggerDocs = swaggerJsdoc(swaggerOptions);
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocs));

// Swagger documentación
/**
 * @swagger
 * /usuarios:
 *   get:
 *     description: Obtener todos los usuarios
 *     responses:
 *       200:
 *         description: Lista de usuarios
 */

db.connect(err => {
    if (err) {
        throw err;
    }
    console.log('MySQL Connected...');
});

app.get('/usuarios', (req, res) => {
    let sql = 'SELECT * FROM Usuario';
    db.query(sql, (err, result) => {
        if (err) throw err;
        res.send(result);
    });
});

app.post('/indicadores', (req, res) => {
    let data = req.body;
    let sql = 'INSERT INTO Indicador_Salud SET ?';
    db.query(sql, data, (err, result) => {
        if (err) throw err;
        res.send('Indicador de salud registrado...');
    });
});

app.post('/usuarios', async (req, res) => {
    let data = req.body;
    data.Contrasena = await bcrypt.hash(data.Contrasena, 10);
    let sql = 'INSERT INTO Usuario SET ?';
    db.query(sql, data, (err, result) => {
        if (err) throw err;
        res.send('Usuario registrado...');
    });
});

app.listen(port, () => {
    console.log(`Server started on port ${port}`);
});
