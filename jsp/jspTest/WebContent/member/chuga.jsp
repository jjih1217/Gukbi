<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="_inc_top.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원등록</title>
</head>
<body>

<table border="1" width="80%" align="center">
	<tr>
		<td height="100px" align="center">
		<!-- 상단 메뉴 시작 -->
		<%@ include file = "../include/inc_menu.jsp" %>
		<!-- 상단 메뉴 종료 -->
		</td>
	</tr>
	<tr>
		<td height="300px" align="center">
		<!-- 본문 내용 시작 -->
			<h2>회원등록</h2>
			<form name="chugaForm">
			<table border="1">
				<tr>
					<td>아이디 : </td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>비밀번호 : </td>
					<td><input type="password" name="passwd"></td>
				</tr>
				<tr>
					<td>비밀번호 확인 : </td>
					<td><input type="password" name="passwdChk"></td>
				</tr>
				<tr>
					<td>이름 : </td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>전화번호 : </td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>이메일 : </td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td>주소 : </td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" onClick="join();">가입하기</button>
					</td>
				</tr>
			</table>
			</form>
			<!-- 본문 내용 종료 -->
		</td>
	</tr>
	<tr>
		<td height="100px" align="center">
			<%@ include file = "../include/inc_bottom.jsp" %>
		</td>
	</tr>
</table>

<script>
function join() {
	/*
	if(document.chugaForm.id.value == '' ) {
		alert('아이디를 입력하세요.');
		document.chugaForm.id.focus();
		return;
	}
	
	if(document.chugaForm.passwd.value == '' ) {
		alert('비밀번호룰 입력하세요.');
		document.chugaForm.passwd.focus();
		return;
	}
	
	if(document.chugaForm.passwdChk.value == '' ) {
		alert('비밀번호확인란을 입력하세요.');
		document.chugaForm.passwdChk.focus();
		return;
	}
	
	if(document.chugaForm.passwd.value !== document.chugaForm.passwdChk.value) {
		alert('입력한 비밀번호가 다릅니다.\n확인 후 다시 입력하세요');
		document.chugaForm.passwdChk.focus();
		return;
	}
	*/
	document.chugaForm.action = "chugaProc.jsp";
	document.chugaForm.method = "post";
	document.chugaForm.submit();
}

</script>
</body>
</html>

