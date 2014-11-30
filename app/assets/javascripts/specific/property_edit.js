var ready;
ready = function() {

  function make_delete_clicked(index) {
    return function() {
      $("#photo_" + index + "_deleted").val("true");
      $("#photo_" + index + "_changed").val("false");
      $("#delete_label_" + index).hide();
      $("#upload_label_" + index).show();  
      $("#deleted_div_" + index).hide();
    };
  };

  function make_changed_clicked(index) {
    return function() {
      $("#photo_" + index + "_changed").val("true");
      $("#photo_" + index + "_deleted").val("false");
    };
  };

  for(var i = 0; i < 5; i++) {

    var handler = make_delete_clicked(i);
    var selector = "#delete_photo_" + i;

    $(selector).click(handler);

    handler = make_changed_clicked(i);
    selector = "#upload_photo_" + i;

    $(selector).change(handler);
  }
};

$(document).ready(ready);
$(document).on('page:load', ready);  