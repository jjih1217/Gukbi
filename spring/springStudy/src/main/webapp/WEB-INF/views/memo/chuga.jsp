<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "../_include/inc_menu.jsp" %>

<h2>${title}</h2>
<form name="DirForm">
<table border="1">
	<tr>
		<td>작성자 </td>
		<td><input type="text" name="writer"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea rows="" cols="" name="content" style="width:500px; height: 80px;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" Onclick="save();">확인</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('저장할까요?')) {
		document.DirForm.action = "${path}/memo/chugaProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>

</body>
</html>