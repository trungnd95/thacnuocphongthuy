jQuery( document ).ready(function( $ ) {
  $('.promo').on('click', '.promo_add', function(){
    $(this).siblings().removeClass('hidden');
  })
  $('#list_items').DataTable({
    'paging'      : true,
    'lengthChange': false,
    'searching'   : true,
    'ordering'    : true,
    // 'info'        : true,
    'autoWidth'   : false
  })
})
