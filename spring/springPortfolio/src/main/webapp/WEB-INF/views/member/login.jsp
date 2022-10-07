<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>



<h2>${title}</h2>
<form name="DirForm">
<div class="loginForm">
<table border="1" width="30%">
	<tr>
		<td>아이디 : </td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>비밀번호 :</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" Onclick="save();">로그인</button>
		</td>
	</tr>
</table>
</div>
</form>

<script>
function save() {
	if(confirm('로그인할까요?')) {
		document.DirForm.action = "${path}/member/loginProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>

