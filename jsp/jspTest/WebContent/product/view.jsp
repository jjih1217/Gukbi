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
	String arg1_ = request.getParameter("arg1");
	
	if (arg1_ == null || arg1_.trim().equals("")) {
		out.print("<script>");
		out.print("alert('정상적인 접근이 아닙니다!');");
		out.print("location.href='list.jsp';");
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
	Date regiDate = null;
	    	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try { 
	 	Class.forName(dbDriver);
	    conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
	    System.out.println("오라클 접속 성공");
	    //-----------------------------------------------------------------
	    String sql = "select * from product where productCode=?";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, arg1); 
	    rs = pstmt.executeQuery();
	    if(rs.next()) {
	    	productCode = rs.getInt("productCode");
	    	productName = rs.getString("productName");
	    	productPrice = rs.getInt("productPrice");
	    	productContent = rs.getString("productContent");
	    	productCategory = rs.getString("productCategory");
	    	vendor = rs.getString("vendor");
	    	regiDate = rs.getDate("regiDate");
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
<title>상품상세보기</title>
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
			<h2>상품상세보기</h2>
			<table border="1" width="50%">
				<tr>
					<td>상품코드 : </td>
					<td><%=productCode %></td>
				</tr>
				<tr>
					<td>상품명 : </td>
					<td><%=productName %></td>
				</tr>
				<tr>
					<td>상품가격 : </td>
					<td><%=productPrice %></td>
				</tr>
				<tr>
					<td>상품내용 : </td>
					<td><%=productContent %></td>
				</tr>
				<tr>
					<td>상품분류 : </td>
					<td><%=productCategory %></td>
				</tr>
				<tr>
					<td>제조사 : </td>
					<td><%=vendor %></td>
				</tr>
				<tr>
					<td>등록일 : </td>
					<td><%=regiDate %></td>
				</tr>
			</table>
			<div style="borer : 0px solid blue; width: 50%; margin-top: 10px;" align="right">
				|
				<a href="#" onClick="move('list.jsp', '');">목록</a>
				|
				<a href="#" onClick="move('chuga.jsp', '');">등록</a>
				|
				<a href="#" onClick="move('sujung.jsp', '<%=productCode %>');">수정</a>
				|
				<a href="#" onClick="move('sakje.jsp', '<%=productCode %>');">삭제</a>
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

