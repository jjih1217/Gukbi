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

<h2>학사관리_성적목록</h2>
 list 길이 : ${fn:length(list) }
<table border="1" width="80%">
	<tr>
		<th>번호</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>과학</th>
		<th>역사</th>
		<th>총점</th>
		<th>평균</th>
		<th>등급</th>
		<th>학번 / 학생명</th>
		<th>시험번호 / 시험명</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
	
	<c:if test="${fn:length(list) == 0 }">
	<tr>
		<td colspan="5" style="width: 300px; heught: 100px;">등록된 내용이 없습니다</td>
	</tr>
	</c:if>
	
	<c:forEach var="list" items="${list }">
	<tr>
		<td>${list.sungjukNo }</td>
		<td>${list.kor }</td>
		<td>${list.eng }</td>
		<td>${list.mat }</td>
		<td>${list.sci }</td>
		<td>${list.his }</td>
		<td>${list.tot }</td>
		<td>${list.avg }</td>
		<td>${list.grade }</td>
		<td>${list.hakbun } / ${list.studentName }  </td>
		<td>${list.sihumNo } / ${list.sihumName }  </td>
		<td>${list.regiDate }  </td>
		<td>
			<a href="#" onClick="move('sujung.do','${list.sungjukNo }')">수정</a>
			<a href="#" onClick="move('sakje.do','${list.sungjukNo }')">삭제</a>
		</td>
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
	location.href = '${path }/haksaSungjuk_servlet/' + value1 + '?sungjukNo=' + value2;
}
</script>
</body>
</html>