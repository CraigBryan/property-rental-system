
var ready;
ready = function() {
	alert("HELLLOO");

  	if (document.getElementById("1").checked == true) {
		document.getElementById("user_max_rent").style.display = 'block';
	}
	else () {
		document.getElementById("user_max_rent").style.display = 'none';
	}
};

jQuery(document).ready(ready);
jQuery(document).on('page:load', ready);  

