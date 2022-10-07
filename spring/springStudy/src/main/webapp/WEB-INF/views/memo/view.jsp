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
		<td>작성자 </td>
		<td>${dto.writer }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			${fn:replace(dto.content ,newLineChar, "<br/>")}
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" Onclick="save();">확인</button>
		</td>
	</tr>
</table>
<div style="border: 0px solid red; padding-top: 20px; width: 40%;" align="right">
	|
	<a href="${path }/memo/list">전체목록</a>
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
	location.href="${path}/memo/" + value1 + '?no=' + value2;
}
</script>
</body>
</html>