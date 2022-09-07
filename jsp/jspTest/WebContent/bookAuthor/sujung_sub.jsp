
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>

<%
	String authorNo_ = request.getParameter("authorNo");
	int authorNo = Integer.parseInt(authorNo_);
	
	BookAuthorDTO arguDto = new BookAuthorDTO();
	arguDto.setAuthorNo(authorNo);
	
	BookAuthorDAO dao = new BookAuthorDAO();
	BookAuthorDTO resultDto = dao.getSelectOne(arguDto);
%>

<h2>저자수정</h2>

<form name="DirForm">
<input type="hidden" name="authorNo" id="authorNo" value="<%=authorNo %>">
<table border="1" width="60%" align="center">
	<tr>
		<td>저자명</td>
		<td><input type="text" name="author" id="author" value="<%=resultDto.getAuthor()%>"></td>
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