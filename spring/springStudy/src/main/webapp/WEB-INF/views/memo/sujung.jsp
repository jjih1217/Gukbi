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
<input type="hidden" name="no" value="${dto.no }"> 
<table border="1" width="40%">
	<tr>
		<td>작성자 </td>
		<td><input type="text" name="writer" value="${dto.writer }"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea rows="" cols="" name="content" style="width:500px; height: 80px;">
			${dto.content }
			</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" Onclick="save();">수정</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('수정할까요?')) {
		document.DirForm.action = "${path}/memo/sujungProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
</body>
</html>