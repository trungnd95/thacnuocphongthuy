jQuery( document ).ready(function( $ ) {
  $(".upload-image").on("change", function(){
    var hidden_el = this.parentNode.nextElementSibling.getAttribute("value");
    var pre_load =  document.querySelectorAll('.image_pre_load');
    console.log(pre_load.length);
    if(pre_load != null && pre_load.length > 0){
      pre_load = this.nextElementSibling;
      pre_load.innerHTML = "";
    }
    var preview = document.querySelector('#preview');
    preview.innerHTML = "";
    var files   = this.files;
    function readAndPreview(file) {
      if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
        var reader = new FileReader();
        reader.addEventListener("load", function () {
          var image = new Image();
          image.height = 160;
          image.width = 200;
          image.title = file.name;
          image.src = this.result;
          image.className = "thumbnail";
          image.style.display = "inline-block";
          image.style.marginRight = "10px"

          var checkbox = document.createElement('input');
          checkbox.type = "radio";
          checkbox.setAttribute('name', 'images[thumbnail]');
          checkbox.setAttribute('id', 'item_images_attributes_0_url');
          checkbox.setAttribute('value', file.name);
          if(pre_load != null && pre_load.length > 0) {
            var hidden = document.createElement('input');
            hidden.type = "hidden";
            hidden.setAttribute('name', 'images[flag][]');
            hidden.setAttribute('value', hidden_el);
            pre_load.appendChild(hidden);
            pre_load.appendChild(checkbox);
            pre_load.appendChild( image);
          }else {
            wrap = document.createElement('div');
            wrap.setAttribute('class', 'preview_each_wrap');
            wrap.appendChild(checkbox);
            wrap.appendChild( image);
            preview.appendChild(wrap);
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
