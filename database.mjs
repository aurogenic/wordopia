import mysql from 'mysql2'
import dotenv from 'dotenv'
dotenv.config()

const pool = mysql.createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE
}).promise()

export async function createUser(id, name, emailID, password, date) {
  try {
      await pool.query(
          `
          INSERT INTO userstable (userID, name, emailID, password, followersCount, followingCount, postCount, posts, createdDate, feed, likedPosts, followersList, followingList, savedPosts) 
          VALUES (?, ?, ?, ?, 0, 0, 0, '[]', ?, '[]', '[]', '[]', '[]', '[]')
          `,
          [id, name, emailID, password, date]
      );
  } catch (error) {
      console.error('Error creating user:', error.message);
      throw error; // Re-throw the error to handle it in the calling code
  }
}

export async function createPost(title, author, content){
    let postid = author + '~' + title;
    try {
        const [searchResult] = await pool.query(
            'SELECT JSON_UNQUOTE(JSON_SEARCH(posts, "one", ?)) AS jsonPath FROM userstable WHERE userID = ?',
            [postid, author]
          );
          if (searchResult[0].jsonPath) {
            return -1;
          }
        else {
          await pool.query(`
          INSERT INTO poststable (postId, title, author, content, likes, likedUsers)
          VALUES (?, ?, ?, ?, 0, '[]')
          `, [postid, title, author, content])
          await pool.query(`
              UPDATE userstable SET posts = JSON_ARRAY_INSERT(posts, '$[0]', ?) WHERE userID = ?
              `, [postid, author])
          await pool.query(`
          UPDATE userstable SET postCount = postCount + 1 where userID = ?
          `, [author])
          return 0;
        }
    } catch(err){
        console.log("err in database: " + err.message)
        return 1
    }
}
export async function getuser(id){
    let [result] = await pool.query(` 
    SELECT * FROM userstable WHERE emailID = ?
    `, [id])
    return result[0];
}
export async function getUserFromID(id){
    let [result] = await pool.query(` 
    SELECT * FROM userstable WHERE userID = ?
    `, [id])
    return result[0];  
}
let a = await getUserFromID('test1')

