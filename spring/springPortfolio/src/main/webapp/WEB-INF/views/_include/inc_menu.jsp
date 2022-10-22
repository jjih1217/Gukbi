<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>

 <div class="top">
 	<div class="util">
 		<div style="text-align: right">
			<c:choose>
				<c:when test="${sessionScope.sessionNo == null || sessionScope.sessionNo == ''}">
					<c:set var="imsiMemberNo" value="${imsiMemberNo = 0 }"></c:set>
					<a href="${path }/member/login" class="login">로그인</a>
				</c:when>
				<c:otherwise>
					<c:set var="imsiMemberNo" value="${imsiMemberNo = sessionScope.sessionNo }"></c:set>
					<c:set var="imsiMemberId" value="${imsiMemberId = sessionScope.sessionId }"></c:set>
					<c:set var="imsiMemberName" value="${imsiMemberName = sessionScope.sessionName }"></c:set>
					<span class="user"><span class="bold">${imsiMemberName } (${imsiMemberId })</span> 님, 안녕하세요 </span>
					<a href="${path }/member/logout" class="logout">로그아웃</a>
					
				</c:otherwise>
			</c:choose>
		</div>
 	</div>
 	<nav>
 		<ul>
 			<li id="index">
 				<a href="${path }">Home</a>
 			</li>
 			<li id="member">
 				<a href="${path }/member/list">회원관리</a>
 			</li>
 			<%-- <li id="memo">
 				<a href="${path }/memo/list">메모장</a>
 			</li> --%>
 			<li id="notice">
 				<a href="${path }/notice/list">공지사항</a>
 			</li>
 			<li id="guestBook">
 				<a href="${path }/guestBook/list">익명게시판</a>
 			</li> 
 			<li id="board">
 				<a href="${path }/board/list">문의게시판</a>
 			</li>
 			<%-- <li id="boardChk">
 				<a href="${path }/boardChk/list">게시판관리</a>
 			</li> --%>
 			<li id="shopProduct">
 				<a href="${path }/shopProduct/list">상품관리</a>
 			</li>
 			<li id="shopVendor">
 				<a href="${path }/shopVendor/list">제조사관리</a>
 			</li>
 			<li id="vendorMall">
 				<a href="${path }/vendorMall/list">쇼핑몰</a>
 			</li>
 			<li id="chart">
 				<a href="${path }/chart/list">차트</a>
 			</li>
 		</ul>
 	</nav>
 </div>