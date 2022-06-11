var express = require('express');
var app = express();


var port = process.env.PORT || 8080;

app.get('/', function (req, res) {
  res.send(`<h1>Welcome, I'm listening..</h1>`)
});

app.get('/name/:myname', (req, res) => {
  const myName = req.params.myname
  res.send(`<h1>You entered:  ${myName}</h1>`)
})

app.listen(port, function () {
  console.log("Listening on port:", port);
});