export async function getUserFromEmail(email){
    let [result] = await pool.query(`
        SELECT userID FROM userstable WHERE emailID = ?
    `, [email])
    return result[0]
}
export async function getPostFromID(id){
    let [result] = await pool.query(` 
    SELECT * FROM poststable WHERE postID = ?
    `, [id])
    return result[0];  
}
export async function readPost(id){
    let [result] = await pool.query(`
    Select * FROM poststable WHERE PostId = ?
    `, [id])
    if(result[0]){
    let [AFC] = await pool.query(`
    SELECT followersCount FROM userstable WHERE userID = ?
    `, [result[0].author])
    if(AFC != [])
        result[0].followersCount = AFC[0].followersCount;
    }
    return result[0];
}
export async function login(id, password){
    let user = await getuser(id);
    if(password == user.password){
        return user; 
    }
    else console.log('not an user')
}
export async function getAuthor(postID){
    let [result] = await pool.query(`
        SELECT author FROM poststable WHERE postID = ?
    `, [postID])
    return result[0]
}
export async function addToFeed(upt, user){
    const [searchResult] = await pool.query(
        'SELECT JSON_UNQUOTE(JSON_SEARCH(feed, "one", ?)) AS jsonPath FROM userstable WHERE userID = ?',
        [upt, user]
      );
      if (searchResult[0].jsonPath) {
        await pool.query(
            'UPDATE userstable SET feed = JSON_ARRAY_INSERT(feed,"$[0]", ?) WHERE userID = ?',
            [searchResult[0].jsonPath, user]
          );
        }
}
export async function updateFeed(upt){
    let [list] = await pool.query(`
    SELECT userID FROM userstable
    `)
    list.forEach(async user => {
      const [searchResult] = await pool.query(
          'SELECT JSON_UNQUOTE(JSON_SEARCH(feed, "one", ?)) AS jsonPath FROM userstable WHERE userID = ?',
          [upt, user.userID]
        );
      if (!searchResult[0].jsonPath) {
        await pool.query(
            'UPDATE userstable SET feed = JSON_ARRAY_INSERT(feed,"$[0]", ?) WHERE userID = ?',
            [upt, user.userID]
          );
      }
    }

    )
}
export async function dltFeed(userID, postID){
    try{
        const [searchResult] = await pool.query(
            'SELECT JSON_UNQUOTE(JSON_SEARCH(feed, "one", ?)) AS jsonPath FROM userstable WHERE userID = ?',
            [postID, userID]
          );
          if (searchResult[0].jsonPath) {
            await pool.query(
              'UPDATE userstable SET feed = JSON_REMOVE(feed, ?) WHERE userID = ?',
              [searchResult[0].jsonPath, userID]
            );
            return true;
          } else {
            return false;
          }
    }
    catch(e) {
         console.error("error :",e.message)
    }
}
export async function dltPostFeed(postID){
  let [users] = await pool.query(`
  SELECT userID FROM userstable
  `);
  users.forEach(async user => {

    try{
      const [searchResult] = await pool.query(
        'SELECT JSON_UNQUOTE(JSON_SEARCH(feed, "one", ?)) AS jsonPath FROM userstable WHERE userID = ?',
        [postID, user.userID]
        );
        if (searchResult[0].jsonPath) {
          await pool.query(
            'UPDATE userstable SET feed = JSON_REMOVE(feed, ?) WHERE userID = ?',
            [searchResult[0].jsonPath, user.userID]
            );
          }
        }
        catch(e) {
          console.error("error :",e.message)
        }
      })
}
export async function likePostPostSide(userID, postID){
    try{
        const [searchResult] = await pool.query(
            'SELECT JSON_UNQUOTE(JSON_SEARCH(likedUsers, "one", ?)) AS jsonPath FROM poststable WHERE postId = ?',
            [userID, postID]
          );
          if (searchResult[0].jsonPath) {
            await pool.query(
              'UPDATE poststable SET likedUsers = JSON_REMOVE(likedUsers, ?) WHERE postId = ?',
              [searchResult[0].jsonPath, postID]
            );
            await pool.query(`
            UPDATE poststable SET likes = likes - 1 WHERE (postId = ?)
            `, [ postID])
    
            return false;
          } else {
            await pool.query(`
            UPDATE poststable SET likedUsers = JSON_ARRAY_INSERT(likedUsers, '$[0]', ?) WHERE postId = ?
            `, [userID, postID])
            await pool.query(`
            UPDATE poststable SET likes = likes + 1 WHERE (postId = ?)
            `, [postID])
    
            return true;
          }
    }
    catch(e) { console.error("error:",e.message)}
}

export async function likePostUserSide(userID, postID){
    try{
        await dltFeed(userID, postID)
        const [searchResult] = await pool.query(
            'SELECT JSON_UNQUOTE(JSON_SEARCH(likedPosts, "one", ?)) AS jsonPath FROM userstable WHERE userID = ?',
            [postID, userID]
          );
          if (searchResult[0].jsonPath) {
            await pool.query(
              'UPDATE userstable SET likedPosts = JSON_REMOVE(likedPosts, ?) WHERE userID = ?',
              [searchResult[0].jsonPath, userID]
            );
            return false;
          } else {
            await pool.query(`
            UPDATE userstable SET likedPosts = JSON_ARRAY_INSERT(likedPosts, '$[0]', ?) WHERE userID = ?
            `, [postID,  userID])
            return true;
          }
    }
    catch(e) {
         console.error("error:",e.message)
    }
}

export async function likePost(userID, postID){
    try{ 
        await likePostUserSide(userID, postID)
        await likePostPostSide(userID, postID)
    }
    catch(error){
        console.log('error liking post :' + error.message)
    }
    finally{
    let [result] = await pool.query(`
        SELECT likes FROM poststable WHERE postId = ?
    `, [postID])
    return result[0]
    }
}

