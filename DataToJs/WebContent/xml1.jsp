<%@page contentType="text/xml;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%
	/* 
		XML(Extensible Markup Language)
		 - JSON과 더불어 서버의 데이터를 이기종간에 전송하기 위한 포맷
		 - 사용자가 직접 태그를 정의
		 - JSON보다 파싱속도가 느리다는 단점이 있어서 JSON을 더 많이 쓴다(파싱속도 - 수신측 데이터 해석속도)		 
	*/

	String xml = "<members>";
	
	xml += "<member>";	
	xml += "<uid>A101</uid>";
	xml += "<name>김유신</name>";
	xml += "<hp>010-0000-0000</hp>";
	xml += "<pos>사원</pos>";	
	xml += "</member>";
	
	xml += "<member>";	
	xml += "<uid>A102</uid>";
	xml += "<name>김춘추</name>";
	xml += "<hp>010-1111-1111</hp>";
	xml += "<pos>대리</pos>";	
	xml += "</member>";
	
	xml += "<member>";	
	xml += "<uid>A103</uid>";
	xml += "<name>강감찬</name>";
	xml += "<hp>010-2222-2222</hp>";
	xml += "<pos>과장</pos>";	
	xml += "</member>";
	
	xml += "</members>";
	
	// xml 출력
	out.print(xml);

%>