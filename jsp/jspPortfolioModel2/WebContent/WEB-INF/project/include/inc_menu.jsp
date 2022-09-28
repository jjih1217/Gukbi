<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/inc_header.jsp" %>  

<table border="0" align="center" width="80%">
	<tr>
		<td colspan="3" align="left">
			<%-- location : project> ${folderName } > ${fileName } --%>
			접속IP : ${ip }
		<br>
		<%-- ${referer } --%>
		</td>
		<td colspan="6" align="right">
		<c:choose>
			<c:when test="${sessionScope.sessionNo == null || sessionScope.sessionNo == '' || sessionScope.sessionNo == 0 }">	
				<a href="${path}/noLogin_servlet/noLogin_login.do">로그인</a>
			</c:when>
			<c:otherwise>
				${sessionScope.sessionName } 님!
				<%-- <a href="${path }/member_servlet/member_sujung.do?no=${sessionNo}">회원정보수정</a> --%>
				<a href="${path }/member_servlet/member_sujung.do">회원정보수정</a>
				<a href="${path }/member_servlet/member_sakje.do">회원탈퇴</a>
				<a href="${path }/noLogin_servlet/noLogin_logout.do">로그아웃</a>
			</c:otherwise>
		</c:choose>
		</td>
	</tr>
	<tr>
		<td style="padding: 0px 10px;" id="home">
			<a href="${path }/dashBoard_index.do">Home</a>
		</td>
		<td style="padding: 0px 10px;" id="member">
			<a href="${path }/member_servlet/member_list.do">회원관리</a>
		</td>
		<td style="padding: 0px 10px;" id="memo">
			<a href="${path }/memo_servlet/memo_list.do">메모장</a>
		</td>
		<td style="padding: 0px 10px;" id="memoMybatis">
			<a href="${path }/memoMybatis_servlet/memoMybatis_list.do">메모장(Mybatis)</a>
		</td>
		<td style="padding: 0px 10px;" id="guestBook">
			<a href="#">방명록</a>
		</td>
		<td style="padding: 0px 10px;" id="board">
			<a href="#">게시판</a>
		</td>
		<td style="padding: 0px 10px;" id="shopProduct">
			<a href="#">Mall(상품관리)</a>
		</td>
		<td style="padding: 0px 10px;" id="shopVender">
			<a href="#">Mall(제조사)</a>
		</td>
		<td style="padding: 0px 10px;" id="shopMall">
			<a href="#">Mall(쇼핑몰)</a>
		</td>
		<td style="padding: 0px 10px;" id="chart">
			<a href="#">Chart</a>
		</td>
	</tr>
</table>