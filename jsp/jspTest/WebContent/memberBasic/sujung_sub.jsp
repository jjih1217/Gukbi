<!-- WebContent/memberBasic/sujung_sub.jsp -->
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

<h2>회원수정</h2>
<form name="sujungForm">
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
		<td><input type="text" name="phone" value="<%=resultDto.getPhone() %>"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" value="<%=resultDto.getEmail() %>"></td>
	</tr>
	<tr>
		<td>주민번호 </td>
		<td><%=resultDto.getJumin() %></td>
	</tr>
	<tr>
		<td>현재주소 </td>
		<td>(<%=resultDto.getJuso1() %>) <%=resultDto.getJuso2() %> <%=resultDto.getJuso3() %> <%=resultDto.getJuso4() %></td>
	</tr>
	<tr>
		<td rowspan="3">주소</td>
		<td>
			<input type="text" name="juso1" id="sample6_postcode" placeholder="우편번호">
			<button type="button" onClick="sample6_execDaumPostcode();">우편번호 찾기</button>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="juso2" id="sample6_address" placeholder="주소">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="juso3" id="sample6_detailAddress" placeholder="상세주소">
			<input type="text" name="juso4" id="sample6_extraAddress" placeholder="참고항목">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="sujung();">수정하기</button>
		</td>
	</tr>
</table>

<input type="hidden" name="post1" value="<%=resultDto.getJuso1() %>">
<input type="hidden" name="post2" value="<%=resultDto.getJuso2() %>">
<input type="hidden" name="post3" value="<%=resultDto.getJuso3() %>">
<input type="hidden" name="post4" value="<%=resultDto.getJuso4() %>">

</form>

<script>
function sujung() {
	if (document.sujungForm.juso1.value != "" && document.sujungForm.juso3.value != "") {
		document.sujungForm.post1.value = document.sujungForm.juso1.value;
		document.sujungForm.post2.value = document.sujungForm.juso2.value;
		document.sujungForm.post3.value = document.sujungForm.juso3.value;
		document.sujungForm.post4.value = document.sujungForm.juso4.value;
	}
	
	
	if(confirm('수정하시겠습니까?')) {
		document.sujungForm.action = "sujungProc.jsp";
		document.sujungForm.method = "post";
		document.sujungForm.submit();
	}
}
</script>

<%@ include file = "_inc_daumApi.jsp" %>
<!--<jsp:include page="_inc_daumApi.jsp" flush="true"></jsp:include> 스크립트기때문에 동작함 -->