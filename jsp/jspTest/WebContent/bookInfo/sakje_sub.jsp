

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@page import="bookInfo.model.dao.BookInfoDAO"%>

<%
	String infoNo_ = request.getParameter("infoNo");
	int infoNo = Integer.parseInt(infoNo_);
	
	BookInfoDTO arguDto = new BookInfoDTO();
	arguDto.setInfoNo(infoNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	BookInfoDTO resultDto = dao.getSelectOne(arguDto);
%>

<h2>도서정보삭제</h2>

<form name="DirForm">
<input type="hidden" name="infoNo" id="infoNo" value="<%=infoNo %>">
<table border="1" width="60%" align="center">
	<tr>
		<td>도서명</td>
		<td><%=resultDto.getSubject() %></td>
	</tr>
	<tr>
		<td>created</td>
		<td><%=resultDto.getCreated() %></td>
	</tr>
	<tr>
		<td>저자순번</td>
		<td><%=resultDto.getAuthorNo() %></td>
	</tr>
	<tr>
		<td>분류순번</td>
		<td><%=resultDto.getProfileNo() %></td>
	</tr>
</table>

<div style="width: 60%; margin: 10px 0;" align="right">
	<button type="button" onClick="formSubmit();">삭제하기</button>
	<button type="button" onClick="location.href='list.jsp';">목록</button>
</div>

</form>

<script>
function formSubmit(){
	document.DirForm.action = "sakjeProc.jsp";
	document.DirForm.method = "post";
	document.DirForm.submit();
}
</script>