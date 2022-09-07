<%@page import="java.sql.DriverManager"%>    
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/inc_dbInfo.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String arg1 = request.getParameter("arg1"); //get
	String passwd = request.getParameter("passwd"); //post
	
	if (arg1 == null || arg1.trim().equals("")) {
		out.print("<script>");
		out.print("alert('정상적인 접근이 아닙니다!');");
		out.print("location.href='main.jsp?menuGubun=member2_list.jsp';");
		out.print("</script>");
		return;
	}
	
	if (passwd == null || passwd.trim().equals("")) {
		out.println("비밀번호 비정상");
		return;
	}
	
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int result = 0;
	try {
		Class.forName(dbDriver);
	    conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	    System.out.println("오라클 접속 성공");
	    //-----------------------------------------------------------------
	    String sql = "delete from member where id=? and passwd=?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, arg1);
	    pstmt.setString(2, passwd);
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

	//out.print("passwd : " + passwd + "<br>");
	
	if(result > 0) {
		out.print("<script>");
		out.print("alert('정상적으로 삭제되었습니다');");
		out.print("location.href='main.jsp?menuGubun=member2_list';");
		out.print("</script>");
	} else {
		out.print("<script>");
		out.print("alert('삭제처리 중 오류가 발생했습니다');");
		out.print("location.href='main.jsp?menuGubun=member2_sakje.jsp&arg1=" + arg1 + "';");
		out.print("</script>");
	}
	
%>

