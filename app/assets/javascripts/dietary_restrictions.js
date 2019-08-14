function show_restrictions_form() {
  $('#add-restrictions-btn').hide();
  $('#cancel-restrictions-btn').show();
  $("#restrictions-form").show();
}

function hide_restrictions_form() {
  $('#cancel-restrictions-btn').hide();
  $('#add-restrictions-btn').show();
  $("#restrictions-form").hide();
}
