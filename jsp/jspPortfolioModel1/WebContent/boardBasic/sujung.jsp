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

<h2>게시글 수정</h2>
<form name = "DirForm">
<input type="hidden" name="no" value="<%=no %>">
<table border="1" align="center"  width="80%">
	<tr>
		<td>작성자 : </td>
		<td><input type="text" name="writer" value="<%=dto.getWriter() %>"></td>
	</tr>
	<tr>
		<td>제목 : </td>
		<td><input type="text" name="subject" value="<%=dto.getSubject() %>"></td>
	</tr>
	<tr>
		<td>내용 : </td>
		<td>
			<textarea name="content" style="width:300px; height: 300px;"><%=dto.getContent() %></textarea>
		</td>
	</tr>
	<tr>
		<td>이메일 : </td>
		<td><input type="email" name="email" value="<%=dto.getEmail()%>"></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td>
			<input type="password" name="passwd">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" Onclick="sujung();">수정하기</button>
			<button type="button" Onclick="location.href='main.jsp?menuGubun=boardBasic_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function sujung() {
	if (confirm('수정할까요?')){
		document.DirForm.action = "mainProc.jsp?menuGubun=boardBasic_sujungProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
