function form_save(form) {		
		var is_ajax;		
		var is = filter([
        { target : '#project_name' , filter : 'empty' , title : '프로젝트명' },
        { target : '#project_company_name' , filter : 'empty' , title : '회사명' },
        { target : '#project_hope_start_date' , filter : 'empty' , title : '프로젝트 시작희망날짜' },
        { target : '#project_hope_end_date' , filter : 'empty' , title : '프로젝트 종료희망날짜' },
        { target : '#project_hope_start_date' , filter : 'date' , title : '프로젝트 시작희망날짜' },
        { target : '#project_hope_end_date' , filter : 'date' , title : '프로젝트 종료희망날짜' },
        { target : '#project_postcode' , filter : 'empty' , title : '우편번호' },
        { target : '#project_address' , filter : 'empty' , title : '주소' },
        { target : '#project_address_detail' , filter : 'empty' , title : '상세주소' },
        { target : '#project_contents' , filter : 'empty' , title : '프로젝트 세부사항' },
        
        ]);
		if (is == true){
			alert("프로젝트 요청완료")
			$(form).submit();
		}
}
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
        }            
        if(is == false) return is; //중복되는 유효성 검사 제거
    });
    return is;
}