var ready;
ready = function() {

  function delete_clicked(i) {
    console.log("deleted", i, "clicked");
  };

  function change_clicked(i) {
    console.log("changed", i, "clicked");
  };

  jQuery("#delete_photo_0").click(console.log("clicked"));
};

jQuery(document).ready(ready);
jQuery(document).on('page:load', ready);  