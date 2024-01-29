const express = require('express');
const path = require('path');
const multer = require('multer')
const cookieParser = require('cookie-parser');
const jwt = require('jsonwebtoken')
require('dotenv').config()

const simple = require('./routes/simple');
const auth = require('./routes/auth');
const upload = require('./routes/upload');
const interactions = require('./routes/interactions');
let database;
import('./database.mjs')
  .then((db) => {
    database = db;
  })
  .catch((error) => {
    console.error('Error loading database module:', error);
  });

const app = express();
const port = 80;

//cookie parser middleware
app.use(cookieParser());

//session middleware
const oneDay = 1000*60*60*24;
app.use(express.json());

//serving static files
app.use('/static', express.static('static'))
app.use(express.urlencoded({extended: true}))

//set the template engine for pug
app.set('view engine', 'pug')

//set the views directory
app.set('views', path.join(__dirname, 'views'))

app.use('/', auth);
app.use('/', authenticatetoken);
app.use('/', simple);
app.use('/', upload);
app.use('/', interactions);

app.listen(port, ()=>{
    console.log(`the application started successfully on port${port}`)
})

function authenticatetoken(req, res, next){
  // const authHeader= req.headers['authorization']
  // const token = authHeader && authHeader.split(' ')[1]
  const token = req.cookies.access_token;
  if (token == null)
  return res.status(401).render('login', {msg:""})
  jwt.verify(token, process.env.JWT_TOKEN, (err, user)=>{
    if (err) return res.redirect('/logout')
    req.userID = user.userID;
    next()
  })
}

function getDateformat(){
  let d = new Date();
  let y = d.getFullYear();
  let m = d.getMonth() + 1;
  d = d.getDate();
  return y+"-"+m+"-"+d
}