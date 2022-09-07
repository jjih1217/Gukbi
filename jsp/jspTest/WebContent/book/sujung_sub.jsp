<!-- WebContent/book/sujung_sub.jsp -->
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

<h2>도서수정</h2>

<form name="DirForm">
<input type="hidden" name="no" value="<%=no %>">
<table border="1" width="60%">
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject" id="subject" value="<%=resultDto.getSubject() %>"></td>
	</tr>
	<tr>
		<td>저자</td>
		<td><input type="text" name="author" id="author" value="<%=resultDto.getAuthor() %>"></td>
	</tr>
	<tr>
		<td>발행일</td>
		<td><input type="text" name="created" id="created" value="<%=resultDto.getCreated() %>"></td>
	</tr>
	<tr>
		<td>분류</td>
		<td><input type="text" name="profile" id="profile" value="<%=resultDto.getProfile() %>"></td>
	</tr>
</table>

<div style="width: 60%; margin: 10px 0;" align="right">
	<button type="button" onClick="formSubmit();">수정하기</button>
	<button type="button" onClick="location.href='list.jsp';">목록으로</button>
</div>

</form>

<script>
function formSubmit() {
	if(confirm('수정하시겠습니까?')) {
		document.DirForm.action = "sujungProc.jsp";
		document.DirForm.method = 'post';
		document.DirForm.submit();
	}
	
}
</script>

