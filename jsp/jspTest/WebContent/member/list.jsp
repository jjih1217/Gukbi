<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>    
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@include file="../include/inc_dbInfo.jsp" %>
<%@include file="_inc_top.jsp" %>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	ArrayList<String> list = new ArrayList<>();
	int result = 0;
	try {
		/*
		String dbDriver = "oracle.jdbc.driver.OracleDriver";
	    String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
	    String dbId = "jspTest";
	    String dbPw = "1234";
	    */
	 	Class.forName(dbDriver);
	    conn = DriverManager.getConnection(dbUrl, dbId, dbPw); //@include file="../include/inc_dbInfo.jsp" -> 변수 공유
	    System.out.println("오라클 접속 성공");
	    //-----------------------------------------------------------------
	    String sql = "select * from member order by regiDate desc";
	    pstmt = conn.prepareStatement(sql);
	    rs = pstmt.executeQuery();	
	    while (rs.next()) {
	    	String id = rs.getString("id");
	    	String passwd = rs.getString("passwd");
	    	String name = rs.getString("name");
	    	String phone = rs.getString("phone");
	    	String email = rs.getString("email");
	    	String address = rs.getString("address");
	    	Date regiDate = rs.getDate("regiDate");
	    	
	    	String msg = id + "/" + passwd + "/" + name + "/" +  phone + "/" + email + "/"+ address + "/" + regiDate;
	    	list.add(msg); //[msg, msg,...]
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
<title>회원목록</title>
</head>
<body>

<table border="1" width="80%" align="center">
	<tr>
		<td height="100px" align="center">
		<!-- 상단 메뉴 시작 -->
		<%@include file = "../include/inc_menu.jsp" %>
		<!-- 상단 메뉴 종료 -->
		</td>
	</tr>
	<tr>
		<td height="300px" align="center">
		<!-- 본문 내용 시작 -->
			<h2>회원목록</h2>
			<table border="1" align="center" width="70%">
				<tr>
					<th>순번</th>
					<th>아이디</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>등록일</th>
				</tr>
				
				<% 
					int totalCounter = list.size();
					for (int i=0; i<list.size(); i++) {
						String imsi = list.get(i);
						String[] imsiArray = imsi.split("/");
				%>
						<tr>
							<td><%=totalCounter %></td>
							<td><a href="#" onClick="move('view.jsp', '<%=imsiArray[0] %>');"><%=imsiArray[0] %></a></td>
							<td><%=imsiArray[2] %></td>
							<td><%=imsiArray[3] %></td>
							<td><%=imsiArray[5] %></td>
							<td><%=imsiArray[6] %></td>
						</tr>
				
				<% 
						totalCounter--;
					} 
				%>
				
			</table>
			
			<div style="border : 0px solid blue; width: 70%; margin-top: 10px;" align="right">
				|
				<a href="#" onClick="move('list.jsp', '');">목록</a>
				|
				<a href="#" onClick="move('chuga.jsp', '');">등록</a>
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
	location.href = value1 + "?arg1=" + value2; //view.jsp?id=hong
}
</script>

</body>
</html>