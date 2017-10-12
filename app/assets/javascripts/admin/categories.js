jQuery( document ).ready(function( $ ) {
  // Code using $ as usual goes here.
  // And document is ready too
  // $('.categories_index').on({
  //   mouseenter: function () {
  //       //stuff to do on mouse enter
  //       $(this).prev().slideToggle(1000);
  //     },
  //     mouseleave: function () {
  //       //stuff to do on mouse leave
  //       $(this).prev().slideUp(1000);
  //     }
  // }, '.cate_content'); //pass the element as an argument to .on
  $('.categories_index').on('click', '.cate_content', function(e){
    e.preventDefault();
    $(this).prev("li.action_cat_hidden").toggle(800);
  })

  $('#modal-delete-cat').on('show.bs.modal', function (event) {
    var cat_id = $(event.relatedTarget).attr('cat_id');
    // console.log(user_id);
    var modal =  $(this);
    modal.find('button.confirmed-delete-cat').attr('cat_id', cat_id)
  })
  $('.confirmed-delete-cat').on('click', function(){
    $('#modal-delete-cat').modal('hide');
    var cat_id =  parseInt($(this).attr('cat_id'));
    $.ajax({
      url: '/admin/categories/' + cat_id,
      method: 'DELETE',
      dataType: 'JSON',
      data: {id: cat_id},
      success: function(result){
        toastr['success']("Xóa thành công");
        $('.cat-' + result.id).parent().hide();
        $('#modal-delete-cat').modal('hide');
      }
    })
  });
});

