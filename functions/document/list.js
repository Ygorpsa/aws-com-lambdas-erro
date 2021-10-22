const db = require('./db');
const Document = require('./models/document');

let dbInitialized = false;
async function initDB() {
  if (dbInitialized) 
    return;
  
  await Document.sync();
  dbInitialized = true;
}

async function handler() {
  await initDB();

  const documents = await Document.findAll();
  return {
    statusCode: 200,
    body: JSON.stringify(documents)
  }
}

exports.handler = handler;