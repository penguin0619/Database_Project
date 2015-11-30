function form_approval(form) {		
		var is = filter([
        { target : '#opinion' , filter : 'empty' , title : '의견' },
        ]);
		
		if (is == true){
			$('#select').val("Y");
			alert("결재완료");
			$(form).submit();
		}
}
function form_refusal(form) {		
	var is = filter([
    { target : '#opinion' , filter : 'empty' , title : '의견' },
    ]);
	
	if (is == true){
		$('#select').val("N");
		alert("결재완료")
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