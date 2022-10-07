<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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