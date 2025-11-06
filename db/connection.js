const mysql = require('mysql2/promise');

// Database configuration
const dbConfig = {
    host: 'localhost',
    user: 'root', // Change to your MySQL username
    password: 'Kaushal@2815', // Change to your MySQL password
    database: 'aira_chatbot'
};

// Create connection pool
const createConnection = async () => {
    try {
        const connection = await mysql.createConnection(dbConfig);
        console.log('Connected to MySQL database successfully');
        return connection;
    } catch (error) {
        console.error('Error connecting to database:', error);
        throw error;
    }
};

module.exports = { createConnection, dbConfig };