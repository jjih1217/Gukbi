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

<h2>부서목록</h2>
<table border="1" width="80%">
	<tr>
		<th>부서번호</th>
		<th>부서명</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
	
	<c:if test="${fn:length(list) == 0 }">
	<tr>
		<td colspan="5" style="width: 300px; heught: 100px;">등록된 내용이 없습니다</td>
	</tr>
	</c:if>
	
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.buseoNo}</td>
		<td>${dto.buseoName}</td>
		<td>${dto.regiDate}</td>
		<td>
			<a href="#" onClick="move('sujung.do','${dto.buseoNo}')">수정</a> / 
			<a href="#" onClick="move('sakje.do','${dto.buseoNo}')">삭제</a>
		</td>
	</tr>
	</c:forEach>
	
</table>
<div style="width: 80%; margin: 10px 0 0 0;" align="right">
	|
	<a href="#" onClick="move('list.do','')">목록</a>
	|
	<a href="#" onClick="move('chuga.do','')">등록</a>
	|
</div>
<script>
function move(value1, value2) {
	location.href = '${path }/buseo_servlet/' + value1 + '?buseoNo=' + value2;
}
</script>
</body>
</html>