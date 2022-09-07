<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exam03.jsp</title>
</head>
<body>

<h2>exam03.jsp</h2>


<form name="testForm" method="post" action="exam03Proc.jsp">
<table>
	<tr>
		<td>이름 : </td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>주민번호 : </td>
		<td><input type="text" name="jumin"></td>
	</tr>
	<tr>
		<td>연락처 : </td>
		<td><input type="text" name="phone"></td>
	</tr>
	<tr>
		<td>이메일 : </td>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="submit">전송</button>
		</td> 
	</tr>
</table>
</form>
<!--  
이름, 주민번호, 연락처, 이메일

당신의 이름은 입니다.
당신의 주민번호은 입니다.
당신의 연락처은 입니다.
당신의 이메일은 입니다.
-->

</body>
</html>