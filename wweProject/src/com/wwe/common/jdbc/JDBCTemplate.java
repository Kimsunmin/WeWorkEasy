package com.wwe.common.jdbc;


import oracle.jdbc.OracleConnection;
import oracle.jdbc.pool.OracleDataSource;

import java.sql.*;
import java.util.Properties;

public class JDBCTemplate {
	
	//singleton 패턴
	//클래스의 인스턴스가 하나만 생성되어야 할 때 사용하는 디자인 패턴
	
	private static JDBCTemplate instance;
	
	//생성자를 private으로 만들어서 외부에서 JDBCTemplate의 생성을 차단
	private JDBCTemplate() {
//		//1. OracleDriver를 JVM에 등록
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
	}
	
	public static JDBCTemplate getInstance() {
		if(instance == null) {
			instance = new JDBCTemplate();
		}
		
		return instance;
	}
	
	//Connection 객체를 만들 메서드
	public Connection getConnection() {

		String url = "jdbc:oracle:thin:@wwedb_medium?TNS_ADMIN=C:/wallet/Wallet_WweDB";
		String user = "admin";
		String password = "Weworkeasy93!";

		Properties info = new Properties();
		info.put(OracleConnection.CONNECTION_PROPERTY_USER_NAME, user);
		info.put(OracleConnection.CONNECTION_PROPERTY_PASSWORD, password);

		Connection conn = null;

		try {
			OracleDataSource ods = new OracleDataSource();
			ods.setURL(url);
			ods.setConnectionProperties(info);
			conn = ods.getConnection();
			conn.setAutoCommit(false);
		} catch (SQLException throwables) {
			throwables.printStackTrace();
		}

		return conn;
	}
	
	//commit 수행
	public void commit(Connection conn) {
		try {
			conn.commit();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void rollback(Connection conn) {
		try {
			conn.rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void close(ResultSet rset) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void close(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void close(ResultSet rset, Statement stmt) {
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
			
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void close(Statement stmt, Connection conn) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
			
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void close(ResultSet rset, Statement stmt, Connection conn) {
		
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
			
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
			
			if(conn != null && !conn.isClosed()) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
