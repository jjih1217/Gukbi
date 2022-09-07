<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="_inc_top.jsp" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
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
		<h2>상품등록</h2>
		<form name="chugaForm">
		
		<table border="1">
			<tr>
				<td>상품명: </td>
				<td>
					<input type="text" name="productName">
				</td>
			</tr>
			<tr>
				<td>상품가격: </td>
				<td>
					<input type="text" name="productPrice">
				</td>
			</tr>
			<tr>
				<td>상품내용: </td>
				<td>
					<textarea name="productContent" style="width=300px; height=300px;"></textarea>
				</td>
			</tr>
			<tr>
				<td>상품분류: </td>
				<td>
					<input type="text" name="productCategory">
				</td>
			</tr>
			<tr>
				<td>제조사: </td>
				<td>
					<input type="text" name="vendor">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onClick="chuga();">등록하기</button>
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
function chuga() {
	document.chugaForm.action = "chugaProc.jsp";
	document.chugaForm.method = "post";
	document.chugaForm.submit();
}
</script>
</body>
</html>