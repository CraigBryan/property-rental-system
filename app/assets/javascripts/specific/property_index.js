var ready;
ready = function() {
  $('.photo-image').magnificPopup({
    type: 'image',
    closeOnContentClick: true,
    closeBtnInside: false,
    fixContentPos: true,
    mainClass: 'mfp-no-margins mfp-with-zoom',
    image : {
      verticalFit: true,
      horizontalFit: true
    },
    zoom: {
      enabled: true,
      duration: 300
    }
  });

};

$(document).ready(ready);
$(document).on('page:load', ready);  