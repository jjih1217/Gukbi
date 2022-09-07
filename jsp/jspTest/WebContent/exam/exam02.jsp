<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exam02.jsp</title>
</head>
<body>

<h2>exam02.jsp</h2>

<form name="testForm" method="post" action="exam02Proc.jsp">
<table borer="0">
	<tr>
		<td>아이디 : </td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td><input type="password" name="pw"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="submit">로그인</button>
		</td>
	</tr>
</table>
</form>

</body>
</html>