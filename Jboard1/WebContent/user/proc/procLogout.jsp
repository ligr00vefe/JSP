<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%

	// 세션정보 초기화
	session.invalidate();

	// 세션정보 초기화 다른 방법
	// session.setAttribute("member", null);
	
	// 로그인 이동
	response.sendRedirect("/Jboard1/user/login.jsp");

%>