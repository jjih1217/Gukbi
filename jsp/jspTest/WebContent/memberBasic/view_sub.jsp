<!-- WebContent/memberBasic/view_sub.jsp -->
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

<h2>회원상세보기</h2>
<table border="1" width="70%;">
	<tr>
		<td>아이디</td>
		<td><%=resultDto.getId() %></td>
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
		<td><%=resultDto.getJumin().substring(0,6) %>*******</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>(<%=resultDto.getJuso1() %>) <%=resultDto.getJuso2() %> <%=resultDto.getJuso3() %> <%=resultDto.getJuso4() %> </td>
	</tr>
	<tr>	
		<td>등록일</td>
		<td><%=resultDto.getRegiDate() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="chuga();">가입하기</button>
		</td>
	</tr>
</table>

<div style="border : 0px solid blue; width: 70%; margin-top: 10px;" align="right">
	<button type="button" onClick="move('list.jsp', '');">목록</button>
	<button type="button" onClick="move('chuga.jsp', '');">등록</button>
	<button type="button" onClick="move('sujung.jsp', '<%=no %>');">수정</button>
	<button type="button" onClick="move('sakje.jsp', '<%=no %>');">삭제</button>
</div>

<script>
function move(value1, value2) {
	location.href = value1 + '?no=' + value2; //get 방식

}
</script>

