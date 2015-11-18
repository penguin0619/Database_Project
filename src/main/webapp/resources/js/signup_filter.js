function form_save(form) {
        var is = filter([
        { target : '#member_id' , filter : 'empty' , title : '아이디' },
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

        if (is == true) jQuery(form).submit();
    }

    // 입력 항목의 체크 함수
    function filter(options) {
        var is = true;

        jQuery(options).each(function() {
            var item = this;

            switch (item.filter) {
                case 'empty' :
                    var val = jQuery(item.target).val();
                    if (val == '') {
                        alert(item.title + '을(를) 입력하세요.');
                        jQuery(item.target).focus();
                        is = false;
                    }
                break;

                case 'number' :
                    var val = jQuery(item.target).val();
                    var num_regx = /[^0-9]/;
                    if (num_regx.test(val)) {
                    alert(item.title + '을(를) 숫자만 입력하세요.');
                    jQuery(item.target).focus();
                        is = false;
                    }
                break;
                case 'password' :
                    var val = jQuery(item.target).val();
                    var reg_pwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
                    if(!reg_pwd.test(val)){
                    alert(item.title + '을(를) 확인하세요.\n영문,숫자를 혼합하여 6~20자 이내');
                    jQuery(item.target).focus();
                    is = false;
                    }
                break;
                case 'personal_front' :
                    var val = jQuery(item.target).val();
                    var length = val.length;
                    if(!(length == '6')){
                    	alert(item.title + '을(를) 제대로 입력하세요');
                        jQuery(item.target).focus();
                        is = false;
                        /*실제 주민번호의 유효성을 검사하게 될 경우 데이터 입력시
                         *어려움이 있을 수 있으므로 주민번호의 길이만을 검사함
                         */  
                    }           
                break;
                case 'personal_end' :
                    var val = jQuery(item.target).val();
                    var length = val.length;
                    if(!(length == '7')){
                    	alert(item.title + '을(를) 제대로 입력하세요');
                        jQuery(item.target).focus();
                        is = false;                          
                    }           
                break;
             
            }            
            if(is == false) return is; //중복되는 유효성 검사 제거
        });
        return is;
    }

