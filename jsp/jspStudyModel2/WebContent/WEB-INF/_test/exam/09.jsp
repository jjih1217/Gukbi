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

<h2>09.do</h2>
<form name = "DirForm">
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
		<td colspan="2">
			<button type="button" onClick="formCheck();">확인</button>
		</td>
	</tr>
</table>
</form>
<script>d
function formCheck(){
	var f = document.DirForm;
	if(confirm('ok?')) {
		f.action = "${path }/exam_servlet/09Proc.do";
		f.method = "post"
		f.submit();
	}
}
</script>

</body>
</html>