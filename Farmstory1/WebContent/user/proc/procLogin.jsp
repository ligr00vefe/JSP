<%@page import="kr.co.farmstory1.config.SQL"%>
<%@page import="kr.co.farmstory1.config.DBConfig"%>
<%@page import="kr.co.farmstory1.bean.MemberBean"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");

	String uid  = request.getParameter("uid");
	String pass = request.getParameter("pass");
	
	/* DB정보, 1단계, 2단계는 DBConfig로 대체
		// DB정보
			String host="jdbc:mysql://192.168.44.46:3306/kkm";
			String user="kkm";
			String pass="1234";
			
		// 1단계
			Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);
	*/
	
	// 1, 2단계
		Connection conn = DBConfig.getConnection();	
	
	// 3단계
		PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_MEMBER);
		psmt.setString(1, uid);
		psmt.setString(2, pass);
	
	// 4단계
		ResultSet rs = psmt.executeQuery();
	
	// 5단계
		if(rs.next()) {
			// 회원일 경우
			MemberBean mb = new MemberBean();
			mb.setUid(rs.getString(1));
			mb.setPass(rs.getString(2));
			mb.setName(rs.getString(3));
			mb.setNick(rs.getString(4));
			mb.setEmail(rs.getString(5));
			mb.setHp(rs.getString(6));
			mb.setGrade(rs.getInt(7));
			mb.setZip(rs.getString(8));
			mb.setAddr1(rs.getString(9));
			mb.setAddr2(rs.getString(10));
			mb.setRegip(rs.getString(11));
			mb.setRdate(rs.getString(12));
			
			// 세션에 사용자 정보객체 지정
			session.setAttribute("member", mb);
			
			// 리스트 이동
			response.sendRedirect("/Farmstory1/index.jsp");
			
			/*
			session.setAttribute("uid", rs.getString(1));
			session.setAttribute("pass", rs.getString(2)); 
			session.setAttribute("name", rs.getString(3)); 
			session.setAttribute("nick", rs.getString(4)); 
			session.setAttribute("email", rs.getString(5)); 
			session.setAttribute("hp", rs.getString(6)); 
			session.setAttribute("grade", rs.getInt(7)); 
			session.setAttribute("zip", rs.getString(8)); 
			session.setAttribute("addr1", rs.getString(9)); 
			session.setAttribute("addr2", rs.getString(10)); 
			session.setAttribute("regip", rs.getString(11)); 
			session.setAttribute("rdate", rs.getString(12)); 
			
			*/
			
		}else {
			// 회원이 아닐 경우 다시 로그인 페이지로 이동
			response.sendRedirect("/Farmstory1/user/login.jsp?result=fail");	// ?뒤는 파라미터 값(결과값을 갖고 페이지 이동)		
		}
	
	// 6단계
		rs.close();
		psmt.close();
		conn.close();
	

%>