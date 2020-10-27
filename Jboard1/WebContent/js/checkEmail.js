
// 최종 점검을 위한 상태변수 선언
var isEmailOk = false;

$(document).ready(function(){
	
	
	$('input[name=email]').focusout(function(){		
		
		var tag = $(this);
		var email = tag.val();
		var json = {'email' : email}; 	
		
		// 모든 검증이 통과되고 통신시작
		$.ajax({
			url		 : '/Jboard1/user/proc/checkEmail.jsp',
			type 	 : 'get',
			data 	 :  json,
			dataType : 'json',
			success  : function(data) {

				if(data.result == 1) {
					$('.resultEmail').css('color', 'red').text("이미 사용중인 이메일입니다.");
					tag.focus();
					isNickOk = false;
				}else {
					$('.resultEmail').css('color', 'blue').text("사용가능한 이메일입니다.");
					isNickOk = true;
				}
			}
		
		});
	});
	
	
});