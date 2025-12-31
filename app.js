const express = require("express");
const os = require("os");

const app = express();

const NODE_NUMBER = process.env.NODE_NUMBER || "01";
const VERSION = process.env.APP_VERSION || "1.0";

// REAL container hostname (Docker/ECS)
const CONTAINER_HOSTNAME = os.hostname();

app.get("/", (req, res) => {
  res.send(`
    <html>
      <body style="text-align:center;font-family:Arial;margin-top:50px;">
        <h1>Node-${NODE_NUMBER}</h1>
        <h3>Version ${VERSION}</h3>
        <p><b>Container Hostname:</b> ${CONTAINER_HOSTNAME}</p>
      </body>
    </html>
  `);
});

app.listen(3000, () => {
  console.log("App running");
});
