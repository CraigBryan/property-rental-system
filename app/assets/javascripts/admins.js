
var ready;
ready = function() {

	function disable_rent() {
		if(document.getElementById('user_max_rent').style.display=='block') 
		{
      		document.getElementById('user_max_rent').style.display='none';
    	}
	}

	function enable_rent() {
		if(document.getElementById('user_max_rent').style.display=='none') 
		{
      		document.getElementById('user_max_rent').style.display='block';
    	}
	
	}

	$("#radio0").click(disable_rent);
	$("#radio1").click(enable_rent);
	$("#radio2").click(disable_rent);

};

jQuery(document).ready(ready);
jQuery(document).on('page:load', ready);  

