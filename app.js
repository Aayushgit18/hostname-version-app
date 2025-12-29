const express = require('express');
const os = require('os');

const app = express();
const PORT = process.env.PORT || 3000;

// Read hostname
const hostname = os.hostname();

// Extract last 2 characters (fallback if not numeric)
const suffix = hostname.slice(-2);

// Read version from env
const VERSION = process.env.APP_VERSION || '1.0';

app.get('/', (req, res) => {
  res.send(`
    <html>
      <body style="font-family: Arial; text-align: center; margin-top: 50px;">
        <h1>Node-${suffix}</h1>
        <h3>Version: ${VERSION}</h3>
        <p>Hostname: ${hostname}</p>
      </body>
    </html>
  `);
});

app.listen(PORT, () => {
  console.log(`App running on port ${PORT}`);
});

