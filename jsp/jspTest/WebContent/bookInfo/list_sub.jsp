

<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.ArrayList"%>

<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>

<% 
	BookInfoDAO dao = new BookInfoDAO();
	ArrayList<BookInfoDTO> list = dao.getSelectAll();
	int totalRecord = list.size();
	
	out.println(totalRecord);
%>    

<h2>도서정보목록</h2>

<table border="1" width="80%" align="center">
	<tr>
		<th>순번</th>
		<th>도서명</th>
		<th>발행일</th>
		<th>저자</th>
		<th>분류</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
	<% if( totalRecord == 0) { %>
		<tr>
			<td colspan="7" height="200px" align="center">등록된 내용이 없습니다</td>
		</tr>
	<% } %>
	
	<%
		int num = totalRecord;
		for(int i=0; i < list.size(); i++) {
			BookInfoDTO dto = list.get(i);
			
			Date created_ = dto.getCreated();
			String created = String.valueOf(created_);
	%>
			<tr>
				<td><%=num %> (<%=dto.getInfoNo() %>)</td>
				<td><a href="#" onclick="move('view.jsp','<%=dto.getInfoNo() %>');"><%=dto.getSubject() %></a></td>
				<td><%=dto.getCreated() %></td>
				<td>
					(<%=dto.getAuthorNo() %>)
					<%=dto.getAuthor() %>
				</td>
				<td>
					(<%=dto.getProfileNo() %>)
					<%=dto.getProfile() %>
				</td>
				<td><%=dto.getRegiDate() %></td>
				<td>
					<a href="#" onClick="move('sujung.jsp','<%=dto.getInfoNo() %>')">[수정]</a>
					<a href="#" onClick="move('sakje.jsp','<%=dto.getInfoNo() %>')">[삭제]</a>
				</td>
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
	location.href= value1 + '?infoNo=' + value2;
}

</script>