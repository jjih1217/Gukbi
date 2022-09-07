<!-- member2/chugaProc.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@include file="../include/inc_dbInfo.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String menuGubun = request.getParameter("menuGubun");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String passwdChk = request.getParameter("passwdChk");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
   
    int result = 0;
    try {
    	Class.forName(dbDriver);
        conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
        System.out.println("오라클 접속 성공");
        //-----------------------------------------------------------------
        String sql = "insert into member (id, passwd, name, phone, email, address, regiDate) values (?, ?, ?, ?, ?, ?, sysdate)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, passwd);
        pstmt.setString(3, name);
        pstmt.setString(4, phone);
        pstmt.setString(5, email);
        pstmt.setString(6, address);
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
		out.println("<script>location.href = 'main.jsp?menuGubun=member2_list';</script>");  // 모든 링크는 메인을 통해서 이동함
	} else {
		out.print("<script>");
		out.print("alert('추가 처리 중 오류가 발생했습니다!')");
		out.print("location.href='main.jsp?menuGubun=member2_chuga.jsp';");
		out.print("</script>");
	}
%>

