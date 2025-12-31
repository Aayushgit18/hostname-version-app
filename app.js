const express = require('express');
const os = require('os');

const app = express();

// ENV values from ECS task definition
const NODE_NUMBER = process.env.NODE_NUMBER || "01";
const VERSION = process.env.APP_VERSION || "1.0";

// Real EC2 hostname
const SYSTEM_HOSTNAME = os.hostname();

// Final display string (THIS WAS MISSING)
const DISPLAY_NAME = `${SYSTEM_HOSTNAME}-Node-${NODE_NUMBER}`;

app.get('/', (req, res) => {
  res.send(`
<!DOCTYPE html>
<html>
<head>
  <title>Hostname App</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
      margin-top: 60px;
    }
    h1 { color: #2c3e50; }
    h3 { color: #16a085; }
  </style>
</head>
<body>
  <h1>${DISPLAY_NAME}</h1>
  <h3>Version ${VERSION}</h3>
</body>
</html>
  `);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Running on ${DISPLAY_NAME}, version ${VERSION}`);
});
