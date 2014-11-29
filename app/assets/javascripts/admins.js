var ready;
ready = function() {

  	if (document.getElementById(1).checked == true) {
		document.getElementById("customer_name").style.display = 'block';
	}
	else () {
		document.getElementById("customer_name").style.display = 'none';
	}
};

jQuery(document).ready(ready);
jQuery(document).on('page:load', ready);  

