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
<table border="1" width="80%">
	<tr>
		<th>상품번호</th>
		<th>상품이미지</th>
		<th>상품이름</th>
		<th>상품가격</th>
		<th>제조사</th>
		<th>첨부파일</th>
		<th>등록일</th>
	</tr>
	<c:if test="${list.size() == 0 }">
		<tr>
			<td align="center" colspan="7" height="200px">등록된 내용이 없습니다</td>
		</tr>
	</c:if>
	
	<c:forEach var="productDto" items="${list }">
		<tr>
			<td>${productDto.productNo }</td>
			<td>
				<c:choose>
					<c:when test="${productDto.attachInfo == '-|-|-' }">
						&nbsp;
					</c:when>
					<c:otherwise>
						<c:set var="tempArray1" value="${fn:split(productDto.attachInfo, ',') }"></c:set>
						<c:set var="temp1" value="${tempArray1[0]}"></c:set>
						<c:set var="temp2" value="${tempArray1[1]}"></c:set>
						<img src="${path }/attach${path}/product/${temp2}" alt="${tempArray1[0]}" title="${productDto.productName }" style="width: 50px; height: 50px">
					</c:otherwise>
				</c:choose>
			</td>
			<td>
				<a href="#" onClick="move('view','${productDto.productNo}')">${productDto.productName}</a>
			</td>
			<td>${productDto.productPrice}</td>
			<td>${productDto.vendorName} (${productDto.vendorNo})</td>
			<td>
				<c:if test="${productDto.attachInfo == '-|-|-' }">
					X
				</c:if>
				<c:if test="${productDto.attachInfo != '-|-|-' }">
					O
				</c:if>
			</td>
			<td>${productDto.regiDate} <br>
			<fmt:formatDate value="${productDto.regiDate }" pattern="yyyy-MM-dd"/><br>
			<fmt:formatDate value="${productDto.regiDate }" pattern="yyyy-MM-dd HH:mm:ss"/>
			</td>
		</tr>
	</c:forEach>
</table>
<div style="border: 0px solid red; padding-top: 20px; width: 80%" align="right">
	|
	<a href="${path }/product/list">전체목록</a>
	|
	<a href="#" onClick="move('list','');">목록</a>
	|
	<a href="#" onClick="move('chuga','');">등록</a>
	|
	<a href="#" onClick="move('chugaAttach','');">등록(Attach)</a>
	|
</div>

<script>
function move(value1, value2){
	location.href="${path}/product/" + value1 + '?productNo=' + value2;
}
</script>
</body>
</html>