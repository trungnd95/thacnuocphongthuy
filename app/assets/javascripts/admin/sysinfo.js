jQuery(document).ready(function($){
 $('#modal-edit-sysinfo').on('show.bs.modal', function (event) {
    var sys_id = $(event.relatedTarget).attr('sys_id');
    // console.log(user_id);
    var modal =  $(this);
    modal.find('button.confirmed-edit-sysinfo').attr('sys_id', sys_id)
  })
 $('.confirmed-edit-sysinfo').on('click', function(){
  $('#modal-edit-sysinfo').modal('hide');
  var sys_id =  parseInt($(this).attr('sys_id'));
  $.ajax({
    url: '/admin/sys_infos/' + sys_id,
    method: 'PATCH',
    dataType: 'JSON',
    data: {},
    success: function(result){
      toastr['success']("Xóa thành công");
      $('.cat-' + result.id).parent().hide();
      $('#modal-delete-cat').modal('hide');
    }
  })
});
})
