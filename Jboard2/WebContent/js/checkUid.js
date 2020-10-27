// 폼 검증에 사용할 상태 변수
var isUidOk = false;

// 아이디 중복체크 
$(document).ready(function(){
	
	var inputUid = $('input[name=uid]');
	
	inputUid.focusout(function(){
	
		var uid = $(this).val();
		
		$.ajax({
			url : '/Jboard2/user/checkUid.do?uid='+uid,
			type : 'get',
			/* data : '', 파라미터 값으로 붙여서 보내면되기 때문에 전송 데이터 값은 필요 없음 */
			dataType : 'json',
			success : function(data){
				
				if(data.result == 1) {
					$('.resultId').css('color', 'red').text('이미 사용 중인 아이디입니다.');
					isUidOk = false;
				}else {
					$('.resultId').css('color', 'green').text('사용할 수 있는 아이디입니다.');
					isUidOk = true;
				}
			}    				
		});
	});    		    		
});