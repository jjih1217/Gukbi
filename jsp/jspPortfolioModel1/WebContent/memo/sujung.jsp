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

<h2>메모수정</h2>
<form name = "sujungForm">
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
		<td>
			<textarea name="content" style="width:300px; height: 300px;"></textarea>
		</td>
	</tr>
		<tr>
		<td colspan="2">
			<button type="button" Onclick="sujung();">수정하기</button>
			<button type="button" Onclick="location.href='main.jsp?menuGubun=memo_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function sujung() {
		document.sujungForm.action = "mainProc.jsp?menuGubun=memo_sujungProc";
		document.sujungForm.method = "post";
		document.sujungForm.submit();
}
</script>

