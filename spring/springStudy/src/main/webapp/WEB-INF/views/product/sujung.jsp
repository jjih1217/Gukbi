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
<input type="text" name="productNo" value="${dto.productNo }"> 
<table border="1" width="80%">
	<tr>
		<td>상품이름</td>
		<td><input type="text" name="productName" value="${dto.productName }"></td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td><input type="text" name="productPrice" value="${dto.productPrice }"></td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td><input type="text" name="productDescription" value="${dto.productDescription }"></td>
	</tr>
	<tr>
		<td>제조사</td>
		<td>
			vendorNo : <input type="text" name="vendorNo" value="${dto.vendorNo }">  <br>
			vendorName : <input type="text" name="vendorName" value="${dto.vendorName }">
		</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
			<c:set var="tempArray1" value="${fn:split(dto.attachInfo, '|')}"></c:set>
			<c:forEach var="i" begin="0" end="${fn:length(tempArray1)- 1 }" step="1">
				<c:choose>
					<c:when test="${tempArray1[i] == '-' }">
						&nbsp;
					</c:when>
					<c:otherwise>
						<c:set var="tempArray2" value="${fn:split(tempArray1[i], ',') }"></c:set>
						<c:set var="temp1" value="${tempArray2[0]}"></c:set>
						<c:set var="temp2" value="${tempArray2[1]}"></c:set>
							<img src="${path }/attach${path}/product/${temp2}" alt="${dto.productName }" title="${dto.productName }" style="width: 50px; height: 50px">
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" Onclick="save();">수정</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('수정할까요?')) {
		document.DirForm.action = "${path}/product/sujungProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
</body>
</html>