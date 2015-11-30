function form_save(form) {		
	 var str = "";
	 var select;
	    $("input:checkbox:checked").each(function (index) {  
	        select = $(this).val()
	    	str += $(this).val() + ":" + $('#' + select).val() +",";   
	    });  
	    $('#add_list').val(str);
	$(form).submit();
}