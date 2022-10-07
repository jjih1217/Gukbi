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
		<th>순번</th>
		<th>상품이름(상품번호)</th>
		<th>상품단가</th>
		<th>수량</th>
		<th>금액</th>
		<th>회원아이디(회원번호)</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
	<c:if test="${list.size() == 0 }">
		<tr>
			<td align="center" colspan="8" height="200px">등록된 내용이 없습니다</td>
		</tr>
	</c:if>
	
	<c:set var="totalPay" value="${totalPay = 0 }" />
	<c:set var="k" value="${k = 0 }" />
	<c:forEach var="cartDto" items="${list }">
		<tr>
			<td>${cartDto.cartNo }</td>
			<td>${cartDto.productName}(${cartDto.productNo})</td>
			<td>${cartDto.productPrice }</td>
			<td>
				<input type="hidden" name="cartNo_${k }" value="${cartDto.cartNo}">
				<input type="text" name="amount_${k }" value="${cartDto.amount}">
			</td>
			<td>${cartDto.pay}</td>
			<td>${cartDto.memberName}(${cartDto.memberNo})</td>
			<td>${cartDto.regiDate}</td>
			<td>
				<a href="#" onClick="sakje('${cartDto.cartNo}')">삭제</a>
			</td>
		</tr>
		<c:set var="k" value="${k = k + 1 }" />
		<c:set var="totalPay" value="${totalPay = totalPay + cartDto.pay }"></c:set>
	</c:forEach>
	
	<tr>
		<td align="right" colspan="8">
		<c:set var="baesongMoney" value="5000"/>
			장바구니 금액 합계 : <fmt:formatNumber value="${totalPay }" pattern="#,###,###,###"/> 원<br>
			배송료 : <fmt:formatNumber value="${baesongMoney }" pattern="#,###"/>원<br>
			총합계 : <fmt:formatNumber value="${totalPay + baesongMoney }" pattern="#,###,###,###"/> 원<br>
		</td>
	</tr>
</table>
<input type="hidden" name="totalCounter" value="${k }">
</form>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	<button type="button" onClick="sujung();">수정</button>
	&nbsp;
	<button type="button" onClick="cartClear();">장바구니 비우기</button>
</div>

<form name="sakjeForm">
	<input type="hidden" name="cartNo">
</form>

<form name="clearForm">
	<input type="hidden" name="memberNo" value="${imsiMemberNo }"> <!-- 로그인한 계정 장바구니만 삭제 -->
</form>

</body>
<script>
function sujung() {
	if(confirm('수정할까요?')) {
		document.DirForm.action ="${path}/cart/sujungProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

function sakje(value1) {
	if(confirm('장바구니에서 삭제할까요?')) {
		document.sakjeForm.cartNo.value = value1;
		document.sakjeForm.action ="${path}/cart/sakjeProc";
		document.sakjeForm.method = "post";
		document.sakjeForm.submit();
	}
}

function cartClear() {
	if(confirm('장바구니를 전부 비울까요?')) {
		document.clearForm.action ="${path}/cart/cartClearProc";
		document.clearForm.method = "post";
		document.clearForm.submit();
	}
}
</script>
</html>