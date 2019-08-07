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

function postComment(id, comments) {
  if (comments) {
    document.getElementById("reveal-"+id).style.display = "none";
    if (document.getElementById("hide-"+id).style.display == "block") {
      document.getElementById("hide-"+id).style.display = "none";
    }
  }
   document.getElementById("post-comment-"+id).style.display = "block";
   document.getElementById("comment__button-"+id).style.display = "none";
   document.getElementById("cancel__comment-"+id).style.display = "inline-block";
}

function cancelComment(id, comments) {
  document.getElementById("cancel__comment-"+id).style.display = "none";
  document.getElementById("post-comment-"+id).style.display = "none";
  document.getElementById("comment__button-"+id).style.display = "inline-block";
  if (comments) {
    document.getElementById("reveal-"+id).style.display = "block";
    hideComments(id);
  }
}
