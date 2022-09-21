<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../../../_include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "../../../_include/inc_menu.jsp" %>

<h2>직원수정</h2>
<form name="DirForm">
<input type="text" name="sabun" value="${dto.sabun }">
<table border="1" width="80%">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" value="${dto.name }"></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" name="phone" value="${dto.phone }"></td>
	</tr>
	<tr>
		<td>입사일</td>
		<td><input type="date" name="hireDate" value="${dto.hireDate }"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" value="${dto.email }"></td>
	</tr>
	<tr>
		<td>급여</td>
		<td><input type="text" name="salary" value="${dto.salary }"></td>
	</tr>
	<tr>
		<td>부서명</td>
		<td>
			<c:forEach var="buseoDto" items="${buseoList }">
			
				<c:set var="chkValue" value="checked" />
				<c:if test="${buseoDto.buseoNo == dto.buseoNo }">
					<c:set var="chkValue" value="" />
				</c:if>
				
				<input type="radio" name="buseoNo" value="${buseoDto.buseoNo }" ${chkValue}> ${buseoDto.buseoName } (${buseoDto.buseoNo })<br>
				
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="sujung();">수정하기</button>
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
function sujung() {
	if(confirm('수정하시겠습니까?')){
		document.DirForm.action = "${path }/employee_servlet/sujungProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

function move(value1, value2) {
	location.href = '${path }/employee_servlet/' + value1 + '?sabun=' + value2;
}
</script>
</body>
</html>
