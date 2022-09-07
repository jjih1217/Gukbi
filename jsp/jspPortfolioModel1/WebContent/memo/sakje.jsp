<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	MemoDTO arguDto = new MemoDTO();
	arguDto.setNo(no);
	
	MemoDAO dao = new MemoDAO();
	MemoDTO dto = dao.getSelectOne(arguDto);
%>

<h2>메모삭제</h2>
<form name = "sakjeForm">
<input type="text" name="no" value="<%=no %>">
<table border="1" align="center">
	<tr>
		<td>순번 : </td>
		<td><%=dto.getNo() %></td>
	</tr>
	<tr>
		<td>작성자 : </td>
		<td><%=dto.getWriter() %></td>
	</tr>
	<tr>
		<td>내용 : </td>
		<td><%=dto.getContent() %></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" Onclick="sakje();">삭제하기</button>
			<button type="button" Onclick="location.href='main.jsp?menuGubun=memo_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function sakje() {
	if (confirm('삭제할까요?')){
		document.sakjeForm.action = "mainProc.jsp?menuGubun=memo_sakjeProc";
		document.sakjeForm.method = "post";
		document.sakjeForm.submit();
	}
}
</script>