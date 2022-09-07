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
%>

<%@ include file="_inc_top.jsp" %>

<h2>답변글 등록</h2>
<form name = "DirForm">
<table border="1" align="center">
	<tr>
		<td>작성자 : </td>
		<td><input type="text" name="writer" value=""></td>
	</tr>
	<tr>
		<td>제목 :</td>
		<td><input type="text" name="subject" value="<%=dto.getSubject() %>"></td>
	</tr>
	<tr>
		<td>내용 :</td>
		<td>
			<textarea name="content" style="width:300px; height: 300px;"><%=dto.getContent() %></textarea>
		</td>
	</tr>
	<tr>
		<td>이메일 :</td>
		<td><input type="email" name="email"></td>
	</tr>
	<tr>
		<td>비밀번호 :</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" Onclick="save();">저장하기</button>
			<button type="button" Onclick="location.href='main.jsp?menuGubun=boardBasic_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if (confirm('저장할까요?')){
		document.DirForm.action = "mainProc.jsp?menuGubun=boardBasic_replyProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>