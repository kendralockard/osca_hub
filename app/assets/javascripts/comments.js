function showComments(id) {
   document.getElementById("reveal-"+id).style.display = "none";
   document.getElementById("hide-"+id).style.display = "block";
   $("#comments-"+id).fadeIn(300);
}

function hideComments(id) {
   document.getElementById("hide-"+id).style.display = "none";
   document.getElementById("reveal-"+id).style.display = "block";
   document.getElementById("comments-"+id).style.display = "none";
}

function postComment(id) {
   document.getElementById("reveal-"+id).style.display = "none";
   document.getElementById("post-comment-"+id).style.display = "block";
   document.getElementById("post__comment-"+id).style.display = "none";
   document.getElementById("cancel__comment-"+id).style.display = "inline-block";
}

function cancelComment(id) {
  document.getElementById("cancel__comment-"+id).style.display = "none";
  document.getElementById("post-comment-"+id).style.display = "none";
  document.getElementById("post__comment-"+id).style.display = "inline-block";
  document.getElementById("reveal-"+id).style.display = "block";
}
