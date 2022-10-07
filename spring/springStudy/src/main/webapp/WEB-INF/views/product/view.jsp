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
		<td width="100">상품번호</td>
		<td>${dto.productNo}</td>
	</tr>
	<tr>
		<td>상품이름</td>
		<td>${dto.productName}</td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td>${dto.productPrice}</td>
	</tr>
	<tr>
		<td>상품설명</td>
		<td id="content">${dto.productDescription}</td>
	</tr>
	<tr>
		<td>제조사(제조사번호)</td>
		<td>${dto.vendorName} (${dto.vendorNo})</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${dto.regiDate}</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
			<%-- <c:choose>
				<c:when test="${dto.attachInfo == '-' }">
					&nbsp;
				</c:when>
				<c:otherwise>
					<c:set var="tempArray1" value="${fn:split(dto.attachInfo, ',') }"></c:set>
					<c:set var="temp1" value="${tempArray1[0]}"></c:set>
					<c:set var="temp2" value="${tempArray1[1]}"></c:set>
					<img src="${path }/attach${path}/product/${temp2}" alt="${tempArray1[0]}" title="${dto.productName }" style="width: 50px; height: 50px">
				</c:otherwise>
			</c:choose> --%>
			
			<%-- ${fn:replace(dto.attachInfo, '|', '<br>') }
			<hr> --%>
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
							<a href="#" onClick="attachDownLoad('${dto.productNo }','${i }');"><img src="${path }/attach${path}/product/${temp2}" alt="${dto.productName }" title="${dto.productName }" style="width: 50px; height: 50px"></a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<form name="cartForm">
				<input type="hidden" name="productNo" value="${dto.productNo }">
				<input type="hidden" name="memberNo" value="${imsiMemberNo}">
				<select name="amount">
					<c:forEach begin="1" end="10" var="i">
						<option value="${i }">${i }</option>
					</c:forEach>
				</select> &nbsp;
				<button type="button" onClick="cartAdd();">장바구니 담기</button>
			</form>
		</td>
		
	</tr>
</table>
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="${path }/product/list">전체목록</a>
	|
	<a href="#" onClick="move('list','');">목록</a>
	|
	<a href="#" onClick="move('chuga','');">등록</a>
	|
	<a href="#" onClick="move('chugaAttach','');">등록(Attach)</a>
	|
	<a href="#" onClick="move('sujung','${dto.productNo}');">수정</a>
	|
	<a href="#" onClick="move('sakje','${dto.productNo}');">삭제</a>
	|
</div>

<script>
$(document).ready(function(){
	var content = $("#content").text().replace(/(?:\r\n|\r|\n)/g,'<br/>');
	$("#content").html(conent);
})

function move(value1, value2){
	location.href="${path}/product/" + value1 + '?productNo=' + value2;
}
function cartAdd() {
	if(confirm('장바구니에 담을까요?')) {
		document.cartForm.action = "${path}/cart/chugaProc";
		document.cartForm.method = "post";
		document.cartForm.submit();
	}
}

function attachDownLoad(value1, value2) {
	location.href = "${path}/product/download?productNo=" + value1 + "&num=" + value2;
}
</script>
</body>
</html>