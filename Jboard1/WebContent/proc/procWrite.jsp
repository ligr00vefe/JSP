<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.Date"%>
<%@page import="java.io.File"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="kr.co.jboard1.config.SQL"%>
<%@page import="kr.co.jboard1.bean.MemberBean"%>
<%@page import="kr.co.jboard1.config.DBConfig"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%
	// 파라미터 수신
	request.setCharacterEncoding("utf-8");
	
	/* multipart 전송은 getParameter를 못함
	String uid     = request.getParameter("uid");
	String title   = request.getParameter("title");
	String content = request.getParameter("content");
	String regip   = request.getRemoteAddr(); 
	*/
	
	// multipart-form 데이터 수신(객체, 윈도우경로 "./file" 현재 디렉터리에 저장, 파일max크기, 문자셋, 파일이름을 바꾸기 위한 정책)
	/* String realpath="C:\\Users\\bigdata\\Desktop\\Workspace\\Jsp\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Jboard1\\file"; */
	String realPath = request.getServletContext().getRealPath("/file");
	
	int maxFileSize = 1024 * 1024 * 10;
	
	MultipartRequest mRequest = new MultipartRequest(request, realPath, maxFileSize, "utf-8", new DefaultFileRenamePolicy());
	
	String uid = mRequest.getParameter("uid");
	String title = mRequest.getParameter("title");
	String content = mRequest.getParameter("content");
	String fname = mRequest.getFilesystemName("file");
	String regip = request.getRemoteAddr();
	
	int hasFile = (fname != null) ? 1 : 0;
	
	// 1, 2단계
	Connection conn = DBConfig.getConnection();
	
	// 3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_ARTICLE);
	psmt.setString(1, title);
	psmt.setString(2, content);
	psmt.setInt(3, hasFile);
	psmt.setString(4, uid);
	psmt.setString(5, regip);
	
	Statement stmt = conn.createStatement();
		
	// 4단계
	psmt.executeUpdate();
	ResultSet rs = stmt.executeQuery(SQL.SELECT_ARTICLE_MAX_SEQ);
	
	// 5단계	
	int parent = 0;
	
	if(rs.next()) {
		parent = rs.getInt(1);
	}
	
	// file명이 null이 아닐경우 파일명 코드화(파일을 첨부했을 경우만)
	if(fname != null) {
		
		// 확장자 구하기
		int i = fname.lastIndexOf(".");
		String ext = fname.substring(i);
		
		// 날짜 구하기(calender, date 클래스)
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss_");
		String now = sdf.format(new Date()); // 200615103623_ 형식으로 저장됨
		
		// 하나밖에 없는 아이디도 포함시켜서 혹시라도 날짜가 겹치는 경우까지 대비한다.
		String newName = now + uid + ext;	// 200615103623_kkm.xlsx 형식으로 저장
		
		
		// 저장된 첨부 파일명 수정
		File oldFile = new File(realPath+"/"+fname);
		File newFile = new File(realPath+"/"+newName);
		
		oldFile.renameTo(newFile);
		
		// 3단계
		PreparedStatement psmtFile = conn.prepareStatement(SQL.INSERT_FILE);
		psmtFile.setInt(1, parent);
		psmtFile.setString(2, fname);
		psmtFile.setString(3, newName);
		
		// 4단계
		psmtFile.executeUpdate();
		
		
		// 6단계
		psmtFile.close();		
	}

	// 6단계		
	psmt.close();
	conn.close();
	

	
	// 리다이렉트
	response.sendRedirect("/Jboard1/list.jsp");
%>