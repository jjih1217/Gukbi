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
<table border="1">
	<tr>
		<td>아이디 : </td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>비밀번호 :</td>
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
		<td>연락처 : </td>
		<td><input type="text" name="phone"></td>
	</tr>
	<tr>
		<td>이메일 : </td>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td>주민번호 : </td>
		<td>
			<input type="text" name="jumin1" style="width: 60px;">
			-
			<input type="text" name="jumin2" style="width: 60px;">
		</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>
			<input type="text" id="sample6_postcode" placeholder="우편번호" name="juso1" >
			<button type="button" onClick="sample6_execDaumPostcode();">우편번호 찾기</button><br>
			<input type="text" id="sample6_address" placeholder="주소" name="juso2" ><br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="juso3" >
			<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="juso4" >
		</td>
	</tr>
	<tr>
		<td>회원등급</td>
		<td>
			<input type="radio" name="grade" value="최우수회원"> 최우수회원 &nbsp;
			<input type="radio" name="grade" value="우수회원"> 우수회원 &nbsp;
			<input type="radio" name="grade" value="일반회원" checked> 일반회원
		</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
			<input type="file" name="attachInfo" value="-">
		</td>
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
	if(confirm('저장할까요?')) {
		document.DirForm.action = "${path}/member/chugaProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
</body>
</html>