<!-- sungjukFile/chuga.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "_inc_fileInfo.jsp" %> <!-- 변수공유 가능 -->

<!DOCTYPE html>
<html>
<head>
<meta4 charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<h2>성적관리(등록)</h2>
<form name="chugaForm">
<table border="1">
	<tr>
		<td>이름 : </td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>국어 : </td>
		<td><input type="text" name="kor"></td>
	</tr>
	<tr>
		<td>영어 : </td>
		<td><input type="text" name="eng"></td>
	</tr>
	<tr>
		<td>수학 : </td>
		<td><input type="text" name="mat"></td>
	</tr>
	<tr>
		<td>과학 : </td>
		<td><input type="text" name="sci"></td>
	</tr>
	<tr>
		<td>역사 : </td>
		<td><input type="text" name="his"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="chuga();">확인</button>
		</td>
	</tr>
</table>
</form>

<script>
function chuga() {
	if(confirm('저장하시겠습니까?')) {
		document.chugaForm.action = "chugaProc.jsp";
		document.chugaForm.method  = "post";
		document.chugaForm.submit();
	}
}
</script>
	
</body>
</html>