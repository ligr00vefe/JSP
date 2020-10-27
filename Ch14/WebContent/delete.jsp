<%@page import="member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<% 
//파라미터 수신
		request.setCharacterEncoding("UTF-8");

		String uid  = request.getParameter("uid");
		String name = request.getParameter("name");
		String hp   = request.getParameter("hp");
		String pos  = request.getParameter("pos");
		String dep  = request.getParameter("dep");
		
	// DB정보
		String host = "jdbc:mysql://192.168.44.46:3306/kkm";
		String user = "kkm";
		String pass = "1234";
	
	// 1단계
		Class.forName("com.mysql.jdbc.Driver");
	
	// 2단계
		Connection conn = DriverManager.getConnection(host, user, pass);	
	
	// 3단계
		String sql = "SELECT * FROM `MEMBER` WHERE `uid` = ?";

		PreparedStatement psmt = conn.prepareStatement(sql);

		psmt.setString(1, uid);
		
		ResultSet rs = psmt.executeQuery(sql);
	
	// 4단계
		
		
		
	// 5단계
		MemberBean mb = new MemberBean();
		if (rs.next()){
			mb.setUid(rs.getString(1));
		}
		String dsql = "DELETE FROM `MEMBER` WHERE `uid`=?";
		
		psmt = conn.prepareStatement(dsql);
		psmt.setString(1, uid);
		psmt.executeUpdate();
	
	// 6단계
		psmt.close();
		conn.close();
	// 리다이렉트
	response.sendRedirect("./list.jsp");

%>