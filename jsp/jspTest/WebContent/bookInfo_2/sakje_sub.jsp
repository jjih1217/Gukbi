<%@page import="bookProfile.model.dto.BookProFileDTO"%>
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
	BookInfoDTO resultDto = dao.getSelectOne(arguDto);
	
	BookAuthorDTO authorDto = new BookAuthorDTO();
	authorDto.setAuthorNo(resultDto.getAuthorNo());
	
	BookAuthorDAO authorDao = new BookAuthorDAO();
	BookAuthorDTO authorResultDto = authorDao.getSelectOne(authorDto);
	
	BookProFileDTO profileDto = new BookProFileDTO();
	profileDto.setProfileNo(resultDto.getProfileNo());
	
	BookProfileDAO profileDao = new BookProfileDAO();
	BookProFileDTO profileResultDto = profileDao.getSelectOne(profileDto);
	
%>
    
<h2>도서삭제</h2>

<table border ="1" width="70%" >
	<tr>
		<td>제목 : </td>
		<td><%=resultDto.getSubject() %></td>
	</tr>
	<tr>
		<td>저자 : </td>
		<td><%=authorResultDto.getAuthor() %></td>
	</tr>
	<tr>
		<td>발행일 : </td>
		<td><%=resultDto.getCreated() %></td>
	</tr>
	<tr>
		<td>분류 : </td>
		<td><%=profileResultDto.getProfile() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onclick="formSubmit();">삭제하기</button>
			<button type="button" onclick="location.href='list.jsp';">목록으로</button>
		</td>
	</tr>
</table>
<form name="sakjeForm">
<input type="hidden" name="infoNo" value="<%=resultDto.getInfoNo() %>">
</form>
<div style="border: 0px solid blue; width:70%; margin-top:10px; margin-bottom:20px;" align="right">
	|
	<a href="#" onclick="move('list.jsp','');">목록</a>
	|
	<a href="#" onclick="move('chuga.jsp','');">등록</a>
	|
	<a href="#" onclick="move('sujung.jsp','<%=infoNo %>');">수정</a>
	|
	<a href="#" onclick="move('sakje.jsp','<%=infoNo %>');">삭제</a>
	|
</div>


<script>
function formSubmit() {
	
	if(confirm('삭제할까요?')){
		document.sakjeForm.action="sakjeProc.jsp";
		document.sakjeForm.method="post";
		document.sakjeForm.submit();
	}
}
</script>
