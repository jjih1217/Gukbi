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
<input type="hidden" name="bookCode" value="${dto.bookCode }"> 
<table border="1" width="40%" align="center">
	<tr>
		<td>도서코드</td>
		<td>${dto.bookCode }</td>
	</tr>
	<tr>
		<td>도서명</td>
		<td><input type="text" name="bookName" value="${dto.bookName }"></td>
	</tr>
	<tr>
		<td>분류</td>
		<td><input type="text" name="bookCate" value="${dto.bookCate }"></td>
	</tr>
	<tr>
		<td>저자</td>
		<td><input type="text" name="author" value="${dto.author }"></td>
	</tr>
	<tr>
		<td>출판사</td>
		<td><input type="text" name="publisher" value="${dto.publisher }"></td>
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
		document.DirForm.action = "${path}/book/sujungProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
</body>
</html>