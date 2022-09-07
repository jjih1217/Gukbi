<%@page import="bookProfile.model.dto.BookProFileDTO"%>
<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	BookAuthorDAO authorDao = new BookAuthorDAO();
	ArrayList<BookAuthorDTO> authorList = authorDao.getSelectAll();
	
	int author_Count = authorList.size();
	
	BookProfileDAO profileDao = new BookProfileDAO();
	ArrayList<BookProFileDTO> profileList = profileDao.getSelectAll();
	
	int profile_Count = profileList.size();
%>


    
<h2>도서등록</h2>

<form name="DirForm">
<table border ="1">
	<tr>
		<td>제목 : </td>
		<td><input type="text" name="subject" id="subject"></td>
	</tr>
	<tr>
		<td>저자 : </td>
		<td>
			<select name="authorNo">
				<option value="" selected>--선택하세요--</option>
				<% for(int i=0; i<author_Count; i++) { %>
					<option value="<%=authorList.get(i).getAuthorNo() %>"><%=authorList.get(i).getAuthor() %></option>
				<% } %>
			</select>
		</td>
	</tr>
	<tr>
		<td>발행일 : </td>
		<td><input type="date" name="created" id="created"></td>
	</tr>
	<tr>
		<td>분류 : </td>
		<td>
			<select name="profileNo">
				<option value="" selected>--선택하세요--</option>
				<% for(int i=0; i<profile_Count; i++) { %>
					<option value="<%=profileList.get(i).getProfileNo() %>"><%=profileList.get(i).getProfile() %></option>
				<% } %>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onclick="formSubmit();">저장하기</button>
			<button type="button" onclick="location.href='list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function formSubmit() {
	if(confirm('저장할까요?')){
		document.DirForm.action="chugaProc.jsp";
		document.DirForm.method="post";
		document.DirForm.submit();
	}
}
</script>