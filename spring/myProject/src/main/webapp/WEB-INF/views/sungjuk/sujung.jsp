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
<input type="hidden" name="no" value="${dto.no }"> 
<table border="1" width="40%" align="center">
	<tr>
		<td>순번</td>
		<td>${dto.no }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${dto.name }</td>
	</tr>
	<tr>
		<td>국어</td>
		<td><input type="text" name="kor" value="${dto.kor }"></td>
	</tr>
	<tr>
		<td>영어</td>
		<td><input type="text" name="eng" value="${dto.eng }"></td>
	</tr>
	<tr>
		<td>수학</td>
		<td><input type="text" name="mat" value="${dto.mat }"></td>
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
		document.DirForm.action = "${path}/sungjuk/sujungProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
</body>
</html>