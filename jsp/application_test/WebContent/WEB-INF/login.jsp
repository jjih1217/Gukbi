<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form name="DirForm">
<table border="1" width="50%">
	<tr>
		<td>아이디: </td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>비밀번호: </td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="login();">로그인</button>
		</td>
	</tr>
</table>
</form>
<script>
function login() {
	if(confirm('로그인할까요?')) {
		document.DirForm.action = 'loginProc.jsp';
		document.DirForm.method = 'post';
		document.DirForm.submit();
	}
}
</script>

</body>
</html>