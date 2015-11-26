$(document).ready(function(){
	$.datepicker.setDefaults({
 		dateFormat: 'yymmdd',
 		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
 	    dayNamesMin: ['일','월','화','수','목','금','토'],
 		yearRange: '1950',
 	    changeMonth: true, //월변경가능			     
 		changeYear: true, //년변경가능
 		showMonthAfterYear: true, //년 뒤에 월 표시
 	}); 
	$('.datepicker').datepicker();
    
    var counter = 1;
	
    $("#add_career").click(function () {
				
	if(counter>10){
            alert("최대 10개까지 경력 작성이 가능합니다.");
            return false;
	}
		
	var newcareer = $(document.createElement('div'))
	     .attr("id", 'career_div' + counter);
				 
	newcareer.after().html('<div><label>회사명 #'+ counter + ' : </label>' +
	      '<input type="text" name="before_company_name' + counter + 
	      '" id="before_company_name' + counter + '" value=""></div>'
	      +
	       '<div><label>직책 #'+ counter + ' : </label>' +
	      '<input type="text" name="position' + counter + 
	      '" id="position' + counter + '" value=""></div>' +
	      '<div><label>근무기간 #'+ counter + ' : </label>' +
	      '<input type="text" name="work_at_date' + counter + 
	      '" id="work_at_date' + counter + '" class="datepicker" value="">'+
	      '<span> ~ </span><input type="text" name="work_end_date' + counter + 
	      '" id="work_end_date' + counter + '" class="datepicker" value=""></div>');            
	newcareer.appendTo("#career_set");				
	counter++;
	$('#career_counter').val(counter);
	$('.datepicker').datepicker();
     });

     $("#remove_career").click(function () {
	if(counter==1){
          alert("제거할 목록이 없습니다.");
          return false;
       }   
        
	counter--;
			
        $("#career" + counter).remove();
        $("#career_div" + counter).remove();
        $('#career_counter').val(counter);
     });
		
     $("#form").submit(function () {
		
	var msg = '';
	for(i=1; i<counter; i++){
   	  msg += $('#before_company_name' + i).val() + ",";
   	  msg += $('#position' + i).val() + ",";
   	  msg += $('#work_at_date' + i).val() + ",";
   	  msg += $('#work_end_date' + i).val() + ",\n";
	}
		$('#career_content').val(msg); 
     });
     $(".datepicker").datepicker({
 		dateFormat: 'yyyymmdd',
 		monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
 	    dayNamesMin: ['일','월','화','수','목','금','토'],
 		yearRange: '1950',
 	    changeMonth: true, //월변경가능			     
 		changeYear: true, //년변경가능
 		showMonthAfterYear: true, //년 뒤에 월 표시
 	});    
 });