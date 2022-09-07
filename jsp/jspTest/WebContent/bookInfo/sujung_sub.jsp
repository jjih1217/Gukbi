

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>

<%@page import="java.util.ArrayList"%>

<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>  
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>

<%@page import="bookProfile.model.dto.BookProFileDTO"%>
<%@page import="bookProfile.model.dao.BookProfileDAO"%>

<%
	String infoNo_ = request.getParameter("infoNo");
	int infoNo = Integer.parseInt(infoNo_);
	
	BookInfoDTO arguDto = new BookInfoDTO();
	arguDto.setInfoNo(infoNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	BookInfoDTO resultDto = dao.getSelectOne(arguDto);
	
	BookAuthorDAO authorDao = new BookAuthorDAO();
	ArrayList<BookAuthorDTO> authorList = authorDao.getSelectAll();
	
	BookProfileDAO profileDao = new BookProfileDAO();
	ArrayList<BookProFileDTO> profileList = profileDao.getSelectAll();
	
%>

<h2>도서정보수정</h2>

<form name="DirForm">
<input type="hidden" name="infoNo" id="infoNo" value="<%=infoNo %>">
<table border="1" width="60%" align="center">
	<tr>
		<td>도서명</td>
		<td><input type="text" name="subject" id="subject" value="<%=resultDto.getSubject() %>"></td>
	</tr>
	<tr>
		<td>created</td>
		<td><input type="text" name="created" id="created" value="<%=resultDto.getCreated() %>"></td>
	</tr>
	<tr>
		<td>저자</td>
		<td>
			<select name="authorNo">
			<option value="" selected>-- 선택하세요 --</option>
			<%
				for (int i=0; i<authorList.size(); i++) {
					BookAuthorDTO authorDto = authorList.get(i);
					
					if( authorDto.getAuthorNo() == resultDto.getAuthorNo()) { %>
						<option value="<%=authorDto.getAuthorNo() %>" selected><%=authorDto.getAuthor() %></option>
					<%
							} else {  
					%>
								<option value="<%=authorDto.getAuthorNo() %>"><%=authorDto.getAuthor() %></option>
					<% 
						}
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
					if( profileDto.getProfileNo() == resultDto.getProfileNo()) {
						selectedValue = "selected";
					}
			%>
				<option value="<%=profileDto.getProfileNo() %> <%=selectedValue %>"><%=profileDto.getProfile() %></option>
			<%
				}
			%>
			</select>
		
		</td>
	</tr>
</table>

<div style="width: 60%; margin: 10px 0;" align="right">
	<button type="button" onClick="formSubmit();">수정하기</button>
	<button type="button" onClick="location.href='list.jsp';">목록</button>
</div>

</form>

<script>
function formSubmit(){
	document.DirForm.action = "sujungProc.jsp";
	document.DirForm.method = "post";
	document.DirForm.submit();
}
</script>