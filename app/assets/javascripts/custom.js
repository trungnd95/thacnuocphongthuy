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

  /*Tab */
  // jQuery(document).ready(function(){
  $('a.moveToTab').click(function(e){
    moveToTab();
  })
  // });
  function moveToTab(){
    jQuery('dt, dd', '#collateral-tabs').each(function(){
      jQuery(this).removeClass('current');
    });
    jQuery('.product-collateral .toggle-tabs li').each(function(){
      jQuery(this).removeClass('current');
      jQuery('#reviews', this).parents('li').click();
    })
    jQuery('html, body').animate({
      scrollTop: jQuery('.product-collateral').offset().top - 80}, 'fast'
      );
  }
})
