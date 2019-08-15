// when DOM is ready
$(document).ready(function () {

     // Attach Button click event listener
    $("#myBtn").click(function(){

      $('#newRestriction').replaceWith("<%= j render 'restrictions/new' %>");
         // show Modal
         $('#restrictions-form').modal('show');
    });
});
