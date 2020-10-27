<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@page import="kr.co.jboard1.bean.TermsBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
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
	
	
		Connection conn = DBConfig.getConnection();	
	
	// 3단계
		Statement stmt = conn.createStatement();
	
	// 4단계
		String 	  sql = "SELECT * FROM `JBOARD_TERMS`";
		ResultSet rs  = stmt.executeQuery(sql);
		
	
	// 5단계(SELECT 문일 경우만 작성)
		/*
		String terms   = null;		// 문자열 객체 초기화는 null or ""(빈 문자열)로 한다.
		String privacy = null;
		
		if(rs.next()) {
			terms   = rs.getString(1);
			privacy = rs.getString(2);
		}
		*/
		
		TermsBean tb = new TermsBean();
		
		if(rs.next()) {
			String terms = rs.getString(1);
			tb.setTerms(terms);
			
			tb.setPrivacy(rs.getString(2));
		}
		
	// 6단계
		rs.close();
		stmt.close();
		conn.close();
	
	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>약관</title>
    <link rel="stylesheet" href="/Jboard1/css/style.css"/>    
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script>
    	
    	$(function(){
    		
    		var checkbox = $('input[type=checkbox]');
        	var nextBtn = $('.terms > div > a:eq(1)');
        	
        	nextBtn.click(function(){
        		
        		var checkTerms = checkbox.eq(0).is(':checked');
        		var checkPrivacy = checkbox.eq(1).is(':checked');
        		
        		if(checkTerms && checkPrivacy) {
        			return true;
        		}else {
        			alert("모두 동의하셔야 회원가입이 가능합니다.");
            		return false;
        		}    		
        	});
    		
    	});    	 		
    		
    </script>
</head>
<body>
    <div id="wrapper">
        <section id="user" class="terms">
            <table>
                <caption>사이트 이용약관</caption>
                <tr>
                    <td>
                        <textarea readonly><%= tb.getTerms() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk1"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <table>
                <caption>개인정보 취급방침</caption>
                <tr>
                    <td>
                        <textarea readonly><%= tb.getPrivacy() %></textarea>
                        <p>
                            <label><input type="checkbox" name="chk2"/>동의합니다.</label>
                        </p>
                    </td>
                </tr>
            </table>
            <div>
                <a href="/Jboard1/user/login.jsp">취소</a>
                <a href="/Jboard1/user/register.jsp">다음</a>
            </div>
        </section>
    </div>
    
</body>
</html>