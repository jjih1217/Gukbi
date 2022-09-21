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

<h2>학사관리_학생목록</h2>
<%-- list 길이 : ${fn:length(list) } --%>
<table border="1" width="80%">
	<tr>
		<th>학번</th>
		<th>이름</th>
		<th>연락처</th>
		<th>부모연락처</th>
		<th>등록일</th>
	</tr>
	
	<c:if test="${fn:length(list) == 0 }">
	<tr>
		<td colspan="5" style="width: 300px; heught: 100px;">등록된 내용이 없습니다</td>
	</tr>
	</c:if>
	
	<c:forEach var="dto" items="${list }"> <!-- var:사용할 변수명 / items:Collection 객체(List, Map) --> 
	<tr>
		<td>${dto.hakbun}</td>
		<td><a href="#" onClick="move('view.do', '${dto.hakbun}')">${dto.name}</a></td>
		<td>${dto.phone}</td>
		<td>${dto.parentPhone}</td>
		<td>${dto.regiDate}</td>
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
	location.href = '${path }/haksaStudent_servlet/' + value1 + '?hakbun=' + value2;
}
</script>
</body>
</html>