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

<table border="1" width="60%">
	<tr>
		<td>회원번호</td>
		<td>${dto.no}</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${dto.name}</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>${dto.phone}</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${dto.email}</td>
	</tr>
	<tr>
		<td>주민번호</td>
		<td>
			${dto.jumin}<hr>
			${fn:substring(dto.jumin, 0, 6)} - ${fn:substring(dto.jumin, 7, 8)}****** 
		</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>${dto.juso1} ${dto.juso2} ${dto.juso3} ${dto.juso4}</td>
	</tr>
	<tr>
		<td>회원등급</td>
		<td>${dto.grade}</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${dto.regiDate}</td>
	</tr>
</table>
<div style="border: 0px solid red; padding-top: 20px; width: 60%;" align="right">
	|
	<a href="${path }/member/list">전체목록</a>
	|
	<a href="#" onClick="move('list','');">목록</a>
	|
	<a href="#" onClick="move('chuga','');">등록</a>
	|
	<a href="#" onClick="move('sujung','${dto.no}');">수정</a>
	|
	<a href="#" onClick="move('sakje','${dto.no}');">삭제</a>
	|
</div>
<script>
function move(value1, value2){
	location.href="${path}/member/" + value1 + '?no=' + value2;
}
</script>
</body>
</html>