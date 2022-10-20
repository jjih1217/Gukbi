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
	<%@include file = "../_include/inc_menu.jsp" %>
<h2>회원삭제</h2>
<form name="DirForm">
	<input type="hidden" name="no" value="${dto.no }">
	
	no : ${dto.no } </br>
	id : ${dto.id } </br>
	passwd : <input type="password" name="passwd"> </br>
	name : ${dto.name } </br> 
	phone : ${dto.phone }</br>
	regiDate : ${dto.regiDate } </br>
	<button type="button" onClick="save();">확인</button>
</form>
<script>
function save(){
	if(confirm('삭제할까요?')){
		document.DirForm.action = "${path}/memberNew/sakjeProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
</body>
</html>