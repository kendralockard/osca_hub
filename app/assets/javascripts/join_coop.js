$( document ).on('turbolinks:load', function() {
  $('#joinCoopModal').modal('hide');
  $(document.body).removeClass('modal-open');
  $('.modal-backdrop').remove();
  $('#joinCoopModal').modal();
  $('#joinCoopTitle').html("Join a Co-op");
  $('#joinCoopMessage').html("Select your co-op and click \"Request to Join\" \
                              to send a request to your MemCo. You will be \
                              notified by email when your request is approved."
                            );
});
