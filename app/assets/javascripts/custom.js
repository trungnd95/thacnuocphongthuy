jQuery( document ).ready(function( $ ) {
  $('.current-single').click(function(e){
    e.preventDefault();
    var sectionId   = this.getAttribute('id') + 'Section';
    console.log($('#' + sectionId));
    $('html,body').animate({
      scrollTop: $('#' + sectionId).offset().top
    }, 1500);
  });
  /* BOOTSTRAP SLIDER */
  $("#ex2").slider();

})
