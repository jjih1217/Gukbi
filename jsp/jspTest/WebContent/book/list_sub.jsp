<!-- WebContent/book/list_sub.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="book.model.dao.BookDAO"%>
<%@page import="book.model.dto.BookDTO"%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>

<%
	BookDAO dao = new BookDAO();
	ArrayList<BookDTO> list = dao.getSelectAll();
	
	int totalRecord = list.size();
%>

<h2>도서목록</h2>   
<table border="1" width="80%" align="center">
	<tr>
		<th>순번</th>
		<th>제목</th>
		<th>저자</th>
		<th>발행일</th>
		<th>분류</th>
		<th>등록일</th>
	</tr>
	
	<% if( totalRecord == 0) { %>
		<tr>
			<td colspan="6" height="200px" align="center">등록된 내용이  없습니다</td>
		</tr>
	<% } %>
	
	<% 
		int num = totalRecord;
		for (int i=0; i<list.size(); i++) {
			BookDTO dto = list.get(i);
			
			Date created_ = dto.getCreated();
			String created = String.valueOf(created_);
			//String created = dto.getCreated().toString();
	%>
			<tr>
				<td><%=num %></td>
				<td><a href="#" onClick="move('view.jsp','<%=dto.getNo() %>');"><%=dto.getSubject() %></a></td>
				<td><%=dto.getAuthor() %></td>
				<td><%=created %></td>
				<td><%=dto.getProfile() %></td>
				<td><%=dto.getRegiDate() %></td>
			</tr>
	<% 
			num--;
		}
	%>
</table>

<div style="width: 80%; margin: 10px 0;" align="right">
	<button type="button" onClick="move('list.jsp','');">목록</button>
	<button type="button" onClick="move('chuga.jsp','');">등록</button>
</div>

<script>
function move(value1, value2) {
	location.href = value1 + '?no=' + value2
}
</script>

