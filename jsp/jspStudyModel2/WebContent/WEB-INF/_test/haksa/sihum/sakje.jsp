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

<h2>학사관리_시험삭제</h2>
<form name="DirForm">
<input type="hidden" name="sihumNo" value="${dto.sihumNo }">
<table border="1" width="80%">
	<tr>
		<td>시험명</td>
		<td>${dto.sihumName }</td>
	</tr>
	<tr>
		<td>시험일</td>
		<td>${dto.sihumDate }</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="save();">삭제하기</button>
		</td>
	</tr>
</table>
</form>
<div style="width: 80%; margin: 10px 0 0 0;" align="right">
	|
	<a href="#" onClick="move('list.do','')">목록</a>
	|
	<a href="#" onClick="move('chuga.do','')">등록</a>
	|
	<a href="#" onClick="move('sujung.do','${dto.sihumNo}')">수정</a>
	|
</div>
<script>
function save() {
	if(confirm('삭제하시겠습니까?')){
		document.DirForm.action = "${path }/haksaSihum_servlet/sakjeProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

function move(value1, value2) {
	location.href = '${path }/haksaSihum_servlet/' + value1 + '?sihumNo=' + value2;
}
</script>
</body>
</html>