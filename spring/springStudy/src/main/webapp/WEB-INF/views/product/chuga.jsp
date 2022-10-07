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
<table border="1" width="80%">
	<tr>
		<td>상품이름</td>
		<td><input type="text" name="productName"></td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td><input type="text" name="productPrice"></td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td>
			<textarea rows="" cols="" name="productDescription" style="width:100%; height: 80px;"></textarea>
		</td>
	</tr>
	<tr>
		<td>제조사</td>
		<td>
			vendorNo : <input type="text" name="vendorNo">  <br>
			vendorName : <input type="text" name="vendorName">
		</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
			<input type="text" name="attachInfo" value="-">
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
		document.DirForm.action = "${path}/product/chugaProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
</body>
</html>