
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>

<%@page import="java.sql.Date"%>

<%@page import="bookProfile.model.dto.BookProFileDTO"%>
<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>


<%
	BookInfoDAO dao = new BookInfoDAO();
	ArrayList<BookInfoDTO> list = dao.getSelectAll();
	
	int totalRecord = list.size();
	
	BookAuthorDTO authorDto = new BookAuthorDTO();
	BookAuthorDAO authorDao = new BookAuthorDAO();
	
	BookProFileDTO profileDto = new BookProFileDTO();
	BookProfileDAO profileDao = new BookProfileDAO();
%>


<h2>도서 목록</h2>

<table border="1" width ="80%" align="center">
	<tr>
		<th>순번</th>
		<th>제목</th>
		<th>저자</th>
		<th>발행일</th>
		<th>분류</th>
		<th>등록일</th>
	</tr>
	
	<% if (totalRecord==0) { %>
		<tr>
			<td colspan="6" height="200px" align="center">등록된 내용이 없습니다.</td>
		</tr>
	<% } %>
	
	
	<% 
		int num = totalRecord;
		for(int i=0; i<list.size(); i++) {
			BookInfoDTO dto = list.get(i);
			
			Date created_ = dto.getCreated();
			String created = String.valueOf(created_);
			
	%>
			<tr>
				<td><%=num %></td>
				<td><a href="#" onclick="move('view.jsp','<%=dto.getInfoNo() %>');"><%=dto.getSubject() %></a></td>
				<% 
					authorDto.setAuthorNo(dto.getAuthorNo());
					BookAuthorDTO athourResult = authorDao.getSelectOne(authorDto);
					
					profileDto.setProfileNo(dto.getProfileNo());
					BookProFileDTO profileResult = profileDao.getSelectOne(profileDto);
				%>
				<td><%=athourResult.getAuthor() %></td>
				<td><%=dto.getCreated() %></td>
				<td><%=profileResult.getProfile() %></td>
				<td><%=dto.getRegiDate() %></td>
			</tr>
	<%
			num--;
		}
	%>
	
</table>

<div style="border: 0px solid blue; width:80%; margin-top:10px; margin-bottom:10px;" align="right">
	|
	<a href="#" onclick="move('list.jsp','');">목록</a>
	|
	<a href="#" onclick="move('chuga.jsp','');">등록</a>
	|
</div>

<script>
function move(value1,value2){
	location.href = value1 + '?infoNo=' + value2;
}
</script>