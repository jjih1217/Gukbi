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
<h2>회원등록</h2>
<form name="DirForm">
	아이디 : <input type="text" name="id"><br/>
	비밀번호 : <input type="password" name="passwd"><br/>
	비밀번호 확인 : <input type="password" name="passwdChk"><br/>
	이름 : <input type="text" name="name"><br/>
	전화번호 : <input type="text" name="phone"><br/>
	<button type="button" onClick="save();">확인</button>
</form>
<script>
function save(){
	if(confirm('등록할까요?')){
		document.DirForm.action = "${path}/memberNew/chugaProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
</body>
</html>