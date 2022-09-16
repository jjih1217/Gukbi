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

<%-- <h2>07Result.do</h2>
<table border="1">
	<tr>
		<td>이름 : </td>
		<td>${name }</td>
	</tr>
	<tr>
		<td>주소 : </td>
		<td>${address }</td>
	</tr>
	<tr>
		<td>나이 : </td>
		<td>${age }</td>
	</tr>
</table> --%>

<form name="DirForm">
<input type="text" name="name" value="${name }">
<input type="text" name="address" value="${address }">
<input type="text" name="age" value="${age }">
</form>
<script>
function autoMove() {
	//location.href='/jspStudyModel2/exam_servlet/07.do?name=${name }&address=${address }&age=${age }';
	
	document.DirForm.action = "/jspStudyModel2/exam_servlet/07.do";
	document.DirForm.method = "post";
	document.DirForm.submit();
}
autoMove();
</script>
</body>
</html>