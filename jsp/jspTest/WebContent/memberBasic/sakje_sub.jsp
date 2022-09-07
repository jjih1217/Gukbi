<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="memberBasic.MemberBasicDAO"%>
<%@page import="memberBasic.MemberBasicDTO"%>
    
<% 
	String no_ = request.getParameter("no");

	int failCounter = 0;
	//공백체크
	if(no_ == null || no_.trim().equals("")) { failCounter++; }
	
	//숫자체크
	int no = 0;
	try {
		no = Integer.parseInt(no_);
	} catch (Exception e) {
		//e.printStackTrace();
		no = 0;
	}
	
	if(no <= 0) { failCounter ++; }
	
	if(failCounter > 0) {
		out.println("<script>");
		out.println("alert('정상적인 접속이 아닙니다')");
		//out.println("location.href= 'list.jsp';");
		out.println("</script>");
		return;
	}
	
	MemberBasicDTO arguDto = new MemberBasicDTO();
	arguDto.setNo(no);
	
	MemberBasicDAO dao = new MemberBasicDAO();
	MemberBasicDTO resultDto = dao.getSelectOne(arguDto);
%>

<h2>회원삭제</h2>
<form name="sakjeForm">
<input type="hidden" name="no" value="<%=resultDto.getNo() %>">
<table border="1">
	<tr>
		<td>아이디</td>
		<td><%=resultDto.getId() %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=resultDto.getName() %></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><%=resultDto.getPhone() %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=resultDto.getEmail() %></td>
	</tr>
	<tr>
		<td>주민번호 </td>
		<td><%=resultDto.getJumin() %></td>
	</tr>
	<tr>
		<td>주소 </td>
		<td>(<%=resultDto.getJuso1() %>) <%=resultDto.getJuso2() %> <%=resultDto.getJuso3() %> <%=resultDto.getJuso4() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="sakje();">삭제하기</button>
		</td>
	</tr>
</table>
</form>

<script>
function sakje() {
	if(confirm('삭제하시겠습니까?')) {
		document.sakjeForm.action = "sakjeProc.jsp";
		document.sakjeForm.method = "post";
		document.sakjeForm.submit();
	}
}
</script>

<%@ include file = "_inc_daumApi.jsp" %>
<!--<jsp:include page="_inc_daumApi.jsp" flush="true"></jsp:include> 스크립트기때문에 동작함 -->