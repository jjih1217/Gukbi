<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>
<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	GuestBookDTO arguDto = new GuestBookDTO();
	arguDto.setNo(no);
	
	GuestBookDAO dao = new GuestBookDAO();
	GuestBookDTO dto = dao.getSelectOne(arguDto);
	
	//no는 sequence 1부터 시작
	if(dto.getNo() <= 0) {
		out.println("<script>");
		out.println("alert('존재하지 않는 내용입니다.')");
		out.println("location.href='main.jsp?menuGubun=guestBook_list';");
		out.println("</script>");
		return;
	}
%>

<h2>방명록 삭제</h2>
<form name = "sakjeForm">
<input type="text" name="no" value="<%=no %>">
<table border="1" align="center">
	<tr>
		<td>순번 : </td>
		<td><%=dto.getNo() %></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td><%=dto.getName() %></td>
	</tr>
	<tr>
		<td>이메일 : </td>
		<td><%=dto.getEmail() %></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td><input type="password" name="passwd" value=""></td>
	</tr>
	<tr>
		<td>내용 : </td>
		<td>
			<%
				//String content = dto.getContent();
				//content = content.replace("\n", "<br>");
				//out.println(content);
				
				out.println(dto.getContent().replace("\n", "<br>"));
			%>
			
		</td>
	</tr>
		<tr>
		<td colspan="2">
			<button type="button" Onclick="sakje();">삭제하기</button>
			<button type="button" Onclick="location.href='main.jsp?menuGubun=guestBook_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function sakje() {
		document.sakjeForm.action = "mainProc.jsp?menuGubun=guestBook_sakjeProc";
		document.sakjeForm.method = "post";
		document.sakjeForm.submit();
}
</script>

