<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "../../../_include/inc_menu.jsp" %>

<h2>부서삭제</h2>
<form name="DirForm">
<input type="text" name="buseoNo" value="${dto.buseoNo }">
<table border="1" width="80%">
	<tr>
		<td>부서번호</td>
		<td>${dto.buseoNo }</td>
	</tr>
	<tr>
		<td>부서명</td>
		<td>${dto.buseoNo }</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="sakje();">삭제하기</button>
		</td>
	</tr>
</table>
</form>
<div style="width: 80%; margin: 10px 0 0 0;" align="right">
	|
	<a href="#" onClick="move('list.do','')">목록</a>
	|
</div>
<script>
function sakje() {
	if(confirm('삭제하시겠습니까?')){
		document.DirForm.action = "${path }/buseo_servlet/sakjeProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

function move(value1, value2) {
	location.href = '${path }/buseo_servlet/' + value1 + '?buseoNo=' + value2;
}
</script>
</body>
</html>
