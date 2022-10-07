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

<table border="1" width="40%" align="center">
	<tr>
		<th>순번</th>
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>총합</th>
		<th>평균</th>
		<th>등록일</th>
	</tr>
	<c:if test="${list.size() == 0 }">
		<tr>
			<td align="center" colspan="4">등록된 내용이 없습니다</td>
		</tr>
	</c:if>
	
	<c:forEach var="dto" items="${list }">
		<tr>
			<td>${dto.no }</td>
			<td>
				<a href="#" onClick="move('view','${dto.no}')">${dto.name}</a>
			</td>
			<td>${dto.kor }</td>
			<td>${dto.eng }</td>
			<td>${dto.mat }</td>
			<td>${dto.tot }</td>
			<td>${dto.avg }</td>
			<td>${dto.regiDate}</td>
		</tr>
	</c:forEach>
</table>
<div style="border: 0px solid red;padding-top: 20px;width: 40%;margin: 0 auto;" align="right">
	|
	<a href="${path }/sungjuk/list">전체목록</a>
	|
	<a href="#" onClick="move('chuga','');">등록</a>
	|
</div>

<script>
function move(value1, value2){
	location.href="${path}/sungjuk/" + value1 + '?no=' + value2;
}
</script>
</body>
</html>