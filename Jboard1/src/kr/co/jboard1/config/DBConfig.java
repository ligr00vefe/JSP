package kr.co.jboard1.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	// DB���� - ������
	//	public static final String HOST = "jdbc:mysql://ligr00vefe.com:3306/kkm";
	//	public static final String USER = "kkm";
	//	public static final String PASS = "1234";
		
	// DB���� - ���߿�
		public static final String HOST = "jdbc:mysql://192.168.50.82:3306/kkm";
		public static final String USER = "kkm";
		public static final String PASS = "1234";
		
		public static Connection getConnection() throws Exception {
		
		// 1�ܰ�
			Class.forName("com.mysql.jdbc.Driver");
		
		// 2�ܰ�(���Ӱ�ü conn ����)
			Connection conn = DriverManager.getConnection(HOST, USER, PASS);
			
			return conn;
			
	}
}
