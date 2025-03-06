const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const cors = require("cors");
const mysql = require("mysql");

app.use(cors());
app.use(bodyParser.json());

const db = mysql.createConnection({
    user: "root",
    host: "localhost",
    port: 3306,
    password: "",
    database: "teliolimpia"
});

db.connect((err) => {
    if (err) {
        console.error('Hiba az adatbázishoz való kapcsolódáskor:', err);
    } else {
        console.log('Sikeres adatbázis kapcsolat!');
    }
});

app.get("/", (req, res) => {
    res.send("Működik a szerver.");
});

app.get('/helyszinek', (req, res) => {
    const query = 'SELECT varos, helyszin FROM sportagak';
    db.query(query, (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });
 
 
  app.get('/eremhelyek', (req, res) => {
    const query = 'SELECT helyezes, orszag, arany, ezust, bronz FROM rpgyorskorcsolyaeredmenyek ORDER BY helyezes ASC';
    db.query(query, (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });
 
 
  app.get('/magyarermesek', (req, res) => {
    const query = `
      SELECT s.varos AS Helyszin, m.helyezes AS Helyezes, t.tav AS Tav
      FROM magyarermesek m
      JOIN sportagak s ON m.sportagID = s.sportagID
      JOIN rpgytavok t ON m.tavID = t.tavID
      WHERE s.varos = 'Peking'
    `;
    db.query(query, (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });

app.listen(3000, () => {
    console.log("A téliolimpia szervere a 3000-es porton fut.");
});
