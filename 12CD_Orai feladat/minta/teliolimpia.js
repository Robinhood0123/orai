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
    const sql = "SELECT * FROM helyszinek WHERE aktualis = 1";
    db.query(sql, (err, results) => {
        if (err) {
            res.status(500).send('Hiba történt a helyszínek lekérdezésekor');
            return;
        }
        res.json(results);
    });
});

app.get('/eremszerzok', (req, res) => {
    const sql = "SELECT * FROM eredmenyek ORDER BY helyezes ASC";
    db.query(sql, (err, results) => {
        if (err) {
            res.status(500).send('Hiba történt az éremszerzők lekérdezésekor');
            return;
        }
        res.json(results);
    });
});

app.get('/magyar_eremszerzok', (req, res) => {
    const sql = `
        SELECT s.helyszin, m.helyezes, t.tav 
        FROM magyarermesek m
        JOIN rpgytavok t ON m.tavID = t.tavID
        JOIN sportagak s ON m.sportagID = s.sportagID
        ORDER BY m.helyezes ASC
    `;
    db.query(sql, (err, results) => {
        if (err) {
            res.status(500).send('Hiba történt a magyar éremszerzők lekérdezésekor');
            return;
        }
        res.json(results);
    });
});

app.listen(3000, () => {
    console.log("A téliolimpia szervere a 3000-es porton fut.");
});
