<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "../../_include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "../../_include/inc_menu.jsp" %>

<h2>06Result2</h2>
로그인 결과<br>
<table border="1">
	<tr>
		<td>입력 아이디 : </td>
		<td>${id }</td>
	</tr>
	<tr>
		<td>로그인 결과 : </td>
		<td>${result }</td>
	</tr>
</table>

<br>

</body>
</html>