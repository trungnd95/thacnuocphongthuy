jQuery(document).ready(function($){
   $('#guest_feedback').on('submit', function(e){
    e.preventDefault();
    var email = $(this).find("input[type='email']").val().trim();
    var content =  $(this).find("textarea").val().trim();
    $.ajax({
      url: '/feedbacks',
      method: 'POST',
      dataType: 'JSON',
      data: {feedback: {email: email, content: content}},
      success: function(result){
        toastr['success']("Phản hồi của bạn đã được ghi lại. Chúng tôi chân thành \
             cám ơn những đóng góp quý báu này. Ban quản trị sẽ liên lạc với bạn \
             trong thời gian sớm nhất !");
        $('#guest_feedback')[0].reset();
      },
      error: function(xhr){
        errors = $.parseJSON(xhr.responseText);
        for(var key in errors) {
          if(key.includes('content'))
            toastr["error"]("Không thành công. Nội dung quá ngắn. Bạn đang muốn spam trang web sao???");
        }
      }
    })
  });
})
