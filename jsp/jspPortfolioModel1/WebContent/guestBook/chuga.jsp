<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../_include/inc_sessionChk.jsp" %>

<h2>방명록 등록</h2>
<form name = "chugaForm">
<table border="1" align="center">
	<tr>
		<td>이름 : </td>
		<td><input type="text" name="name" value="<%=sessionName %>"></td>
	</tr>
	<tr>
		<td>이메일 :</td>
		<td><input type="email" name="email"></td>
	</tr>
	<tr>
		<td>비밀번호 :</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>내용 :</td>
		<td>
			<textarea name="content" style="width:300px; height: 300px;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" Onclick="chuga();">등록하기</button>
			<button type="button" Onclick="location.href='main.jsp?menuGubun=guestBook_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function chuga() {
	if (confirm('등록할까요?')){
		document.chugaForm.action = "mainProc.jsp?menuGubun=guestBook_chugaProc";
		document.chugaForm.method = "post";
		document.chugaForm.submit();
	}
}
</script>