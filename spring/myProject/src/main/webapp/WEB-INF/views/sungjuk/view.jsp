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
		<td>이름 </td>
		<td>${dto.name }</td>
	</tr>
	<tr>
		<td>국어 </td>
		<td>${dto.kor }</td>
	</tr>
	<tr>
		<td>영어 </td>
		<td>${dto.eng }</td>
	</tr>
	<tr>
		<td>수학 </td>
		<td>${dto.mat }</td>
	</tr>
	<tr>
		<td>총합 </td>
		<td>${dto.tot }</td>
	</tr>
	<tr>
		<td>평균</td>
		<td>${dto.avg }</td>
	</tr>
	<tr>
		<td>등급 </td>
		<td>${dto.grade }</td>
	</tr>
	<tr>
		<td>등록일 </td>
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
	<a href="${path }/sungjuk/list">전체목록</a>
	|
	<a href="#" onClick="move('sujung','${dto.no}');">수정</a>
	|
	<a href="#" onClick="move('sakje','${dto.no}');">삭제</a>
	|
</div>
<script>
function move(value1, value2){
	location.href="${path}/sungjuk/" + value1 + '?no=' + value2;
}
</script>
</body>
</html>