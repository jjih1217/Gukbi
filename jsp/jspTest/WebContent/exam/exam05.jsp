<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exam05.jsp</title>
</head>
<body>

<h2>exam05.jsp</h2>
<form name="exam05Form">
<table>
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
			<button type="button" onClick="formSubmit();">확인</button>
		</td>
	</tr>
</table>
</form>

<script>
function formSubmit(){
	document.exam05Form.action = "exam05Proc.jsp";
	document.exam05Form.method = "post";
	document.exam05Form.submit();
}
</script>
</body>
</html>