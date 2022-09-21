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

<h2>09Result.do</h2>
<table border="1">
	<tr>
		<td>이름 : </td>
		<td><input type="text" name="name" value="${map.name }"></td>
	</tr>
	<tr>
		<td>국어 : </td>
		<td><input type="text" name="kor" value="${map.kor }"></td>
	</tr>
	<tr>
		<td>영어 : </td>
		<td><input type="text" name="eng" value="${map.eng }"></td>
	</tr>
	<tr>
		<td>수학 : </td>
		<td><input type="text" name="mat" value="${map.mat }"></td>
	</tr>
	<tr>
		<td>총점 : </td>
		<td><input type="text" name="tot" value="${map.tot }"></td>
	</tr>
	<tr>
		<td>평균 : </td>
		<td><input type="text" name="avg" value="${map.avg }"></td>
	</tr>
</table>

</body>
</html>