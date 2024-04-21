const express = require('express')
const bodyParser = require('body-parser')
import chalk from 'chalk';
const path = require('path')
const PORT = process.env.PORT || 3333 // Uselessness of packages

const app = express()

app.use(require('cors')())
app.set("view engine", require('ejs'))
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// app.use("/api", require('./routers/api'))
app.use("", require('./routers/index')) // For / Route 
app.use('/assets', express.static(path.join(__dirname, 'assets')))

/*
app.use((req, res, next) => {
  res.status(404).render(__dirname+'/views/errors/404.ejs', {
    
  })
}) // 404 Duck not found
*/

app.listen(PORT, () => {
  console.log(chalk.blue("[EXPRESS]") + chalk.green(" Running on port:", PORT))
})