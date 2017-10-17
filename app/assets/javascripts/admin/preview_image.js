jQuery( document ).ready(function( $ ) {
  $(".upload-image").on("change", function(){
    var pre_load =  document.querySelector('.image_pre_load');
    if(pre_load != null){pre_load.innerHTML = "";}
    var preview = document.querySelector('#preview');
    preview.innerHTML = "";
    var files   = document.querySelector('input[type=file]').files;

    function readAndPreview(file) {
      if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
        var reader = new FileReader();
        reader.addEventListener("load", function () {
          var image = new Image();
          image.height = 160;
          image.width = 240;
          image.title = file.name;
          image.src = this.result;
          image.class = "thumbnail";
          // var thumbnail =  document.createElement('a');
          // thumbnail.setAttribute('href', 'javasript:void(0)');
          // thumbnail.setAttribute('class', 'thumbnail');
          // thumbnail.appendChild(image);
          // console.log(image);
          var checkbox = document.createElement('input');
          checkbox.type = "radio";
          checkbox.setAttribute('name', 'images[thumbnail][]');
          checkbox.setAttribute('id', 'item_images_attributes_0_url');
          checkbox.setAttribute('value', image.src);

          if(pre_load === null) {
            wrap = document.createElement('div');
            wrap.setAttribute('class', 'preview_each_wrap');
            wrap.appendChild(checkbox);
            wrap.appendChild( image);
            preview.appendChild(wrap);
          }else {
            pre_load.appendChild(checkbox);
            pre_load.appendChild( image);
          }
        }, false);

        reader.readAsDataURL(file);
      }
    }
    if (files) {
      [].forEach.call(files, readAndPreview);
    }
  })
})
