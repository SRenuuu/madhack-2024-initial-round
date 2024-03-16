const express = require('express');
const cors = require('cors');
const compression = require('compression');
const cookieParser = require('cookie-parser');
const database = require('./database');
const config = require('./config');
const routes = require('./routes');

const swaggerUi = require('swagger-ui-express');
const swaggerJsdoc = require('swagger-jsdoc');

const app = express();

// connect to mongoDB
database.init(true); //  to run seeds database.init(true);

// express in json format and urlencoded
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// add compression
app.use(compression());

// cors
app.use(
    cors({
        origin: "*",
        methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
        preflightContinue: false,
        optionsSuccessStatus: 204
    })
);

app.use(cors());

// cookie parser
app.use(cookieParser());

const swaggerDefinition = {
    openapi: '3.0.0',
    info: {
        title: 'MadHack 2024 API',
        version: '1.0.0',
        description: 'This is a API collection for MadHack 2024',
    },
};

const swaggerOptions = {
    swaggerDefinition,
    apis: ['./app/auth.js'],
};

const swaggerSpec = swaggerJsdoc(swaggerOptions);

// Serve the swagger documentation
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerSpec));

// add a prefix for routes
app.use('/api', routes);

// listen to server at given port
app.listen(config.port, () => console.info('server listening at port:', config.port));
