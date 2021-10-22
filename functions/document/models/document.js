const db = require('../db');
const { Sequelize } = require('sequelize');

const Document = db.define('Document', {
  // Model attributes are defined here
  s3URL: {
    type: Sequelize.DataTypes.STRING,
    allowNull: false
  },
  token: {
    type: Sequelize.DataTypes.STRING,
    allowNull: false
  }
}, {
  // Other model options go here
});

module.exports = Document;