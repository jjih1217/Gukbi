<%@page import="application.model.dao.MemberDAO"%>
<%@page import="application.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String sessionId = (String) session.getAttribute("sessionId");

	if(sessionId == null){
		out.println("<script>");
   		out.println("alert('로그인 후 이용해주세요');");
   		out.println("location.href='login.jsp'");
   		out.println("</script>");
   		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2><%=sessionId %>님 환영합니다. &nbsp;&nbsp;&nbsp;<a href="logout.jsp">[로그아웃]</a></h2>
<h2>비밀번호 수정 페이지 입니다.</h2>
	
<form name="DirForm">
<table border="1" style="width:50%">
	<tr>
		<td>비밀번호 : </td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>비밀번호 확인 : </td>
		<td><input type="password" name="passwdChk"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" onClick="chage();">비밀번호변경하기</button>
		</td>
	</tr>
</table>
</form>
<script>
function chage() {
	if(document.DirForm.passwd.value == '') {
		alert('비밀번호를 입력해주세요');
		document.DirForm.passwd.focus();
		return;
	}
	if(document.DirForm.passwdChk.value == '') {
		alert('비밀번호를 입력해주세요');
		document.DirForm.passwdChk.focus();
		return;
	}
	
	document.DirForm.action = 'sujungProc.jsp';
	document.DirForm.method = 'post';
	document.DirForm.submit();
}
</script>
</body>
</html>