// 정규표현식 이름검증
	    var regName  = /^[가-힣]{2,5}$/;              // 이름 유효성 검사 2~4자 사이	
	    
	    var isNameOk = false;
	    
		$(function(){
			
			
			
			// 비밀번호 일치여부 확인
			$('input[name=name]').focusout(function(){
				
				var name = $(this).val();
				
				if(regName.test(name) == false) {
					alert("이름은 한글로 2자이상 최대 5자까지 입력하셔야 합니다.");
					return false;
					
				}else {
					
					isNameOk = true;
				}
								
			});
			
		});