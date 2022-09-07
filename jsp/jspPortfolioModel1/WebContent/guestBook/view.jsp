<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>

<%
	request.setCharacterEncoding("UTF-8");

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

<h2>방명록 상세보기</h2>
<table border="1" align="center"  width="80%">
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
		<td>내용 : </td>
		<td>
			<%=dto.getContent() %>
			<hr>
			<%
				String content = dto.getContent();
				content = content.replace("\n", "<br>");
				out.println(content);
			%>
		</td>
	</tr>
	<tr>
		<td>등록일 : </td>
		<td><%=dto.getRegiDate() %></td>
	</tr>
</table>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="move('guestBook_list','');">목록</a>
	|
	<a href="#" onClick="move('guestBook_chuga','');">등록</a>
	|
	<a href="#" onClick="move('guestBook_sujung','<%=dto.getNo() %>');">수정</a>
	|
	<a href="#" onClick="move('guestBook_sakje','<%=no %>');">삭제</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href = 'main.jsp?menuGubun=' + value1  + '&no=' + value2;
}
</script>
