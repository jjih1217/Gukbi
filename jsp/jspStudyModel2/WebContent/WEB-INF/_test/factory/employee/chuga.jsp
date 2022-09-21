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

<h2>직원등록</h2>
<form name="DirForm">
<table border="1" width="80%">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" name="phone"></td>
	</tr>
	<tr>
		<td>입사일</td>
		<td><input type="date" name="hireDate"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td>급여</td>
		<td><input type="text" name="salary"></td>
	</tr>
	<tr>
		<td>부서</td>
		<td>
			<c:set var="k" value="${k = 0 }"/>
			<c:forEach var="buseoDto" items="${buseoList }">
			
				<c:if test="${k == 0 }">
					<c:set var="chkValue" value="checked" />
				</c:if>
				<c:if test="${k != 0 }">
					<c:set var="chkValue" value="" />
				</c:if>
				
				<input type="radio" name="buseoNo" value="${buseoDto.buseoNo }" ${chkValue}> ${buseoDto.buseoName } (${buseoDto.buseoNo })<br>
				<c:set var="k" value="${k = k + 1 }"/>
				
			</c:forEach>
		</td>
	</tr>
	<!-- <tr>
		<td>직위</td>
		<td><input type="text" name="ㅔㅐ냐샤ㅐㅜ"></td>
	</tr> -->
	<tr>
		<td colspan="2">
			<button type="button" onClick="save();">등록하기</button>
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
function save() {
	if(confirm('등록하시겠습니까?')){
		document.DirForm.action = "${path }/employee_servlet/chugaProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

function move(value1, value2) {
	location.href = '${path }/buseo_servlet/' + value1 + '?buseoNo=' + value2;
}
</script>
</body>
</html>
