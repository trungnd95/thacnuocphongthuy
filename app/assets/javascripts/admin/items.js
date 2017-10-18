jQuery( document ).ready(function( $ ) {
  $('#modal-delete-image').on('show.bs.modal', function (event) {
    var img_id = $(event.relatedTarget).data('id');
    var url = $(event.relatedTarget).attr('href');
    // console.log(user_id);
    var modal =  $(this);
    modal.find('button.confirmed-delete-image').attr('img_id', img_id)
  })
  $('.confirmed-delete-image').on('click', function(){
    $('#modal-delete-image').modal('hide');
    var img_id =  parseInt($(this).attr('img_id'));
    $.ajax({
      url: '/admin/images/' + img_id,
      method: 'DELETE',
      dataType: 'JSON',
      data: {id: img_id},
      success: function(result){
        toastr['success']("Xóa thành công");
        $('.delete_img_' + result.id).parent().parent().slideUp();
      }
    })
  });

  $('#modal-del-item').on('show.bs.modal', function (event) {
    var item_id = $(event.relatedTarget).data('id');
    // console.log(user_id);
    var modal =  $(this);
    modal.find('button.confirmed-del-item').attr('item_id', item_id)
  })
  $('.confirmed-del-item').on('click', function(){
    $('#modal-del-item').modal('hide');
    var item_id =  parseInt($(this).attr('item_id'));
    $.ajax({
      url: '/admin/items/' + item_id,
      method: 'DELETE',
      dataType: 'JSON',
      data: {id: item_id},
      success: function(result){
        toastr['success']("Xóa thành công");
        $('.del_item_' + result.id).parent().parent().slideUp();
      }
    })
  });
});
