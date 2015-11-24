function form_save(form) {		
		var skill_filter = new Array();
		var counter = $('#skill_counter').val();
		var is = filter([
        { target : '#member_id' , filter : 'empty' , title : '아이디' },
        { target : '#member_id' , filter : 'id' , title : '아이디' },
        { target : '#dup_ok' , filter : 'duplicate' , title : '아이디 중복여부' },
        { target : '#member_name' , filter : 'empty' , title : '이름' },
        { target : '#member_password' , filter : 'empty' , title : '패스워드' },
        { target : '#member_password' , filter : 'password' , title : '패스워드' },
        { target : '#personal_id_front' , filter : 'empty' , title : '주민번호 앞자리' },
        { target : '#personal_id_end' , filter : 'empty' , title : '주민번호 뒷자리' },
        { target : '#personal_id_front' , filter : 'number' , title : '주민번호 앞자리' },
        { target : '#personal_id_end' , filter : 'number' , title : '주민번호 뒷자리' },
        { target : '#personal_id_front' , filter : 'personal_front' , title : '주민번호 앞자리' },
        { target : '#personal_id_end' , filter : 'personal_end' , title : '주민번호 뒷자리' },
        ]);
		
		for(i=1; i<counter; i++ ){
			skill_filter.push({target : '#skill' + i, filter : 'empty', title : '기술목록'});
		}
		
		
		is = filter(skill_filter);		
		if (is == true) $(form).submit();
    }

    // 입력 항목의 체크 함수
    function filter(options) {
        var is = true;

        $(options).each(function() {
            var item = this;

            switch (item.filter) {
                case 'empty' :
                    var val = $(item.target).val();
                    if (val == '') {
                        alert(item.title + '을(를) 입력하세요.');
                        $(item.target).focus();
                        is = false;
                    }
                break;
                case 'duplicate' :
                    var val = $(item.target).val();
                    if(val == 'true'){
                    	alert(item.title + '을(를) 체크하세요');
                    	is = false;                    	
                    }                       
                              
                break;
                case 'id' :
                    var val = $(item.target).val();
                    var chk_id = /^[a-z0-9_-]{3,16}$/;
                    if(!chk_id.test(val)){
                    	alert('적절한' + item.title + '을(를) 사용하세요.');
                    	is = false;                    	
                    }                       
                              
                break;
                case 'number' :
                    var val = $(item.target).val();
                    var num_regx = /[^0-9]/;
                    if (num_regx.test(val)) {
                    alert(item.title + '을(를) 숫자만 입력하세요.');
                    $(item.target).focus();
                        is = false;
                    }
                break;
                case 'password' :
                    var val = $(item.target).val();
                    var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
                    if(!reg_pwd.test(val)){
                    alert(item.title + '을(를) 확인하세요.\n영문,숫자를 혼합하여 6~20자 이내');
                    $(item.target).focus();
                    is = false;
                    }
                break;
                case 'personal_front' :
                    var val = $(item.target).val();
                    var length = val.length;
                    if(!(length == '6')){
                    	alert(item.title + '을(를) 제대로 입력하세요');
                        $(item.target).focus();
                        is = false;
                        /*실제 주민번호의 유효성을 검사하게 될 경우 데이터 입력시
                         *어려움이 있을 수 있으므로 주민번호의 길이만을 검사함
                         */  
                    }           
                break;
                case 'personal_end' :
                    var val = $(item.target).val();
                    var length = val.length;
                    if(!(length == '7')){
                    	alert(item.title + '을(를) 제대로 입력하세요');
                        $(item.target).focus();
                        is = false;                          
                    }           
                break;
                
             
            }            
            if(is == false) return is; //중복되는 유효성 검사 제거
        });
        return is;
    }
    //아이디 중복여부 체크
    function dup_check() {
   	 var member_id = $("#member_id").val();
   	$.ajax({
           type : 'POST' ,
           url : './DupCheck' ,
           data : 'member_id=' + member_id
       }).done(function(data) {
       	var message = $(data).find("message").text();
           var error = $(data).find("error").text();
           $("#duplicateResult").text(message);
           $('#dup_ok').val(error);     
           console.log($('#dup_ok').val());
       });  
   }
   //휴대폰 자동 하이폰 부여
    
    function cell_check(){
        
    	var _val = $("#member_cellphone").val().trim();
    	$("#member_cellphone").val(autoHypenPhone(_val));
    }
   function autoHypenPhone(str){
        str = str.replace(/[^0-9]/g, '');
        var tmp = '';
        if( str.length < 4){
            return str;
        }else if(str.length < 7){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3);
            return tmp;
        }else if(str.length < 11){
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 3);
            tmp += '-';
            tmp += str.substr(6);
            return tmp;
        }else{              
            tmp += str.substr(0, 3);
            tmp += '-';
            tmp += str.substr(3, 4);
            tmp += '-';
            tmp += str.substr(7);
            return tmp;
        }
        return str;
    }
  
   

