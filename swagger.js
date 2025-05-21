// swagger.js
const swaggerJsdoc = require('swagger-jsdoc');

const options = {
  definition: {
    openapi: '3.0.0',
    info: {
      title: 'Wiredin API Documentation',
      version: '1.0.0',
      description: 'API docs for Wiredin Express + Prisma project',
    },
    servers: [
      {
        url: '',
      },
    ],
    components: {
      securitySchemes: {
        bearerAuth: {
          type: 'http',
          scheme: 'bearer',
          bearerFormat: 'JWT'
        }
      },
      schemas: {
        Institution: {
          type: 'object',
          properties: {
            id: { type: 'integer', example: 1 },
            name: { type: 'string', example: 'Harvard' },
            description: { type: 'string' },
            address: { type: 'string' },
            avgRating: { type: 'number', example: 4.5 },
            totalReview: { type: 'integer', example: 32 },
            image: { type: 'object' },
            workingHours: { type: 'array', items: { type: 'object' } }
          }
        }
      }
    }    
  },
  apis: ['./src/routes/*.js'], 
};

const swaggerSpec = swaggerJsdoc(options);
module.exports = swaggerSpec;
