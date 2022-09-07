<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>
<%@ include file = "../_include/inc_sessionChk.jsp" %>

<table align="center" width="90%" >
	<tr>
		<td colspan="12" align="right">
			<% if(sessionNo == 0) { %>
				<a href="main.jsp?menuGubun=noLogin_login">[로그인]</a>
			<% } else { %>
				<%=sessionName %> (<%=sessionGrade %>)님 환영합니다.<a href="main.jsp?menuGubun=noLogin_logout">[로그아웃]</a>
			<% } %>
			
		</td>
	</tr>
	<tr>
		<td align="center" style="padding: 10px;" id="home">
			<a href="<%=path %>">home</a>
		</td>
		<td align="center" style="padding: 10px;" id="member">
			<a href="<%=path %>/main/main.jsp?menuGubun=member_list">회원관리</a>
		</td>
		<td align="center" style="padding: 10px;" id="memo">
			<a href="<%=path %>/main/main.jsp?menuGubun=memo_list">메모장</a>
		</td>
		<td align="center" style="padding: 10px;" id="guestBook">
			<a href="<%=path %>/main/main.jsp?menuGubun=guestBook_list">방명록</a>
		</td>
		<td align="center" style="padding: 10px;" id="boardBasic">
			<a href="<%=path %>/main/main.jsp?menuGubun=boardBasic_list">게시판(B)</a>
		</td>
		<td align="center" style="padding: 10px;" id="board">
			<a href="<%=path %>/main/main.jsp?menuGubun=board_list">게시판</a>
		</td>
		<td align="center" style="padding: 10px;" id="shopProduct">
			<a href="<%=path %>/main/main.jsp?menuGubun=shopProduct_list">몰(product)</a>
		</td>
		<td align="center" style="padding: 10px;" id="shopVendor">
			<a href="<%=path %>/main/main.jsp?menuGubun=shopVendor_list">몰(vendor)</a>
		</td>
		<td align="center" style="padding: 10px;" id="shopMall">
			<a href="<%=path %>/main/main.jsp?menuGubun=shopMall_list">몰(Mall)</a>
		</td>
		<td align="center" style="padding: 10px;" id="ShopCart">
			<a href="<%=path %>/main/main.jsp?menuGubun=shopCart_list">몰(Cart)</a>
		</td>
		<td align="center" style="padding: 10px;" id="chart">
			<a href="<%=path %>/main/main.jsp?menuGubun=chart_list">차트</a>
		</td>
		<td align="center" style="padding: 10px;" id="subBoard">
			<a href="<%=path %>/main/main.jsp?menuGubun=subBoard_list">게시판</a>
		</td>
	</tr>
</table>

<script>
function applyBgColor() {
	$("#<%=folderName %>").css("background-color","gray")
}
applyBgColor();
</script>