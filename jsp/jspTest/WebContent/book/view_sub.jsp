<!-- WebContent/book/view_sub.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="book.model.dao.BookDAO"%>
<%@page import="book.model.dto.BookDTO"%>

<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	BookDTO arguDto = new BookDTO();
	arguDto.setNo(no);
	
	BookDAO dao = new BookDAO();
	BookDTO resultDto = dao.getSelectOne(arguDto);
%>

<h2>도서상세보기</h2>

<form name="DirForm">
<table border="1" width="80%">
	<tr>
		<td>제목</td>
		<td><%=resultDto.getSubject() %></td>
	</tr>
	<tr>
		<td>저자</td>
		<td><%=resultDto.getAuthor() %></td>
	</tr>
	<tr>
		<td>발행일</td>
		<td><%=resultDto.getCreated() %></td>
	</tr>
	<tr>
		<td>분류</td>
		<td><%=resultDto.getProfile() %></td>
	</tr>
</table>

<div style="width: 80%; margin: 10px 0;" align="right">
	<button type="button" onClick="move('list.jsp','');">목록</button>
	<button type="button" onClick="move('chuga.jsp','');">등록</button>
	<button type="button" onClick="move('sujung.jsp','<%=no %>');">수정</button>
	<button type="button" onClick="move('sakje.jsp','<%=no %>');">삭제</button>
</div>

</form>

<script>
function move(value1, value2) {
	location.href = value1 + '?no=' + value2
}
</script>
