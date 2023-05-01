const e = require('express');
let express = require('express');
let fs = require('fs')
let app = express();

const path = "./data.txt";

app.get('/api', function(req, res) {
    if (addNewEntry(req.query.name) === true) {
        res.send("true");
    } else res.send("false")
});

function addNewEntry(key) {
    if (!fs.existsSync(path)) {
        console.log("Not exit")
        fs.writeFileSync(path, key + "\n");
        return true;
    } else {
        if (checkIfExist(key)) {
            return false;
        }
        fs.writeFileSync(path, fs.readFileSync(path, "utf-8") + key + "\n")
        return true;
    }
}



function writeToDataBase(data) {

}

function checkIfExist(data) {
    return fs.readFileSync(path, "utf-8").includes(data);
}

/*
app.get("/api", function(req, res) {
    res.send(req.query.key);
});*/

app.listen("80");