const express = require('express')
const app  = express.Router();

const path = require('path');
const multer = require('multer')

let database;
import('../database.mjs')
  .then((db) => {
    database = db;
  })
  .catch((error) => {
    console.error('Error loading database module:', error);
  });

  
//mutler storage middleware
const storage1 = multer.diskStorage({
    destination : function(req, file, cb){
      return cb(null, './static/profilephoto');
    },
    filename: function(req, file, cb){
      return cb(null, `${req.userID}.jpeg`);
    }
   });
const uploadDP = multer({storage: storage1});
  
const storage2 = multer.diskStorage({
    destination : function(req, file, cb){
      return cb(null, './static/posts');
    },
    filename: function(req, file, cb){
      let title = req.body.title.replace(/[;|~'"]/g, "");
      if(title == '') title = 'title'
      title = req.userID + '~' + title;
      const ext = path.extname(file.originalname).toLowerCase();
      if (ext === '.jpeg' || ext === '.jpg' || ext === '.png') {
        return cb(null, `${title}.jpeg`);
      } else if (ext === '.gif') {
        return cb(null, `${title}.gif`);
      } else {
        // Handle unsupported file types
        cb(new Error('Unsupported file type'));
      }
    }
   });
const uploadPost = multer({storage: storage2});


app.post("/uploadDP", uploadDP.single("reqDP"), async (req, res) => {
    res.redirect('/profile')
});

app.post('/write', uploadPost.single("reqpost"), async (req, res)=>{
    let r = req.body;
      if(req.userID != undefined){
        let x = await database.getUserFromID(req.userID);
        r.title = r.title.replace(/[;~'"]/g, "")
        if(r.title == '') r.title = "title";
        let p = x.userID + "~" + r.title;
        let a = await database.getAuthor(p);
        if(a == undefined){
          await database.createPost(r.title, x.userID, r.content);
          await database.updateFeed(p);
          res.status(200).render('write', x)
        }else{
          res.status(200).render('write', x)
        }
      }
      else{
        res.status(200).render('login', {msg:""})
      }
  })
  


module.exports = app;