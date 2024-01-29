const express = require('express');
const app = express.Router();

let database;
import('../database.mjs')
  .then((db) => {
    database = db;
  })
  .catch((error) => {
    console.error('Error loading database module:', error);
  });


  app.post('/search', async (req, res)=>{
    let str = req.body.str;
    let excludedIds = req.body.onscreenPosts;
    excludedIds.push('nkfkfk')
      if(req.userID != undefined){
        let posts = await database.search(str, excludedIds);
        res.status(200).json({posts})
      }
      else{
        res.status(200).render('login', {msg:""})
      }
  })
  
  
  app.post('/posts/:postId/like', async (req, res) => {
    try {
      if (req.userID == undefined) {
        return res.status(401).json({ error: 'Unauthorized' });
      }
      let x = await database.likePost(req.userID, req.params.postId)
      return res.json({updatedLikes: x.likes });
    } catch (error) {
      console.error('Error liking post:', error);
      return res.status(500).json({ error: 'Internal Server Error' });
    }
  });
  
  app.post('/users/:target/follow', async (req, res) => {
    try {
      if (req.userID == undefined) {
        return res.status(401).json({ error: 'Unauthorized' });
      }
      let x = await database.followUser(req.userID, req.params.target)
      return res.json(x);
    } catch (error) {
      console.error('Error following user:', error);
      return res.status(500).json({ error: 'Internal Server Error' });
    }
  });
    
  app.post('/posts/:postId/save', async (req, res) => {
    try {
      if (req.userID == undefined) {
        return res.status(401).json({ error: 'Unauthorized' });
      }
      let x = await database.savePost(req.userID, req.params.postId)
      return res.json(x);
    } catch (error) {
      console.error('Error saving post:', error);
      return res.status(500).json({ error: 'Internal Server Error' });
    }
  });
  
  app.post('/archive', async (req, res)=>{ 
    let  posts =[], s;
    let str = req.body.query;
    if(req.userID != undefined){
        let targetID = req.body.targetID || req.userID;
        let user = await database.getUserFromID(targetID);
        if(str == "Saved Posts") s = user.savedPosts;
        else if(str == 'Liked Posts') s = user.likedPosts;
        else if(str == 'Posts') s = user.posts
        s.forEach(element => {
          posts.push(postSplitter(element))
        });
        res.status(200).render('listPosts', {user, posts, str})
      }
      else{
        res.status(200).render('login', {msg:""})
      }
  })
  
  app.post('/connectivity', async (req, res)=>{ 
    let s;
    let str = req.body.query;
    let targetID = req.body.targetID;
      if(req.userID != undefined){
        let user = await database.getUserFromID(targetID);
        if(str == "Followers") s = user.followersList;
        else if(str == 'Following') s = user.followingList;
        res.status(200).render('listUsers', {user, s, str})
      }
      else{
        res.status(200).render('login', {msg:""})
      }
  })
  
  app.get('/loadinital', async (req, res) => {
    if (req.userID !== undefined) {
      const user = await database.getUserFromID(req.userID);
      posts =  await loadinital(user)
  
      res.status(200).json({ posts, user });
    } else {
      res.status(403).json({ error: 'Unauthorized' });
    }
  });
  
  app.post('/loadmore', async (req, res) => {
    if (req.userID !== undefined) {
      try {
        const feedNumber = req.body.feedNumber;
        const loadedPosts = req.body.loadedPosts;
        const toDeleteFromFeed = req.body.toDeleteFromFeed;
        const feed = req.body.totalFeeds;
  
        const excludedPosts = [...new Set(feed.concat(loadedPosts))];
        let rndm = await database.getRandomPosts(1, Array.from(new Set(excludedPosts)));
        let idlist = feed.slice(feedNumber, feedNumber + 1).concat(rndm);
  
        for (const postId of toDeleteFromFeed) {
          await database.dltFeed(req.userID, postId);
        }
  
        let posts = [];
        for (const id of idlist) {
          posts.push(await database.readPost(id));
        }
  
        res.status(200).json({ posts });
      } catch (error) {
        console.error('Error in loadmore:', error);
        res.status(500).json({ error: 'Internal Server Error' });
      }
    } else {
      res.status(403).json({ error: 'Unauthorized' });
    }
  });
  app.post('/loadUserPosts', async(req,res)=>{
    if(req.userID != undefined){
      if(req.body.targetUser === undefined){
        res.status(404).json({ error: 'Not an User' })
      }
      try{
        let user = await database.getUserFromID(req.body.targetUser);
        let count = req.body.counter;
        let exclude = req.body.loadedPosts;
        
        let posts = [];
        let idlist = user.posts.slice(count, count+10).filter(id => !exclude.includes(id));
        const options = { day: 'numeric', month: 'short', year: 'numeric' };
        for (const id of idlist) {
          let post = await database.readPost(id);
          post.created = post.created.toLocaleDateString('en-US', options);
          posts.push(post);
        }
        res.status(200).json({posts})
      }
      catch{
        res.status(500).json({ error: 'Internal Server Error' });
      }
    }else  res.status(200).json({posts: []})
  })
  
async function loadinital(x){
    let rndm = await database.getRandomPosts(7, x.feed);
      let Post = [];
      let idlist = x.feed.slice(0,10).concat(rndm);
      idlist = [...new Set(idlist)]
      for (const id of idlist) {
          Post.push(await database.readPost(id));
      }
      return Post;
  }

module.exports = app;

function postSplitter(postID){
  let i = postID.lastIndexOf('~');
  x ={
    postId : postID,
  title : postID.substr(i+1),
  author : postID.substr(0, i)
  }
  return x
}