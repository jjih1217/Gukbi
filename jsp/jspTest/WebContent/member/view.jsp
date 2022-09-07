<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/inc_dbInfo.jsp" %>
<%@include file="_inc_top.jsp" %>
    
<% 
	String arg1 = request.getParameter("arg1"); // arg1
	
	if (arg1 == null || arg1.trim().equals("")) {
		out.print("<script>");
		out.print("alert('정상적인 접근이 아닙니다!');");
		out.print("location.href='list.jsp';");
		out.print("</script>");
		//response.sendRedirect("list.jsp");
		return;
	}
	
	// 변수 사용을 위해서 밖으로 이동
	String id = "";
   	String passwd = "";
   	String name = "";
   	String phone = "";
   	String email = "";
   	String address =  "";
   	Date regiDate;
   	String strRegiDate = "";
	    	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
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
	    String sql = "select * from member where id=?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setString(1, arg1); // arg1 , 넘어온 값을 저장
	    rs = pstmt.executeQuery();
	    if(rs.next()) {
	    	id = rs.getString("id");
	    	passwd = rs.getString("passwd");
	    	name = rs.getString("name");
	    	phone = rs.getString("phone");
	    	email = rs.getString("email");
	    	address = rs.getString("address");
	    	regiDate = rs.getDate("regiDate");
	    	strRegiDate = rs.getString("regiDate");
	    	//out.println(id + "/" + regiDate  + "/" + strRegiDate);
	    }
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
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원상세보기</title>
</head>
<body>

<table border="1" width="80%" align="center">
	<tr>
		<td height="100px" align="center">
		<!-- 상단 메뉴 시작 -->
		<%@ include file = "../include/inc_menu.jsp" %>
		<!-- 상단 메뉴 종료 -->
		</td>
	</tr>
	<tr>
		<td height="300px" align="center" width="50%">
		<!-- 본문 내용 시작 -->
			<h2>회원상세보기</h2>
			<table border="1" width="50%">
				<tr>
					<td>아이디 : </td>
					<td><%=id %></td>
				</tr>
				<tr>
					<td>이름 : </td>
					<td><%=name %></td>
				</tr>
				<tr>
					<td>전화번호 : </td>
					<td><%=phone %></td>
				</tr>
				<tr>
					<td>이메일 : </td>
					<td><%=email %></td>
				</tr>
				<tr>
					<td>주소 : </td>
					<td><%=address %></td>
				</tr>
			</table>
			<div style="borer : 0px solid blue; width: 50%; margin-top: 10px;" align="right">
				|
				<a href="#" onClick="move('list.jsp', '');">목록</a>
				|
				<a href="#" onClick="move('chuga.jsp', '');">등록</a>
				|
				<a href="#" onClick="move('sujung.jsp', '<%=id %>');">수정</a>
				|
				<a href="#" onClick="move('sakje.jsp', '<%=id %>');">삭제</a>
				|
			</div>
			<!-- 본문 내용 종료 -->
		</td>
	</tr>
	<tr>
		<td height="100px" align="center">
			<%@ include file = "../include/inc_bottom.jsp" %>
		</td>
	</tr>
</table>

<script>
function move(value1, value2) {
	location.href = value1 + "?arg1=" + value2;
}
</script>
</body>
</html>

