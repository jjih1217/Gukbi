<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "../../_include/inc_menu.jsp" %>

<h2>08.do</h2>
<form name = "DirForm">
<table border="1">
	<tr>
		<td>이름 : </td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>주소 : </td>
		<td><input type="text" name="addr"></td>
	</tr>
	<tr>
		<td>나이 : </td>
		<td><input type="text" name="age"></td>
	</tr>
	<tr>
		<td>테스트 : </td>
		<td><input type="text" name="test"></td>
	</tr>
	<tr>
		<td>숫자1 : </td>
		<td><input type="text" name="num1"></td>
	</tr>
	<tr>
		<td>숫자2 : </td>
		<td><input type="text" name="num2"></td>
	</tr>
	<tr style="display: none">
		<td>결과 : </td>
		<td><input type="text" name="result"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="formCheck();">확인</button>
		</td>
	</tr>
</table>
</form>
<script>
function formCheck(){
	var f = document.DirForm;
	/*
	if (f.name.value == ''){
		alert('이름을 입력하세요');
		f.name.focus();
		return;
	}
	*/
	
	var result = Number(f.num1.value) + Number(f.num2.value);
	f.result.value = result;
	
	if(confirm('ok?')) {
		f.action = "${path }/exam_servlet/08Proc.do";
		f.method = "post"
		f.submit();
	}
}
</script>


</body>
</html>