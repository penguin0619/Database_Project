function form_save(form) {		
	 var str = "";
	 var select;
	 var count = 0;
	    
	 var count = $('#list_num').val();
	    for(var i=0; i<count; i++){
	    	str +=  $('#member_no' + i).val() +":" +
	    	$('#appraiser_code' + i).val() +":" +
	    	$('#performance' + i).val() +":" +
	    	$('#communication' + i).val() + ":" +
	    	$('#detail' + i).val() + ","	    	
	    }
	    	    
	    $('#appraise_content').val(str);
	    $(form).submit();
}