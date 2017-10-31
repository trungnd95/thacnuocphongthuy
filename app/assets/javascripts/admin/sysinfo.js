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
    var hotline =  $('#sys-hotline').val().trim();
    var address =  $('#sys-address').val().trim();
    var about_us = $('#sys-about-us').val().trim();
    var facebook_link =  $('#sys-facebook-link').val().trim();
    var email = $('#sys-email').val().trim();
    $.ajax({
      url: '/admin/sys_infos/' + sys_id,
      method: 'PATCH',
      dataType: 'JSON',
      data: {sys_id: sys_id, sys_info: {hotline: hotline, address: address, about_us: about_us,
            facebook_page_url: facebook_link, email} },
      success: function(result){
        console.log(result.content);
        toastr['success']("Sửa đổi thành công");
        $('#sys_info_content').html(result.content);
      },
      error: function(xhr){
        errors = $.parseJSON(xhr.responseText);
        for(var key in errors) {
          toastr["error"](key + '   ' + errors[key]);
        }
      }
    })
  });
})
