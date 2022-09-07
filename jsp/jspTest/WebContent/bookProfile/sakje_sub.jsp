
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="bookProfile.model.dto.BookProFileDTO"%>

<%
	String profileNo_ = request.getParameter("profileNo");
	int profileNo = Integer.parseInt(profileNo_);
	
	BookProFileDTO arguDto = new BookProFileDTO();
	arguDto.setProfileNo(profileNo);
	
	BookProfileDAO dao = new BookProfileDAO();
	BookProFileDTO resultDto = dao.getSelectOne(arguDto);
%>	

<h2>분류삭제</h2>

<form name="DirForm">
<input type="hidden" name="profileNo" id="profileNo" value="<%=profileNo %>">
<table border="1" width="60%" align="center">
	<tr>
		<td>분류명</td>
		<td><%=resultDto.getProfile() %></td>
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