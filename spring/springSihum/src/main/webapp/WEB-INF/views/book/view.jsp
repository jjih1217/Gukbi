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
		<td>도서코드 </td>
		<td>${dto.bookCode }</td>
	</tr>
	<tr>
		<td>도서명 </td>
		<td>${dto.bookName }</td>
	</tr>
	<tr>
		<td>분류 </td>
		<td>${dto.bookCate }</td>
	</tr>
	<tr>
		<td>저자 </td>
		<td>${dto.author }</td>
	</tr>
	<tr>
		<td>출판사 </td>
		<td>${dto.publisher }</td>
	</tr>
	<tr>
		<td>발행일 </td>
		<td>${dto.regiDate }</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" Onclick="save();">확인</button>
		</td>
	</tr>
</table>
<div style="border: 0px solid red;padding-top: 20px;width: 40%;margin: 0 auto;" align="right">
	|
	<a href="${path }/book/list">전체목록</a>
	|
	<a href="#" onClick="move('sujung','${dto.bookCode}');">수정</a>
	|
	<a href="#" onClick="move('sakje','${dto.bookCode}');">삭제</a>
	|
</div>
<script>
function move(value1, value2){
	location.href="${path}/book/" + value1 + '?bookCode=' + value2;
}
</script>
</body>
</html>