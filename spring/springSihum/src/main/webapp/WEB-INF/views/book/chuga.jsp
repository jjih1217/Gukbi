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

<h2 style="text-align: center;">${title}</h2>
<form name="DirForm">
<table border="1" width="40%" align="center">
	<tr>
		<td>도서명</td>
		<td><input type="text" name="bookName"></td>
	</tr>
	<tr>
		<td>분류</td>
		<td><input type="text" name="bookCate"></td>
	</tr>
	<tr>
		<td>저자</td>
		<td><input type="text" name="author"></td>
	</tr>
	<tr>
		<td>출판사</td>
		<td><input type="text" name="publisher"></td>
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
		document.DirForm.action = "${path}/book/chugaProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>

</body>
</html>