<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "_inc_top.jsp" %>
<%@ include file = "_inc_script.jsp" %>

<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	BoardDTO arguDto = new BoardDTO();
	arguDto.setNo(no);
	
	BoardDAO boardDao1 = new BoardDAO();
	BoardDTO boardDto1 = boardDao1.getSelectOne(arguDto);
%>

<h2>글삭제</h2>
<form name="DirForm">
<input type="text" name="no" id="no" value="<%=boardDto1.getNo() %>">
<table border="1" width="80%">
	<tr>
		<td>작성자</td>
		<td><%=boardDto1.getWriter() %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=boardDto1.getEmail() %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><%=boardDto1.getSubject() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<%=boardDto1.getContent().replace("\n","<br>") %>
		</td>
	</tr>
	<tr>
		<td>공지글</td>
		<td>
			<% if(boardDto1.getNoticeNo() > 0) { %>
				공지글
			<% } else { %>
				공지글 아님
			<% } %>
		</td>
	</tr>
	<tr>
		<td>비밀글</td>
		<td>
			<% if(boardDto1.getSecretGubun().equals("T")) { %>
				비밀글
			<% } else { %>
				비밀글 아님
			<% } %>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="save();">삭제하기</button>
			<button type="button" onClick="move('board_list','');">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('삭제할까요?')) {
		document.DirForm.action = "mainProc.jsp?menuGubun=board_sakjeProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
	
}
</script>