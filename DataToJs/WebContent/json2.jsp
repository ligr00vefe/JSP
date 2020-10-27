<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.Connection"%>
<%@page import="config.DBConfig"%>
<%@page import="java.sql.Statement"%>
<%@page import="bean.MemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	// DB에서 데이터 가져오기
	Connection conn = DBConfig.getConnection();
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery("SELECT * FROM `MEMBER`");

	List<MemberBean> memberList = new ArrayList<>();
	// String json = "[";
	
	while(rs.next()) {
		
		/* 
		json += "{";
		json += "\"uid\":"rs.getString(1)+", ";
		json += "\"uid\":"rs.getString(2)+", ";
		json += "\"uid\":"rs.getString(3)+", ";
		json += "\"uid\":"rs.getString(4)+", ";
		json += "\"uid\":"rs.getInt(5)+", ";
		json += "\"uid\":"rs.getString(6)+"";
		json += "}"; 
		*/
	
		MemberBean mb = new MemberBean();
		
		mb.setUid(rs.getString(1));
		mb.setName(rs.getString(2));
		mb.setHp(rs.getString(3));
		mb.setPos(rs.getString(4));
		mb.setDep(rs.getInt(5));
		mb.setRdate(rs.getString(6));
		
		memberList.add(mb);
	}
	// json = "]"; 
	
	rs.close();
	stmt.close();
	conn.close();
	
	// JSON 생성하기
	String json = new Gson().toJson(memberList);
	
	// JSON 출력하기
	out.print(json);

%>