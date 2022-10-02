<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/inc_header.jsp" %>  

<div class="header">
	<div class="global">
		<div>접속IP : ${ip }</div>
		<div>
			<c:choose>
				<c:when test="${sessionScope.sessionNo == null || sessionScope.sessionNo == '' || sessionScope.sessionNo == 0 }">	
					<a href="${path}/noLogin_servlet/noLogin_login.do" class="login">로그인</a>
				</c:when>
				<c:otherwise>
					${sessionScope.sessionName } 님!
					<%-- <a href="${path }/member_servlet/member_sujung.do?no=${sessionNo}">회원정보수정</a> --%>
					<a href="${path }/member_servlet/member_sujung.do">회원정보수정</a>
					<a href="${path }/member_servlet/member_sakje.do">회원탈퇴</a>
					<a href="${path }/noLogin_servlet/noLogin_logout.do" class="logout">로그아웃</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<nav>
		<ul>
			<li id="home">
				<a href="${path }/dashBoard_index.do">Home</a>
			</li>
			<li id="home">
				<a href="${path }/member_servlet/member_list.do">회원관리</a>
			</li>
			<li id="home">
				<a href="${path }/memo_servlet/memo_list.do">메모장</a>
			</li>
			<li id="home">
				<a href="${path }/memoMybatis_servlet/memoMybatis_list.do">메모장<br>(Mybatis)</a>
			</li>
			<li id="home">
				<a href="${path }/guestBook_servlet/guestBook_list.do">방명록</a>
			</li>
			<li id="home">
				<a href="${path }/guestBookMybatis_servlet/guestBookMybatis_list.do">방명록<br>(Mybatis)</a>
			</li>
			<li id="home">
				<a href="${path }/board_servlet/board_list.do">게시판<br>(Mybatis)</a>
			</li>
			<li id="home">
				<a href="#">Mall<br>(상품관리)</a>
			</li>
			<li id="home">
				<a href="#">Mall<br>(제조사)</a>
			</li>
			<li id="home">
				<a href="#">Mall<br>(쇼핑몰)</a>
			</li>
			<li id="home">
				<a href="#">Chart</a>
			</li>
		</ul>
	</nav>
</div>




<%-- <table border="0" align="center" width="80%">
	<tr>
		<td colspan="3" align="left">
			location : project> ${folderName } > ${fileName }
			접속IP : ${ip }
		<br>
		${referer }
		</td>
		<td colspan="6" align="right">
		<c:choose>
			<c:when test="${sessionScope.sessionNo == null || sessionScope.sessionNo == '' || sessionScope.sessionNo == 0 }">	
				<a href="${path}/noLogin_servlet/noLogin_login.do">로그인</a>
			</c:when>
			<c:otherwise>
				${sessionScope.sessionName } 님!
				<a href="${path }/member_servlet/member_sujung.do?no=${sessionNo}">회원정보수정</a>
				<a href="${path }/member_servlet/member_sujung.do">회원정보수정</a>
				<a href="${path }/member_servlet/member_sakje.do">회원탈퇴</a>
				<a href="${path }/noLogin_servlet/noLogin_logout.do">로그아웃</a>
			</c:otherwise>
		</c:choose>
		</td>
	</tr>
	<tr align="center">
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
			<a href="${path }/memoMybatis_servlet/memoMybatis_list.do">메모장<br>(Mybatis)</a>
		</td>
		<td style="padding: 0px 10px;" id="guestBook">
			<a href="${path }/guestBook_servlet/guestBook_list.do">방명록</a>
		</td>
		<td style="padding: 0px 10px;" id="guestBookMybatis">
			<a href="${path }/guestBookMybatis_servlet/guestBookMybatis_list.do">방명록<br>(Mybatis)</a>
		</td>
		<td style="padding: 0px 10px;" id="board">
			<a href="${path }/board_servlet/board_list.do">게시판<br>(Mybatis)</a>
		</td>
		<td style="padding: 0px 10px;" id="shopProduct">
			<a href="#">Mall<br>(상품관리)</a>
		</td>
		<td style="padding: 0px 10px;" id="shopVender">
			<a href="#">Mall<br>(제조사)</a>
		</td>
		<td style="padding: 0px 10px;" id="shopMall">
			<a href="#">Mall<br>(쇼핑몰)</a>
		</td>
		<td style="padding: 0px 10px;" id="chart">
			<a href="#">Chart</a>
		</td>
	</tr>
</table> --%>