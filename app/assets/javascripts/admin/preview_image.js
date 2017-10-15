jQuery( document ).ready(function( $ ) {
  $(".upload-image").on("change", function(){
    var preview = document.querySelector('#preview');
    preview.innerHTML = "";
    var files   = document.querySelector('input[type=file]').files;

    function readAndPreview(file) {
      if ( /\.(jpe?g|png|gif)$/i.test(file.name) ) {
        var reader = new FileReader();
        reader.addEventListener("load", function () {
          var image = new Image();
          image.height = 180;
          image.width = 171;
          image.title = file.name;
          image.src = this.result;
          var thumbnail =  document.createElement('a');
          thumbnail.setAttribute('href', 'javasript:void(0)');
          thumbnail.setAttribute('class', 'thumbnail');
          thumbnail.appendChild(image);
          console.log(image);
          var checkbox = document.createElement('input');
          checkbox.type = "radio";
          checkbox.setAttribute('name', 'images[thumbnail][]');
          checkbox.setAttribute('id', 'item_images_attributes_0_url');
          checkbox.setAttribute('value', image.src);
          wrap = document.createElement('div');
          wrap.setAttribute('class', 'preview_each_wrap');
          wrap.appendChild(checkbox);
          wrap.appendChild( thumbnail);
          preview.appendChild(wrap);
        }, false);

        reader.readAsDataURL(file);
      }
    }
    if (files) {
      [].forEach.call(files, readAndPreview);
    }
  })
})
