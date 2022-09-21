<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "../../_include/inc_menu.jsp" %>

<h2>08Result.do</h2>
<table border="1">
	<tr>
		<td>이름 : </td>
		<td>${map.name }</td>
	</tr>
	<tr>
		<td>주소 : </td>
		<td>${map.addr }</td>
	</tr>
	<tr>
		<td>나이 : </td>
		<td>${map.age }</td>
	</tr>
	<tr>
		<td>테스트 : </td>
		<td>${map.test }</td>
	</tr>
	<tr>
		<td>숫자1 : </td>
		<td>${map.num1 }</td>
	</tr>
	<tr>
		<td>숫자2 : </td>
		<td>${map.num2 }</td>
	</tr>
	<tr>
		<td>결과 : </td>
		<td>${map.result }</td>
	</tr>
</table>

</body>
</html>