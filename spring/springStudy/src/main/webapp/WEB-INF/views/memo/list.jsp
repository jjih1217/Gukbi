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

<table border="1" width="40%">
	<tr>
		<th>순번</th>
		<th>작성자</th>
		<th>내용</th>
		<th>등록일</th>
	</tr>
	<c:if test="${list.size() == 0 }">
		<tr>
			<td align="center" colspan="4">등록된 내용이 없습니다</td>
		</tr>
	</c:if>
	
	<c:forEach var="memoDto" items="${list }">
		<tr>
			<td>${memoDto.no }</td>
			<td>
				<a href="#" onClick="move('view','${memoDto.no}')">${memoDto.writer}</a>
			</td>
			<td>
				${fn:replace(memoDto.content, newLineChar, "<br/>")}
			</td>
			<td>${memoDto.regiDate}</td>
		</tr>
	</c:forEach>
</table>
<div style="border: 0px solid red; padding-top: 20px; width: 40%;" align="right">
	|
	<a href="${path }/memo/list">전체목록</a>
	|
	<a href="#" onClick="move('list','');">목록</a>
	|
	<a href="#" onClick="move('chuga','');">등록</a>
	|
</div>

<script>
function move(value1, value2){
	location.href="${path}/memo/" + value1 + '?no=' + value2;
}
</script>
</body>
</html>