$(document).ready(function(){
	
    var counter = 1;
		
    $("#add_skill").click(function () {
				
	if(counter>10){
            alert("최대 10개까지 기술 작성이 가능합니다.");
            return false;
	}   
		
	var newskill = $(document.createElement('div'))
	     .attr("id", 'skill_div' + counter);
	newskill.attr("class", "form-group");
	newskill.after().html('<label class="col-sm-2 control-label">기술목록 #'+ counter + ' : </label>' +
	      '<input type="text" name="skill' + counter +  '" id="skill' + counter + '" value="">');
            
	newskill.appendTo("#skill_set");

				
	counter++;
	$('#skill_counter').val(counter);
     });

     $("#remove_skill").click(function () {
	if(counter==1){
          alert("제거할 목록이 없습니다.");
          return false;
       }   
        
	counter--;
			
        $("#skill" + counter).remove();
        $("#skill_div" + counter).remove();
        $('#skill_counter').val(counter);	
     });
		
     $("#form").submit(function () {
		
	var msg = '';
	for(i=1; i<counter; i++){
   	  msg += $('#skill' + i).val() + ",";
	}
		$('#member_skillset').val(msg);
     	});
  });
