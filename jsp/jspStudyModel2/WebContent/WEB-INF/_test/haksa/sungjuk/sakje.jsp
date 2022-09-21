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

<h2>학사관리_학생삭제</h2>
<form name="DirForm">
<input type="text" name="sungjukNo" value="${dto.sungjukNo }">
<table border="1" width="80%">
	<tr>
		<td width="100px">국어</td>
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
		<td>학번</td>
		<td>${dto.hakbun }</td>
	</tr>
	<tr>
		<td>학번</td>
		<td>${dto.sihumNo }</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="save();">삭제하기</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('삭제하시겠습니까?')){
		document.DirForm.action = "${path }/haksaSungjuk_servlet/sakjeProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

</script>


</body>
</html>