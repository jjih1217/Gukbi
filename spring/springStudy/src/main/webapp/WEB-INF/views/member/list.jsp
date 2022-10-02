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
<table border="1" width="60%">
	<tr>
		<th>순번</th>
		<th>아이디</th>
		<th>이름</th>
		<th>연락처</th>
		<th>주민번호</th>
		<th>가입일</th>
	</tr>
	<c:if test="${list.size() == 0 }">
		<tr>
			<td align="center" colspan="7">등록된 내용이 없습니다</td>
		</tr>
	</c:if>
	
	<c:forEach var="memberDto" items="${list }">
		<tr>
			<td>${memberDto.no }</td>
			<td>
				<a href="#" onClick="move('view','${memberDto.no}')">${memberDto.id}</a>
			</td>
			<td>${memberDto.name}</td>
			<td>${memberDto.phone}</td>
			<td>${memberDto.jumin}</td>
			<td>${memberDto.regiDate} <br>
			<fmt:formatDate value="${memberDto.regiDate }" pattern="yyyy-MM-dd"/><br>
			<fmt:formatDate value="${memberDto.regiDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
	</c:forEach>
</table>
</form>
<div style="border: 0px solid red; padding-top: 20px; width: 60%;" align="right">
	|
	<a href="${path }/member/list">전체목록</a>
	|
	<a href="#" onClick="move('list','');">목록</a>
	|
	<a href="#" onClick="move('chuga','');">등록</a>
	|
</div>

<script>
function move(value1, value2){
	location.href="${path}/member/" + value1 + '?no=' + value2;
}
</script>
</body>
</html>