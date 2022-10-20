package com.jih.springStudy._common;

import java.sql.*;

public class DB {
	
	public static Connection dbConn() {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
		String dbId = "springStudy";
		String dbPasswd = "1234";
		
		Connection conn = null;
		try {
			Class.forName(driver);
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {
        	conn = DriverManager.getConnection(dbUrl, dbId, dbPasswd);
        } catch(Exception e) {
            e.printStackTrace();
        }
        return conn;
	}
	
	public static void dbConnClose(ResultSet rs, PreparedStatement pstmt, Connection conn){
    	try {
            if (rs != null) { rs.close(); }
        } catch (Exception e) {
        	e.printStackTrace();
        }
    	try {
            if (pstmt != null) { pstmt.close(); }
        } catch (Exception e) {
        	e.printStackTrace();
        }
    	try {
            if (conn != null) { conn.close(); }
        } catch (Exception e) {
        	e.printStackTrace();
        }
    }

}
