<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/inc_dbInfo.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String arg1 = request.getParameter("arg1");
	
	if (arg1 == null || arg1.trim().equals("")) {
		out.print("<script>");
		out.print("alert('정상적인 접근이 아닙니다!');");
		out.print("location.href='list.jsp';"); // arg1가 없을대 arg1을 안쓰는 페이지로 이동
		out.print("</script>");
		return;
	}
	
	String passwd = request.getParameter("passwd");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	if (passwd == null || passwd.equals("")) {
		out.println("비밀번호 비정상");
		return;
	}
	
	
	if (phone == null || phone.equals("")) {
		out.println("전화번호 비정상");
		return;
	}
	
	if (email == null || email.equals("")) {
		out.println("이메일 비정상");
		return;
	}
	
	if (address == null || address.equals("")) {
		out.println("주소 비정상");
		return;
	}
	
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
	    String sql = "update member set phone=?, email=?, address=? where id=? and passwd=?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, phone);
	    pstmt.setString(2, email);
	    pstmt.setString(3, address);
	    pstmt.setString(4, arg1);
	    pstmt.setString(5, passwd);
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
		out.print("location.href='sugung.jsp?arg1=" + arg1 + "';");
		out.print("</script>");
	}

	//response.sendRedirect("view.jsp"); 
%>

