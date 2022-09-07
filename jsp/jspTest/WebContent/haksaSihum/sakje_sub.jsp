<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="haksaSihum.model.dao.HaksaSihumDAO"%>
<%@page import="haksaSihum.model.dto.HaksaSihumDTO"%>
    
<%
	String sihumNo_ = request.getParameter("sihumNo");
	int sihumNo = Integer.parseInt(sihumNo_);
	
	HaksaSihumDTO arguDto = new HaksaSihumDTO();
	arguDto.setSihumNo(sihumNo);
	
	HaksaSihumDAO dao = new HaksaSihumDAO();
	HaksaSihumDTO resultDto = dao.getSelectOne(arguDto);
%>

<h2>시험삭제</h2>

<form name="DirForm">
<input type="text" name="sihumNo" value="<%=resultDto.getSihumNo() %>">
<table border="1" width="60%" align="center">
	<tr>
		<th>시험번호</th>
		<td><%=resultDto.getSihumNo() %></td>
	</tr>
	<tr>
		<th>시험종류</th>
		<td><%=resultDto.getSihumName() %></td>
	</tr>
	<tr>
		<th>시험일</th>
		<td><%=resultDto.getSihumDate() %></td>
	</tr>
</table>

<div style="width: 60%; margin: 10px 0;" align="right">
	<button type="button" onClick="formSubmit();">삭제</button>
	<button type="button" onClick="move('list.jsp','');">목록</button>
</div>

</form>

<script>
function formSubmit(){
	
	if(confirm('삭제하시겠습니까?')) {
		document.DirForm.action = "sakjeProc.jsp";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

function move(value1, value2) {
	location.href= value1 + '?sihumNo=' + value2;
}
</script>

