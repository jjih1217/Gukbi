// Java Resource / src / config / DB.java
package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DB {
	
	public static Connection dbConn () {
		String dbDriver = "oracle.jdbc.driver.OracleDriver";
		String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbId = "jspTest";
		String dbPasswd = "1234";
		
		Connection conn = null;
		
		try {
			Class.forName(dbDriver);
		} catch (Exception e) {
			//e.printStackTrace();
			System.err.println("-- 오라클 드라이버 오류 --");
		}
		
		try {
			conn = DriverManager.getConnection(dbUrl, dbId, dbPasswd);
		} catch (Exception e) {
			//e.printStackTrace();
			System.err.println("-- 오라클 접속 오류 --");
		}
		
		return conn;
	}
		
		
	public static void dbConnClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		
		try {
			if(rs != null) { rs.close(); }
		} catch (Exception e) {
			//e.printStackTrace();
		}
		
		try {
			if(pstmt != null) { pstmt.close(); }
		} catch (Exception e) {
			//e.printStackTrace();
		}
		
		try {
			if(conn != null) { conn.close(); }
		} catch (Exception e) {
			//e.printStackTrace();
		}
	}
	
}
