const db = require('./db');
const Document = require('./models/document');

let dbInitialized = false;
async function initDB() {
  if (dbInitialized) 
    return;
  
  await Document.sync();
  dbInitialized = true;
}

async function handler(event) {
  await initDB();

  const document = await Document.create(JSON.parse(event.body));
  return {
    statusCode: 200,
    body: JSON.stringify(document)
  }
}

exports.handler = handler;