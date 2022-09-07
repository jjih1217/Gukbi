<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); //post방식 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exam01.jsp</title>
</head>
<body>
	
<h2>exam01.jsp</h2>

<form name="testForm" method="post" action="exam01Proc.jsp">
<table border="0">
	<tr>
		<td>이름: </td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>나이: </td>
		<td><input type="text" name="age"></td>
	</tr>
	<tr>
		<td>성별: </td>
		<td><input type="text" name="gender"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="submit">확인</button>
		</td>
	</tr>
</table>
</form>
</body>
</html>