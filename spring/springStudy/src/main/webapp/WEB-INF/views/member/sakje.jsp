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
<form name="DirForm">
<input type="text" name="no" value="${dto.no }"> 
<table border="1"  width="60%">
	<tr>
		<td>아이디 : </td>
		<td>${dto.id }</td>
	</tr>
	<tr>
		<td>비밀번호 :</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td>${dto.name }</td>
	</tr>
	<tr>
		<td>연락처 : </td>
		<td>${dto.phone }</td>
	</tr>
	<tr>
		<td>이메일 : </td>
		<td>${dto.email }</td>
	</tr>
	<tr>
		<td>주민번호 : </td>
		<td>${dto.jumin }</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>
			${dto.juso1 }<br>
			${dto.juso2 }
			${dto.juso3 }
			${dto.juso4 }
		</td>
	</tr>
	<tr>
		<td>회원등급</td>
		<td>${dto.grade}</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" Onclick="save();">확인</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('삭제할까요?')) {
		document.DirForm.action = "${path}/member/sakjeProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>

</body>
</html>