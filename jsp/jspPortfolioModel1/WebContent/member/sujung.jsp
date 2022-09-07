<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "_inc_top.jsp" %> <!-- LOGIN CHK -->

<%@page import="member.model.dao.MemberDAO"%>
<%@page import="member.model.dto.MemberDTO"%>
   
<%
	String no_ = request.getParameter("no");
	//null처리
	int no = Integer.parseInt(no_);
	
	MemberDTO arguDto = new MemberDTO();
	arguDto.setNo(no);
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = dao.getSelectOne(arguDto);
	
	//값이 존재하지 않을때
	if(dto.getNo() <= 0) {
		out.println("<script>alert('존재하지 않는 회원입니다.'); location.href='main.jsp?menuGubun=member_list';</script>");
		return;
	}
%> 

<h2>회원수정</h2>
<form name = "sujungForm">
<input type="text" name="no" value="<%=no %>">
<table border="1" align="center">
	<tr>
		<td>아이디 : </td>
		<td><%=dto.getId() %></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td><%=dto.getName() %></td>
	</tr>
	<tr>
		<td>연락처 : </td>
		<td><input type="text" name="phone" value="<%=dto.getPhone() %>"></td>
	</tr>
	<tr>
		<td>이메일 : </td>
		<td><input type="text" name="email" value="<%=dto.getEmail() %>"></td>
	</tr>
	<tr>
		<td>주민번호 : </td>
		<td><%=dto.getJumin() %></td>
	</tr>
	<tr>
		<td>주소</td>
		<td>
			<input type="text" name="juso1" id="sample6_postcode" placeholder="우편번호" value="<%=dto.getJuso1() %>">
			<button type="button" onClick="sample6_execDaumPostcode();">우편번호 찾기</button><br>
			<input type="text" name="juso2" id="sample6_address" placeholder="주소" value="<%=dto.getJuso2() %>">
			<input type="text" name="juso3" id="sample6_detailAddress" placeholder="상세주소" value="<%=dto.getJuso3() %>">
			<input type="text" name="juso4" id="sample6_extraAddress" placeholder="참고항목" value="<%=dto.getJuso4() %>">
		</td>
	</tr>
	<tr>
		<td>회원등급</td>
		<td>
		<%--
			<% if(dto.getGrade().equals("최우수회원")) { %>
				<input type="radio" name="grade" value="최우수회원" checked> 최우수회원 &nbsp;
				<input type="radio" name="grade" value="우수회원"> 우수회원 &nbsp;
				<input type="radio" name="grade" value="일반회원"> 일반회원
				
			<% } else if (dto.getGrade().equals("우수회원")) { %>
			
				<input type="radio" name="grade" value="최우수회원"> 최우수회원 &nbsp;
				<input type="radio" name="grade" value="우수회원" checked> 우수회원 &nbsp;
				<input type="radio" name="grade" value="일반회원"> 일반회원
				
			<% } else if (dto.getGrade().equals("일반회원")) { %>
			
				<input type="radio" name="grade" value="최우수회원"> 최우수회원 &nbsp;
				<input type="radio" name="grade" value="우수회원"> 우수회원 &nbsp;
				<input type="radio" name="grade" value="일반회원" checked> 일반회원
				
			<% } %>	
		 --%>
			
			<input type="radio" name="grade" value="최우수회원" <% if(dto.getGrade().equals("최우수회원")){out.println("checked");} %>> 최우수회원 &nbsp;
			<input type="radio" name="grade" value="우수회원" <% if(dto.getGrade().equals("우수회원")){out.println("checked");} %>> 우수회원 &nbsp;
			<input type="radio" name="grade" value="일반회원" <% if(dto.getGrade().equals("일반회원")){out.println("checked");} %>> 일반회원
			
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" Onclick="sujung();">수정하기</button>
			<button type="button" Onclick="location.href='main.jsp?menuGubun=member_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function sujung() {
		document.sujungForm.action = "mainProc.jsp?menuGubun=member_sujungProc";
		document.sujungForm.method = "post";
		document.sujungForm.submit();
}
</script>

<jsp:include page="_inc_daumApi.jsp" flush="true"></jsp:include>