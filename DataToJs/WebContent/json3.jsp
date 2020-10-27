<%@page import="com.google.gson.JsonObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8" %>
<% 
	request.setCharacterEncoding("utf-8");

	String uid  = request.getParameter("uid");
	String name = request.getParameter("name");
	String hp   = request.getParameter("hp");
	String age  = request.getParameter("age");
	
	Connection conn = DBConfig.getConnection();
	Statement stmt = conn.createStatement();
	
	String sql = "INSERT INTO `USER3` VALUES ('"+uid+"', '"+name+"', '"+hp+"', '"+age+"')";
	
	int result = 0;
	try{
		
		result = stmt.executeUpdate(sql);
		
		stmt.close();
		conn.close();
	
	}catch(Exception e){
		
		e.printStackTrace();
		
	}finally {	// 무조건 출력
		
		// out.print("{\"result\":\""+result+"\"}");
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		out.print(json);
	}
	

%>