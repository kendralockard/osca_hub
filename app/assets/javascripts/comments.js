function showComments(id) {
   document.getElementById("reveal-"+id).style.display = "none";
   document.getElementById("hide-"+id).style.display = "block";
   document.getElementById("comments-"+id).style.padding = "0rem";
   $("#comments-"+id).fadeIn(300);
}

function hideComments(id) {
   document.getElementById("hide-"+id).style.display = "none";
   document.getElementById("reveal-"+id).style.display = "block";
   document.getElementById("comments-"+id).style.display = "none";
}

function postComment(id, comments) {
  if (comments) {
    document.getElementById("reveal-"+id).style.display = "none";
    if (document.getElementById("hide-"+id).style.display == "block") {
      document.getElementById("hide-"+id).style.display = "none";
      document.getElementById("comments-"+id).style.padding = "2rem";
    }
  }
   document.getElementById("post-comment-"+id).style.display = "block";
   document.getElementById("post__comment-"+id).style.display = "none";
   document.getElementById("cancel__comment-"+id).style.display = "inline-block";
}

function cancelComment(id, comments) {
  document.getElementById("cancel__comment-"+id).style.display = "none";
  document.getElementById("post-comment-"+id).style.display = "none";
  document.getElementById("post__comment-"+id).style.display = "inline-block";
  if (comments) {
    document.getElementById("reveal-"+id).style.display = "block";
  }
  hideComments(id);
}
