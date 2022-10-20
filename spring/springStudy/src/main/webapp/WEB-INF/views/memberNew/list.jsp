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
<%@include file = "../_include/inc_menu.jsp" %>

<h2>회원목록</h2>

<c:forEach var="memberNewDto" items="${list }" >
	${memberNewDto.no } / 
	<a href="#" onClick="move('view','${memberNewDto.no}');">
		${memberNewDto.id }
	</a> 
	/
	${memberNewDto.name } / 
	${memberNewDto.phone } / 
	${memberNewDto.regiDate }
	<br>
</c:forEach>

<hr>
|
<a href="#" onClick="move('list','0');">목록</a>
|
<a href="#" onClick="move('chuga','');">등록</a>
|
<hr>

<form name="searchForm">
	<select name="searchGubun">
		<option value="">--선택--</option>
		<option value="id" <c:if test="${searchGubun == 'id' }"> selected</c:if>>아이디</option>
		<option value="name" <c:if test="${searchGubun == 'name' }"> selected</c:if>>이름</option>
		<option value="id_name" <c:if test="${searchGubun == 'id_name' }"> selected</c:if>>아이디 + 이름</option>
	</select>
	
	<input type="text" name="searchData" value="${searchData }">
	<button type="button" onClick="search();">검색</button>
</form>

<script>
function move(value1, value2) {
	location.href= "${path}/memberNew/" + value1 + "?no=" + value2 + "&${searchQueryString}";
}

function search() {
	if(confirm('검색?')) {
		document.searchForm.action = "${path}/memberNew/listSearch";
		document.searchForm.method = "post";
		document.searchForm.submit();
	}
}
</script>
</body>
</html>