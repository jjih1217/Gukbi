<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "../../../_include/inc_menu.jsp" %>

<h2>직원삭제</h2>
<form name="DirForm">
<input type="text" name="sabun" value="${dto.sabun }">
<table border="1" width="80%">
	<tr>
		<td>이름</td>
		<td>${dto.name }</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>${dto.phone }</td>
	</tr>
	<tr>
		<td>입사일</td>
		<td>${dto.hireDate }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${dto.email }</td>
	</tr>
	<tr>
		<td>급여</td>
		<td>${dto.salary }</td>
	</tr>
	<tr>
		<td>부서명</td>
		<td>${dto.buseoName } (${dto.buseoNo })</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="sakje();">삭제하기</button>
		</td>
	</tr>
</table>
</form>
<div style="width: 80%; margin: 10px 0 0 0;" align="right">
	|
	<a href="#" onClick="move('list.do','')">목록</a>
	|
</div>
<script>
function sakje() {
	if(confirm('삭제하시겠습니까?')){
		document.DirForm.action = "${path }/employee_servlet/sakjeProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

</script>
</body>
</html>
