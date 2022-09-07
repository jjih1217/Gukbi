

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>

<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>  
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>

<%@page import="bookProfile.model.dto.BookProFileDTO"%>
<%@page import="bookProfile.model.dao.BookProfileDAO"%>


<%
	BookAuthorDAO authorDao = new BookAuthorDAO();
	ArrayList<BookAuthorDTO> authorList = authorDao.getSelectAll();
	
	BookProfileDAO profileDao = new BookProfileDAO();
	ArrayList<BookProFileDTO> profileList = profileDao.getSelectAll();
%>

<h2>도서정보등록</h2>

<form name="DirForm">
<table border="1" width="60%" align="center">
	<tr>
		<td>도서제목</td>
		<td><input type="text" name="subject" id="subject"></td>
	</tr>
	<tr>
		<td>발행일</td>
		<td><input type="date" name="created" id="created"></td>
	</tr>
	<tr>
		<td>저자</td>
		<td>
			<select name="authorNo">
			<option value="" selected>-- 선택하세요 --</option>
			<%
				for (int i=0; i<authorList.size(); i++) {
					BookAuthorDTO authorDto = authorList.get(i);
					
					String selectedValue = "";
					if( authorDto.getAuthorNo() == 0) {
						selectedValue = "selected";
					}
			%>
				<option value="<%=authorDto.getAuthorNo() %>" <%=selectedValue %>><%=authorDto.getAuthor() %></option>
			<%
				}
			%>
			</select>
		
		</td>
	</tr>
	<tr>
		<td>분류</td>
		<td>
			<select name="profileNo">
			<option value="" selected>-- 선택하세요 --</option>
			<%
				for (int i=0; i<profileList.size(); i++) {
					BookProFileDTO profileDto = profileList.get(i);
					
					String selectedValue = "";
					if( profileDto.getProfileNo() == 0) {
						selectedValue = "selected";
					}
			%>
				<option value="<%=profileDto.getProfileNo() %>" <%=selectedValue %>><%=profileDto.getProfile() %></option>
			<%
				}
			%>
			</select>
		
		</td>
	</tr>
</table>

<div style="width: 60%; margin: 10px 0;" align="right">
	<button type="button" onClick="formSubmit();">저장하기</button>
	<button type="button" onClick="location.href='list.jsp';">목록</button>
</div>

</form>

<script>
function formSubmit(){
	document.DirForm.action = "chugaProc.jsp";
	document.DirForm.method = "post";
	document.DirForm.submit();
}
</script>