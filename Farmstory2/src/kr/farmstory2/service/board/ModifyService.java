package kr.farmstory2.service.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.farmstory2.controller.CommonService;

public class ModifyService implements CommonService {

	@Override
	public String requestProc(HttpServletRequest req, HttpServletResponse resp) throws Exception {

//		req.setCharacterEncoding("utf-8");
//		String group = req.getParameter("group");
//		String cate = req.getParameter("cate");
//		String asideFile = "./_aside_"+group+".jsp";
		
		return "/board/modify.jsp";
	}

}
