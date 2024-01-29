const express = require('express');
const router = express.Router();

let database;
import('../database.mjs')
  .then((db) => {
    database = db;
  })
  .catch((error) => {
    console.error('Error loading database module:', error);
  });


  router.get('/', async (req, res) => {
    if(req.userID != undefined){
      res.status(200).render('index') 
    }
    else res.status(200).render('login', {msg:""})
  })
  
  router.get('/write', async (req, res) => {
    if(req.userID != undefined){
      let x = await database.getUserFromID(req.userID);
      res.status(200).render('write', x)
    }
    else{
      res.status(200).render('login', {msg:""})
    }
  })
  

  
  router.get('/profile', async (req, res) => {
    if(req.userID != undefined){
      let user = await database.getUserFromID(req.userID);
      res.status(200).render('profile', user)
    }
    else{
      res.status(200).render('login', {msg:"lol"})
    }
  })
  

  
  router.get('/search', async (req, res) => {
    if(req.userID != undefined){
      let user = await database.getUserFromID(req.userID);
      let posts = []
      res.status(200).render('search', {user, posts})
    }
    else{
      res.status(200).render('login', {msg:""})
    }
  })

  
router.post('/users', async (req, res) => {
    if(req.userID != undefined){
      let user = await database.getUserFromID(req.userID);
      let target = await database.getUserFromID(req.body.targetUser);
      let paramter = {user, target};
      res.status(200).render('user', paramter)
    }
    else{
      res.status(200).render('login', {msg:""})
    }
  })
  
  router.post('/read', async (req, res) => {
    if(req.userID != undefined){
      let user = await database.getUserFromID(req.userID);
      let post = await database.getPostFromID(req.body.targetPost);
      let paramter = {user, post};
      res.status(200).render('read', paramter)
    }
    else{
      res.status(200).render('login', {msg:""})
    }
  })
  
  

  
module.exports = router;