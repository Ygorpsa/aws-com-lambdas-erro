const { Sequelize } = require('sequelize');
console.log(process.env['DB_USERNAME']);
module.exports = new Sequelize(
  process.env['DB_DBNAME'], 
  process.env['DB_USERNAME'], 
  process.env['DB_PASSWORD'], 
  {
    host: process.env['DB_HOST'],
    port: process.env['DB_PORT'],
    dialect: 'mysql'
  });