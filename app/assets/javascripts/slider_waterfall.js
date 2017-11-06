jQuery(document).ready(function($){

  $(".content-slider").lightSlider({
    loop:true,
    autoWidth: true,
    keyPress:true,
    speed: 2000, //ms'
    auto: true,
    loop: true,
    slideEndAnimation: false,
    adaptiveHeight: true,
    useCSS: true
  });

  $(window).on('resize', function(){
    if($(this).width() <= 600) {
        $('#content-slider').removeClass('content-slider');
    }
  })

  $('#oil-slider').lightSlider({
    loop: true,
    keyPress: true,
    speed: 2000, //ms'
    auto: true,
    loop: true,
    slideEndAnimation: false
  });
  $('.swipe-carousel').lightSlider({
    loop: true,
    keyPress: true,
    speed: 2000, //ms'
    auto: true,
    loop: true,
    slideEndAnimation: false
  });
  $('.up-sell-carousel-1').lightSlider({
    loop: true,
    keyPress: true,
    speed: 2000, //ms'
    auto: true,
    loop: true,
    slideEndAnimation: false
  });
})
