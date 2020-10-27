
// 정규표현식
var regId    = /^[a-z]+[a-z0-9]{3,19}$/;     // 아이디 검사식		영문자만 or 영문자+숫자 and 최소 4자이상 19자 이하
var regPw    = /^[a-z0-9_-]{6,18}$/;         // 비밀번호 검사식		영문자+숫자 조합 최소 6자 이상 18자 이하
var regName  = /^[가-힣]{2,5}$/;              // 이름 유효성 검사 2~4자 사이	

//최종 점검을 위한 상태변수 선언
var isUidOk = false;

$(document).ready(function(){
	
	var alreadyCheck = false;
	
	
	$('input[name=uid]').focusout(function(){
		
		if(alreadyCheck) {
			alreadyCheck = false;
			return false;
		}
		
		var tag = $(this);
		var uid = tag.val();
		var json = {'uid' : uid}; 	
		
		/* 아이디 미입력시 체크  html->required로 대체
		if(uid == '') {
			alert("아이디를 입력하세요.");
			tag.focus();
			alreadyCheck = true;
			return false;
		} 
		*/
		
		if(regId.test(uid) == false ) {
			alert("아이디는 영어 소문자, 숫자 조합으로 최소 4자~19자여야합니다.");
			tag.focus();
			alreadyCheck = true;
			return false;
		}
		
		// 모든 검증이 통과되고 통신시작
		$.ajax({
			url		 : '/Farmstory1/user/proc/checkUid.jsp',
			type 	 : 'get',
			data 	 :  json,
			dataType : 'json',
			success  : function(data) {

				if(data.result == 1) {
					
					$('.resultId').css('color', 'red').text("이미 사용중인 아이디입니다.");
					tag.focus();
					isUidOk = false;
					
				}else {
					
					$('.resultId').css('color', 'blue').text("사용가능한 아이디입니다.");
					isUidOk = true;
					
				}
			}
		
		});
	});
	
	
});