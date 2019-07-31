$( document ).on('turbolinks:load', function() {
  if( /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent) ) {
      $('[data-toggle="popover"]').popover('disable');
    }
  else {
    $('[data-toggle="popover"]').popover({
      trigger: 'hover',
      html: true,
    });
  }
});
