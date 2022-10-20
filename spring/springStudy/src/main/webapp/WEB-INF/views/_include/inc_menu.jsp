<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div style="text-align: right">
	<c:choose>
		<c:when test="${sessionScope.sessionNo == null || sessionScope.sessionNo == ''}">
			<a href="${path }/member/login">로그인</a>
			<c:set var="imsiMemberNo" value="${imsiMemberNo = 0 }"></c:set>
		</c:when>
		<c:otherwise>
			<a href="${path }/member/logout">로그아웃</a>
			<c:set var="imsiMemberNo" value="${imsiMemberNo = sessionScope.sessionNo }"></c:set>
		</c:otherwise>
	</c:choose>
	
</div>
|
<a href="${path }">Home</a>
|
<a href="${path }/test/test01">test01</a>
|
<a href="${path }/test/test02">test02</a>
|
<a href="${path }/test/test03">test03</a>
|
<a href="${path }/test/test04">test04</a>
|
<a href="${path }/test/test05">test05</a>
|
<a href="${path }/test/test06">test06</a>
|
<a href="${path }/test/test07">test07</a>
|
<a href="${path }/test/test08">test08(ajax)</a>
|
<a href="${path }/test/test09">test09(ajax)</a>
|
<a href="${path }/test/test10">test10</a>
|
<br>
|
<a href="${path }/member/list">회원관리</a>
|
<a href="${path }/memo/list">메모장</a>
|
<a href="${path }/guestBook/list">방명록</a>
|
<a href="${path }/product/list">상품관리</a>
|
<a href="${path }/cart/list">장바구니</a>
|
<br>
<a href="${path }/memberNew/list">회원관리(new)</a>
|

<hr>
<!-- controller -> (service) -> DAO -> mapper -->