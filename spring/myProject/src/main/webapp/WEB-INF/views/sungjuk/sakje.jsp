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
		<td>${dto.kor }</td>
	</tr>
	<tr>
		<td>영어</td>
		<td>${dto.eng }</td>
	</tr>
	<tr>
		<td>수학</td>
		<td>${dto.mat }</td>
	</tr>
	<tr>
		<td>총합</td>
		<td>${dto.tot }</td>
	</tr>
	<tr>
		<td>평균</td>
		<td>${dto.avg }</td>
	</tr>
	<tr>
		<td>등급</td>
		<td>${dto.grade }</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${dto.regiDate }</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" Onclick="save();">삭제</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('삭제할까요?')) {
		document.DirForm.action = "${path}/sungjuk/sakjeProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
</body>
</html>