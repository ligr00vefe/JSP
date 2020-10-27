
// 최종 점검을 위한 상태변수 선언
var isHpOk = false;

$(document).ready(function(){	
	
	$('input[name=hp]').focusout(function(){		
		
		var tag = $(this);
		var hp = tag.val();
		var json = {'hp' : hp}; 	
		
		
		// 모든 검증이 통과되고 통신시작
		$.ajax({
			url		 : '/Jboard1/user/proc/checkHp.jsp',
			type 	 : 'get',
			data 	 :  json,
			dataType : 'json',
			success  : function(data) {

				if(data.result == 1) {
					$('.resultHp').css('color', 'red').text("중복된 번호입니다.");
					tag.focus();
					isNickOk = false;
				}else {
					$('.resultHp').css('color', 'blue').text("사용가능한 번호입니다.");
					isNickOk = true;
				}
			}
		
		});
	});
	
	
});