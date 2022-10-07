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
		<th>도서코드</th>
		<th>도서명</th>
		<th>분류</th>
		<!-- <th>저자</th>
		<th>출판사</th> -->
		<th>발행일</th>
	</tr>
	<c:if test="${list.size() == 0 }">
		<tr>
			<td align="center" colspan="4">등록된 내용이 없습니다</td>
		</tr>
	</c:if>
	
	<c:forEach var="bookDto" items="${list }">
		<tr>
			<td>${bookDto.bookCode }</td>
			<td>
				<a href="#" onClick="move('view','${bookDto.bookCode}')">${bookDto.bookName}</a>
			</td>
			<td>${bookDto.bookCate }</td>
			<td>${bookDto.regiDate}</td>
		</tr>
	</c:forEach>
</table>
<div style="border: 0px solid red;padding-top: 20px;width: 40%;margin: 0 auto;" align="right">
	|
	<a href="${path }/book/list">전체목록</a>
	|
	<a href="#" onClick="move('chuga','');">등록</a>
	|
</div>

<script>
function move(value1, value2){
	location.href="${path}/book/" + value1 + '?bookCode=' + value2;
}
</script>
</body>
</html>