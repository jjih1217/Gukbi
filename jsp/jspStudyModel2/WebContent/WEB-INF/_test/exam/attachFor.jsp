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

<h2>attachFor.jsp</h2>
<form name = "DirForm">
<table border="1">
<tr>
	<td>첨부메모 : </td>
	<td><input type="text" name="memo"></td>
</tr>
<tr>
	<td>첨부파일 : </td>
	<td>
		<input type="file" name="file_0" class="fileUp"><br>
		<input type="file" name="file_1" class="fileUp"><br>
		<input type="file" name="file_2" class="fileUp"><br>
		<input type="file" name="file_3" class="fileUp"><br>
		<input type="file" name="file_4" class="fileUp"><br>
		<input type="text" name="attachCounter">
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
		document.DirForm.attachCounter.value = document.getElementsByClassName("fileUp").length;
		document.DirForm.enctype = "multipart/form-data";
		document.DirForm.action = "${path }/exam_servlet/attachForProc.do";
		document.DirForm.method = "post"
		document.DirForm.submit();
	}
}
</script>
</body>
</html>