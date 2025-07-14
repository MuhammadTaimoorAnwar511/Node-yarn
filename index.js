// index.js
require('dotenv').config();        // ⇐ loads .env into process.env
const express = require('express');
const app = express();

// Read PORT from env, default to 3000 if unset
const PORT = process.env.PORT;

app.get('/', (req, res) => res.send(`🚀 Listening on port ${PORT}`));

app.listen(PORT, () => console.log(`🚀 Listening on port ${PORT}`));
