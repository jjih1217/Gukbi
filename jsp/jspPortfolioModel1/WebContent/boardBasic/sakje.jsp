<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%> 

<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	BoardBasicDTO arguDto = new BoardBasicDTO();
	arguDto.setNo(no);
	
	BoardBasicDAO dao = new BoardBasicDAO();
	BoardBasicDTO dto = dao.getSelectOne(arguDto);
	
	//no는 sequence 1부터 시작
	if(dto.getNo() <= 0) {
		out.println("<script>");
		out.println("alert('존재하지 않는 내용입니다.')");
		out.println("location.href='main.jsp?menuGubun=boardBasic_list';");
		out.println("</script>");
		return;
	}
%>

<%@ include file="_inc_top.jsp" %>

<h2>게시글 삭제</h2>
<form name = "DirForm">
<input type="hidden" name="no" value="<%=no %>">
<input type="hidden" name="parentNo" value="<%=dto.getParentNo() %>">
<table border="1" align="center"  width="80%">
	<tr>
		<td>작성자 : </td>
		<td><%=dto.getWriter() %></td>
	</tr>
	<tr>
		<td>제목 : </td>
		<td><%=dto.getSubject() %></td>
	</tr>
	<tr>
		<td>내용 : </td>
		<td>
			<%=dto.getContent().replace("\n", "<br>") %>
		</td>
	</tr>
	<tr>
		<td>이메일 : </td>
		<td><%=dto.getEmail()%></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td><input type="password" name="passwd" value=""></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" Onclick="sakje();">삭제하기</button>
			<button type="button" Onclick="location.href='main.jsp?menuGubun=boardBasic_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function sakje() {
	if (confirm('삭제할까요?')){
		document.DirForm.action = "mainProc.jsp?menuGubun=boardBasic_sakjeProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
