package X_kr.co.farmstory1.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import kr.co.farmstory1.bean.TermsBean;
import kr.co.farmstory1.config.DBConfig;
import kr.co.farmstory1.config.SQL;

public class UserDAO {
	
	// 싱글톤 객체
	private static UserDAO instance = new UserDAO();
	
	public static UserDAO getInstance() {
		return instance;
	}
	
	private UserDAO() {}	
	
	public TermsBean getTerms() throws Exception {

		
		
	}

	public void registerUser() throws Exception {}
	public void checkUid() throws Exception {}
	public void checkName() throws Exception {}
	public void checkPass() throws Exception {}
	public void checkNick() throws Exception {}
	public void checkHp() throws Exception {}
	public void checkEmail() throws Exception {}
	public void login() throws Exception {}
	public void logout() throws Exception {}
	
}
