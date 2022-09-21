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

<h2>attachWhile.jsp</h2>
<form name = "DirForm">
<table border="1">
<tr>
	<td>첨부메모 : </td>
	<td><input type="text" name="memo"></td>
</tr>
<tr>
	<td>첨부파일 : </td>
	<td>
		<input type="file" name="0"><br>
		<input type="file" name="1"><br>
		<input type="file" name="2"><br>
		<input type="file" name="3"><br>
		<input type="file" name="4"><br>
		<input type="text" name="attachCounter" value="5">
	</td>
</tr>
<tr>
	<td colspan="2">
		<button type="button" onClick="save();">등록하기</button>
	</td>
</tr>
</table>
</form>
<script>
function save(){
	if(confirm('ok?')) {
		document.DirForm.enctype = "multipart/form-data";
		document.DirForm.action = "${path }/exam_servlet/attachWhileProc.do";
		document.DirForm.method = "post"
		document.DirForm.submit();
	}
}
</script>
</body>
</html>