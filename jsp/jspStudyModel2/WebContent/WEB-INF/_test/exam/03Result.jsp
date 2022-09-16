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

<h2>03Result.do</h2>
<table border="1">
	<tr>
		<td>이름 : </td>
		<td>${name }</td>
	</tr>
	<tr>
		<td>주민번호 : </td>
		<td>${jumin }</td>
	</tr>
	<tr>
		<td>주소 : </td>
		<td>${address }</td>
	</tr>
	<tr>
		<td>나이 : </td>
		<td>${age }</td>
	</tr>
	<tr>
		<td>성별 : </td>
		<td>${gender }</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="save();">확인</button>
		</td>
	</tr>
</table>

</body>
</html>