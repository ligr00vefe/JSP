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

public class DeleteCommentService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String seq = req.getParameter("parent");
				
		Connection conn = DBConfig.getConnection();
		PreparedStatement psmt = conn.prepareStatement(SQL.DELETE_COMMENT);
		psmt.setString(1, seq);
		
		int result = psmt.executeUpdate();		// json 값을 리턴할 때는 executeUpdate()값(1,0)을 반환해주기 위해서 int result 변수를 이용한다.
		
		psmt.close();
		conn.close();
		
		JsonObject json = new JsonObject();
		json.addProperty("result", result);

		return "json:"+json.toString();
	}
}
