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

<h2>학사관리_학생상세보기</h2>
<table border="1" width="80%">
	<tr>
		<td width="100px">학번</td>
		<td>${dto.hakbun }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${dto.studentName }</td>
	</tr>
	<tr>
		<td>시험명</td>
		<td>${dto.sihumName }</td>
	</tr>
	<tr>
		<td>국어</td>
		<td>${dto.kor }</td>
	</tr>
	<tr>
		<td>영어</td>
		<td>${dto.eng }</td>
	</tr>
	<tr>
		<td>수학</td>
		<td>${dto.mat }</td>
	</tr>
	<tr>
		<td>과학</td>
		<td>${dto.sci }</td>
	</tr>
	<tr>
		<td>역사</td>
		<td>${dto.his }</td>
	</tr>
	<tr>
		<td>총점</td>
		<td>${dto.tot }</td>
	</tr>
	<tr>
		<td>평균</td>
		<td>${dto.avg }</td>
	</tr>
	<tr>
		<td>등급</td>
		<td>${dto.grade }</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${dto.regiDate }</td>
	</tr>
</table>
<div style="width: 80%; margin: 10px 0 0 0;" align="right">
	|
	<a href="#" onClick="move('list.do','')">목록</a>
	|
	<a href="#" onClick="move('chuga.do','')">등록</a>
	|
	<a href="#" onClick="move('sujung.do','${dto.sungjukNo}')">수정</a>
	|
	<a href="#" onClick="move('sakje.do','${dto.sungjukNo}')">삭제</a>
	|
</div>
<script>
function move(value1, value2) {
	location.href = '${path }/haksaSungjuk_servlet/' + value1 + '?sungjukNo=' + value2;
}
</script>
</body>
</html>