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

<h2>학사관리_시험등록</h2>
<form name="DirForm">
<table border="1" width="80%">
	<tr>
		<td>시험명</td>
		<td><input type="text" name="sihumName"></td>
	</tr>
	<tr>
		<td>시험일</td>
		<td><input type="date" name="sihumDate"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="save();">등록하기</button>
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
function save() {
	if(confirm('등록하시겠습니까?')){
		document.DirForm.action = "${path }/haksaSihum_servlet/chugaProc.do";
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
