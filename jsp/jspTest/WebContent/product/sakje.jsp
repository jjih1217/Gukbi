<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Date"%>
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
<title>회원삭제</title>
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
		<td height="300px" align="center">
		<!-- 본문 내용 시작 -->
			<h2>회원삭제</h2>
			<form name="sakjeForm">
			<input type="text" name="arg1" value="<%=productCode %>" readonly>
			<table border="1">
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
				<tr>
					<td colspan="2">
						<button type="button" onClick="sakje();">삭제하기</button>
					</td>
				</tr>
			</table>
			</form>
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
function sakje() {
	document.sakjeForm.action = "sakjeProc.jsp";
	document.sakjeForm.method = "post";
	document.sakjeForm.submit();
}

</script>
</body>
</html>