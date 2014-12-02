var ready;
ready = function() {
      var browser = {
        chrome: false,
        mozilla: false,
    };

    var sUsrAg = navigator.userAgent;
    if(sUsrAg.indexOf("Firefox") > -1) {
         $('#datepicker').datepicker();
    }
  };

$(document).ready(ready);
$(document).on('page:load', ready);
