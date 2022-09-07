<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>

<h2>회원가입</h2>

<form name="testForm" method="post" action="exam04Proc.jsp">
<table>
	<tr>
		<td>아이디 : </td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>비번 : </td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>이름: </td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>닉네임: </td>
		<td><input type="text" name="nickName"></td>
	</tr>
	<tr>
		<td>휴대폰 : </td>
		<td><input type="text" name="phone"></td>
	</tr>
	<tr>
		<td>이메일 : </td>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td>주민번호 : </td>
		<td><input type="text" name="jumin"></td>
	</tr>
	<tr>
		<td>주소 : </td>
		<td><input type="text" name="address"></td>
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