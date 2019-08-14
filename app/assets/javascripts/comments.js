function showComments(id) {
   $("#reveal-"+id).hide();
   $("#hide-"+id).show()
   $("#comments-"+id).fadeIn(300);
}

function hideComments(id) {
   $("#hide-"+id).hide();
   $("#reveal-"+id).show();
   $("#comments-"+id).hide();
}

function postComment(id, comments) {
  if (comments) {
    $("#reveal-"+id).hide();
  }
   $("#post-comment-"+id).show();
   $("#comment__button-"+id).hide();
   $("#cancel__comment-"+id).show();
}

function cancelComment(id, comments) {
  $("#cancel__comment-"+id).hide();
  $("#post-comment-"+id).hide();
  $("#comment__button-"+id).show();
  if (comments) {
    document.getElementById("reveal-"+id).style.display = "block";
    hideComments(id);
  }
}
