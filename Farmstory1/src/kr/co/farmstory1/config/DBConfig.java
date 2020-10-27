package kr.co.farmstory1.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConfig {

	// 배포용
//	private static final String HOST = "jdbc:mysql://54.123.222.13:3306/kkm?~~~";
//	private static final String USER = "kkm";
//	private static final String PASS = "123414215";
	
	// 개발용
	private static final String HOST = "jdbc:mysql://192.168.50.82:3306/kkm";
	private static final String USER = "kkm";
	private static final String PASS = "1234";
	
	public static Connection getConnection() throws Exception {
		// 1단계
		Class.forName("com.mysql.jdbc.Driver");
		
		// 2단계
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		return conn;
	}
}
