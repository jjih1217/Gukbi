<%@page import="bookProfile.model.dto.BookProFileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String infoNo_ = request.getParameter("infoNo");
	int infoNo = Integer.parseInt(infoNo_);
	
	BookInfoDTO arguDto = new BookInfoDTO();
	arguDto.setInfoNo(infoNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	ArrayList<BookInfoDTO> list = dao.getSelectAll();
	int totalRecord = list.size();

	BookInfoDTO resultDto = dao.getSelectOne(arguDto);
	
	BookAuthorDTO authorDto = new BookAuthorDTO();
	authorDto.setAuthorNo(resultDto.getAuthorNo());
	
	
	BookAuthorDAO authorDao = new BookAuthorDAO();
	ArrayList<BookAuthorDTO> authorList = authorDao.getSelectAll();
	
	BookAuthorDTO authorResultDto = authorDao.getSelectOne(authorDto);
	
	BookProFileDTO profileDto = new BookProFileDTO();
	profileDto.setProfileNo(resultDto.getProfileNo());
	
	BookProfileDAO profileDao = new BookProfileDAO();
	ArrayList<BookProFileDTO> profileList = profileDao.getSelectAll();
	BookProFileDTO profileResultDto = profileDao.getSelectOne(profileDto);
	
	
%>
    
<h2>도서 수정</h2>

<form name="sujungForm">
<table border ="1">
	<tr>
		<td>제목 : </td>
		<td><input type="text" name="subject" id="subject" value="<%=resultDto.getSubject() %>"></td>
	</tr>
	<tr>
		<td>저자 : </td>
		<td>
			<select name="authorNo" id="authorNo">
				<% 
					for(int i=0; i<authorList.size(); i++) { 
						if(resultDto.getAuthorNo()==authorList.get(i).getAuthorNo()){
				%>
					<option value="<%=authorList.get(i).getAuthorNo() %>"  selected><%=authorList.get(i).getAuthor() %></option>
				<%		
						} else {
				%>
					<option value="<%=authorList.get(i).getAuthorNo() %>"><%=authorList.get(i).getAuthor() %></option>
					<%} %>
				<% } %>
			</select>
		</td>
	</tr>
	<tr>
		<td>발행일 : </td>
		<td><input type="date" name="created" id="created" value="<%=resultDto.getCreated() %>"></td>
	</tr>
	<tr>
		<td>분류 : </td>
		<td>
			<select name="profileNo">
				<% 
					for(int i=0; i<profileList.size(); i++) { 
						if(resultDto.getProfileNo()==profileList.get(i).getProfileNo()){
				%>
					<option value="<%=profileList.get(i).getProfileNo() %>" selected><%=profileList.get(i).getProfile() %></option>
				<%		
						}else{
				%>
					<option value="<%=profileList.get(i).getProfileNo() %>"><%=profileList.get(i).getProfile() %></option>
					<% } %>
				<% } %>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onclick="formSubmit();">수정하기</button>
			<button type="button" onclick="location.href='list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
<input type="text" name="infoNo" value="<%=resultDto.getInfoNo()%>">
</form>

<script>
function formSubmit() {
	if(confirm('수정할까요?')){
		document.sujungForm.action="sujungProc.jsp";
		document.sujungForm.method="post";
		document.sujungForm.submit();
	}
}
</script>