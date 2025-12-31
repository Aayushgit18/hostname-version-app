const express = require("express");
const os = require("os");

const app = express();

// Version should always come from Terraform / ECS
const VERSION = process.env.APP_VERSION || "1.0";

// Unique hostname per container
const SYSTEM_HOSTNAME = os.hostname();

// Derive a stable Node number from hostname
const NODE_SUFFIX = SYSTEM_HOSTNAME.slice(-2); // last 2 chars
const NODE_NAME = `Node-${NODE_SUFFIX}`;

app.get("/", (req, res) => {
  res.send(`
<!DOCTYPE html>
<html>
<head>
  <title>Web UI App</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
      margin-top: 50px;
    }
    h1 { color: #2c3e50; }
    h3 { color: #16a085; }
  </style>
</head>
<body>
  <h1>${NODE_NAME}</h1>
  <h3>Version ${VERSION}</h3>
</body>
</html>
  `);
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Web UI running on port ${PORT}`);
});
