package kr.jboard2.service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonObject;

import kr.jboard2.bean.MemberBean;
import kr.jboard2.config.DBConfig;
import kr.jboard2.config.SQL;
import kr.jboard2.controller.CommonService;

public class CommentService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		// 파라미터 수신
			String parent = req.getParameter("parent");
			String comment = req.getParameter("comment");
			String uid = req.getParameter("uid");
			String regip = req.getRemoteAddr();
			
			
			// 1, 2 단계
			Connection conn = DBConfig.getConnection();
			
			// 3 단계
			PreparedStatement psmt = conn.prepareStatement(SQL.INSERT_COMMENT);
			psmt.setString(1, parent);
			psmt.setString(2, comment);
			psmt.setString(3, uid);
			psmt.setString(4, regip);
			
		// 4단계
			int result = psmt.executeUpdate();	// return값 1은 excuteUpdate 실행, 0은 excuteUpdate 미실행
			
		// 5단계
		// 6단계
			psmt.close();
			conn.close();
			
		// 리다이렉트
		// return "redirect:/Jboard2/view.do?seq="+parent;
		
		// json 결과 리턴(리다이렉트)
		// return "json:{'result':"+result+"}";	// "json:{"키값":"value값"}"		
		
		// gson 결과값 리턴(리다이렉트)
		JsonObject json = new JsonObject();
		json.addProperty("result", result);
		
		return "json:"+json.toString();
	}
}
