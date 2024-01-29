const express = require('express');
const app = express.Router();
const jwt = require('jsonwebtoken');
require('dotenv').config()

let database;
import('../database.mjs')
  .then((db) => {
    database = db;
  })
  .catch((error) => {
    console.error('Error loading database module:', error);
  });


app.get('/login', (req, res) => {
  res.status(200).render('login', {msg:""})
})

app.get('/logout', async (req, res) => {
  res.clearCookie('access_token');
  res.status(200).render('login', {msg:"logged out"})
})

app.get('/signup', (req, res) => {
  res.status(200).render('signup')
})

app.post('/login', async (req, res)=>{
  try{
    let fetched = await database.login(req.body.emailID, req.body.password)
    if(fetched){
      const user = {userID: fetched.userID}     
      const accessToken = createAccessToken(user);
      res.status(200).json({accessToken})
    } else{
      res.status(404).json({error: 'notfound'})
    }
  } catch(er){
    console.log(er);
    res.status(404).json({error: 'notfound'})
  }
})
  
app.post('/signup', async (req, res) => {
  try {
    if (req.body.password !== req.body.cpassword) {
      console.log('Passwords didn\'t match');
      res.status(400);
    } else {
      const userData = req.body;
      const existingUserByEmail = await database.getUserFromEmail(userData.emailID);

      if (existingUserByEmail) {
      res.status(409);
      } else {
        const existingUserByID = await database.getUserFromID(userData.userID);

        if (existingUserByID) {
        res.status(409).send();
        } else {
          await database.createUser(userData.userID, userData.username, userData.emailID, userData.password, getDateformat());
          res.status(200).render('signup' ,{ msg: 'Account created' });
        }
      }
    }
  } catch (error) {
    console.error('Error during signup:', error);
    res.status(500).json({ error: 'InternalError', msg: 'Internal server error during signup' });
  }
});

app.post('/checkid', async (req, res) => {
  try {
    let existsBoolean = false;
    const toCheck = req.body.userID;
    const user = await database.getUserFromID(toCheck);
    if(user){
      existsBoolean = true;
    }
    res.status(200).json({ existsBoolean });

  } catch (error) {
    console.error('Error in checkid:', error);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

app.post('/checkemail', async (req, res) => {
try {
    let existsBoolean = false;
    const toCheck = req.body.emailID;
    const user = await database.getUserFromEmail(toCheck);
    if(user){
    existsBoolean = true;
    }
    res.status(200).json({ existsBoolean });

} catch (error) {
    console.error('Error in checkemail:', error);
    res.status(500).json({ error: 'Internal Server Error' });
}
});  

function createAccessToken(user){
  return jwt.sign(user, process.env.JWT_TOKEN, {expiresIn: '86400s'});
}

module.exports = app;