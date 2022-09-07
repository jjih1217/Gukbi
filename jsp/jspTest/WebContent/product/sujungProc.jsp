<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/inc_dbInfo.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String arg1_ = request.getParameter("arg1");
	
	if (arg1_ == null || arg1_.trim().equals("")) {
		out.print("<script>");
		out.print("alert('정상적인 접근이 아닙니다!');");
		out.print("location.href='list.jsp';"); // arg1가 없을대 arg1을 안쓰는 페이지로 이동
		out.print("</script>");
		return;
	}
	
	
	int arg1 = Integer.parseInt(arg1_);
	
	int productCode = 0;
   	String productName = "";
   	int productPrice = 0;
   	String productContent = "";
   	String productCategory = "";
   	String vendor = "";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int result = 0;
	try {
		/*
		String dbDriver = "oracle.jdbc.driver.OracleDriver";
	    String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
	    String dbId = "jspTest";
	    String dbPw = "1234";
	    */
	    
	 	Class.forName(dbDriver);
	    conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	    System.out.println("오라클 접속 성공");
	    //-----------------------------------------------------------------
	    String sql = "update product set productName=?, productPrice=?, productContent=?, productCategory=?, vendor=? where productCode=?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, productName);
	    pstmt.setInt(2, productPrice);
	    pstmt.setString(3, productContent);
	    pstmt.setString(4, productCategory);
	    pstmt.setString(5, vendor);
	    pstmt.setInt(5, arg1);
	    result = pstmt.executeUpdate();
	    //-----------------------------------------------------------------
	} catch (Exception e) {
		//e.printStackTrace()
	   System.out.println("오라클 접속 실패");
	} finally {
	   if (rs != null) { rs.close(); }
	   if (pstmt != null) { pstmt.close(); }
	   if (conn != null) { conn.close(); }
	   System.out.println("오라클 접속 해제");
	}
	
	if(result > 0) {
		//response.sendRedirect("<script>alert('정상적으로 수정되었습니다');location.href='view.jsp?arg1=" + arg1 + "';</script>");//view.jsp의 getParameter("arg1") 
		out.print("<script>");
		out.print("alert('정상적으로 수정되었습니다');");
		out.print("location.href='view.jsp?arg1=" + arg1 + "';");
		out.print("</script>");
	} else {
		out.print("<script>");
		out.print("alert('수정처리 중 오류가 발생했습니다');");
		out.print("location.href='sujung.jsp?arg1=" + arg1 + "';");
		out.print("</script>");
	}

	//response.sendRedirect("view.jsp"); 
%>

