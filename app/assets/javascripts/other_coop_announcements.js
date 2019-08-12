function show_other_coop(coop_id) {
  document.getElementById('announcements').style.display = "none";
  document.getElementById('announcement-header').style.display = "none";
  for (id = 2; id < 7; id++) {
    if (document.getElementById('other-announcements-'+id).style.display = "block") {
      document.getElementById('other-announcements-'+id).style.display = "none";
    }
  }
  document.getElementById('other-announcements-'+coop_id).style.display = "block";
}
