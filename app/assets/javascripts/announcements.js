function show_other_coop(coop_id) {
  $('#announcements').hide();
  $('#announcement-header').hide();
  for (id = 2; id < 7; id++) {
    if (document.getElementById('other-announcements-'+id).style.display == "block") {
      $('#other-announcements-'+id).hide();
    }
  }
  $('#other-announcements-'+coop_id).show();
}

function show_attachment_upload() {
  $('.paperclip').hide();
  document.getElementById('announcement_attachment').click();
  $('#announcement_attachment').show();
}