export async function followUserAuthorSide(reader, author){
    try{
        const [searchResult] = await pool.query(
            'SELECT JSON_UNQUOTE(JSON_SEARCH(followersList, "one", ?)) AS jsonPath FROM userstable WHERE userID = ?',
            [reader, author]
          );
          
          if (searchResult[0].jsonPath) {
            await pool.query(
              'UPDATE userstable SET followersList = JSON_REMOVE(followersList, ?) WHERE userID = ?',
              [searchResult[0].jsonPath, author]
            );
            await pool.query(`
            UPDATE userstable SET followersCount = followersCount - 1 WHERE (userID = ?)
            `, [ author])
            return false;
          } else {
            await pool.query(`
            UPDATE userstable SET followersList = JSON_ARRAY_INSERT(followersList, '$[0]', ?) WHERE userID = ?
            `, [reader,author])
            await pool.query(`
            UPDATE userstable SET followersCount = followersCount + 1 WHERE (userID = ?)
            `, [author])
            return true;
          }
    }
    catch(e) { console.error("error1:",e.message)}
}
export async function followUserReaderSide(reader, author){
    try{
        const [searchResult] = await pool.query(
            'SELECT JSON_UNQUOTE(JSON_SEARCH(followingList, "one", ?)) AS jsonPath FROM userstable WHERE userID = ?',
            [author, reader]
          );
          if (searchResult[0].jsonPath) {
            await pool.query(
              'UPDATE userstable SET followingList = JSON_REMOVE(followingList, ?) WHERE userID = ?',
              [searchResult[0].jsonPath, reader]
            );
            await pool.query(`
            UPDATE userstable SET followingCount = followingCount - 1 WHERE (userID = ?)
            `, [ reader])
    
            return false;
          } else {
            await pool.query(`
            UPDATE userstable SET followingList = JSON_ARRAY_INSERT(followingList, '$[0]', ?) WHERE userID = ?
            `, [author,reader])
            await pool.query(`
            UPDATE userstable SET followingCount = followingCount + 1 WHERE (userID = ?)
            `, [reader])
            return reader;
          }
    }
    catch(e) { console.error("error2:",e.message)}
}
export async function followUser(reader, author){
    try{ 
        await followUserAuthorSide(reader, author)
        await followUserReaderSide(reader, author)
    }
    catch(error){
        console.log('error following :' + error.message)
    }
    finally{
    let [result] = await pool.query(`
        SELECT followersCount FROM userstable WHERE userID = ?
    `, [author])
    return result[0]
    }
}

export async function savePost(userID, postID){
    
    try{
        await dltFeed(userID, postID)
        const [searchResult] = await pool.query(
            'SELECT JSON_UNQUOTE(JSON_SEARCH(savedPosts, "one", ?)) AS jsonPath FROM userstable WHERE userID = ?',
            [postID, userID]
          );
          if (searchResult[0].jsonPath) {
            await pool.query(
              'UPDATE userstable SET savedPosts = JSON_REMOVE(savedPosts, ?) WHERE userID = ?',
              [searchResult[0].jsonPath, userID]
            );
            return false;
          } else {
            await pool.query(`
            UPDATE userstable SET savedPosts = JSON_ARRAY_INSERT(savedPosts, '$[0]', ?) WHERE userID = ?
            `, [postID,  userID])
            return true;
          }
    }
    catch(e) {
         console.error("error saving:",e.message)
    }
}
export async function search(term, excludedIds) {
  try {
      term = '%' + term + '%';
      let [topLikesResult] = await pool.query(`
          SELECT * FROM poststable
          WHERE postId LIKE ?
          AND postId NOT IN (?)
          ORDER BY likes DESC
          LIMIT 7
      `, [term, excludedIds]);
      
      topLikesResult.forEach(post => {
        excludedIds.push(post.postId)
      })
      let randomResult = [];
      if(excludedIds != []){
        [randomResult] = await pool.query(`
        SELECT * FROM poststable
        WHERE postId LIKE ?
        AND postId NOT IN (?)
        ORDER BY RAND()
        LIMIT 7
        `, [term, excludedIds]);
      }
        
      let result = [...topLikesResult, ...randomResult];
      return result;
  } catch (error) {
      console.log(error.message);
      return [];
  }
}

export async function getRandomPosts(count, excludedPostIds = []) {
  let fin = [];

  let sqlQuery = `
      SELECT postId FROM poststable
      ORDER BY RAND()
      LIMIT ?
  `;

  if (excludedPostIds.length > 0) {
      // Generate placeholders for the excludedPostIds in the SQL query
      const placeholders = excludedPostIds.map(() => '?').join(', ');

      // Append the NOT IN clause to the query
      sqlQuery = `
          SELECT postId FROM poststable
          WHERE postId NOT IN (${placeholders})
          ORDER BY RAND()
          LIMIT ?
      `;
  }

  let [result] = await pool.query(sqlQuery, [...excludedPostIds, count]);

  result.forEach(element => {
      fin.push(element.postId);
  });

  return fin;
}
async function getusers(){
    let [result] = await pool.query("SELECT * FROM userstable");
    return result;
}
async function getposts(){
    let [result] = await pool.query("SELECT * FROM poststable");
    return result;
}