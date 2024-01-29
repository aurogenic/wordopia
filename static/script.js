let header = document.getElementById("headerForNav");
let headerHeight = header.clientHeight + "px";
let feed = document.getElementById("midSection");
feed.style.paddingTop = headerHeight;

// Function to like a post using Fetch API
async function likePost(postId, elmt) {
     try {
      const response = await fetch(`/posts/${postId}/like`, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
      });
      const data = await response.json();
      
       if (data.error) {
        console.log(data.error)
      } else {
        document.getElementById(elmt).innerHTML = data.updatedLikes;
      }
    } catch (error) {
      console.error('Error:', error.message);
    }
}

async function followUser(target, elmnt) {
  try {
   const response = await fetch(`/users/${target}/follow`, {
     method: 'POST',
     headers: {
       'Content-Type': 'application/json',
     },
   });
   const data = await response.json();
    if (data.error) {
     console.log(data.error)
   } else {
    try{ document.getElementById(elmnt).innerHTML = data.followersCount;} catch{}
   } 
  } catch (error) {
   console.error('Error:', error.message);
 }
}

async function savePost(postId, elmt) {
  try {
   const response = await fetch(`/posts/${postId}/save`, {
     method: 'POST',
     headers: {
       'Content-Type': 'application/json',
     },
   });
   const data = await response.json();
    if (data) {
      document.getElementById(elmt).innerHTML = 'saved';
    }else {
      document.getElementById(elmt).innerHTML = 'save';
    }
 } catch (error) {
   console.error('Error:', error.message);
 }
}

function makeVisible(id){
  document.getElementById(id).style.visibility = 'visible';
}
function makeInvisible(id){
  document.getElementById(id).style.visibility = 'hidden';
}
function toggleVisisbility(id){
  let elmnt = document.getElementById(id);
  if(elmnt.style.visibility == 'visible') elmnt.style.visibility = 'initial';
  else elmnt.style.visibility = 'visible';
}
function toggleDisplay(id){
  let elmnt = document.getElementById(id);
  if(elmnt.style.display == 'none') elmnt.style.display = 'block';
  else elmnt.style.display = 'none';
}
document.addEventListener('keydown', function(event) {
  if (event.key === 'l') {
    try{
      lighten('content')
    }
    catch(error){
    }
    try{
      lightenMultiple('.contents')
    }
    catch(error){
      console.log(error)
    }
  }
});

function lister(str){
  let RList = str.split(';');
  return RList.filter(item => item !== null && item !== undefined && item !== '');
}

function titleof(id){
  let title = 1 + id.lastIndexOf('~') ;
  return id.substr(title)
}

function filter(id){
  elmnt = document.getElementById(id);
  elmnt.value = elmnt.value.replace(/[;~'"]/g, "");
}

function lighten(id){
  let elmnt = document.getElementById(id);
  elmnt.classList.toggle('lightedText')
}
function lightenMultiple(className){
  let elmnts = document.querySelectorAll(className);
  elmnts.forEach(elmnt =>{
    elmnt.classList.toggle('lightedText')
  })
}

function createPostCard(post){
  return `
      <article class="postCard1">
          <div class="card-header">
            <div class="card-author">
                <a href="#" class="author-avatar">
                    <img src="../static/profilephoto/${post.author}.jpeg">
                </a>
                <div class="author-name">
                    <div class="author-name-prefix">Author</div>
                    <span>${post.author}</span>
                </div>
            </div>
            <p>${post.created}</p>
          </div>
          <form action="/read" method="post" class="postCard-form">
              <input type="hidden" name="targetPost" value='${post.postId}'>
              <button type="submit" class="invB">
                      <div class="extra">
                          <h2>${post.title}</h2>
                          <img src="./static/posts/${post.postId}.gif"  onerror="this.style.display = 'none'">
                          <img src="./static/posts/${post.postId}.jpeg" onerror="this.style.display = 'none'">
                          <p class="post-content">${post.content}</p>
                      </div>
                  </button>
          </form>
      </article>
  `
  }