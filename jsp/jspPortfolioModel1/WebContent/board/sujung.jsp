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

<h2>글수정</h2>
<form name="DirForm">
<input type="text" name="no" id="no" value="<%=boardDto1.getNo() %>">
<input type="text" name="dbNoticeNo" id="dbNoticeNo" value="<%=boardDto1.getNoticeNo() %>">
<table border="1" width="80%">
	<tr>
		<td>작성자</td>
		<td><%=boardDto1.getWriter() %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email" value="<%=boardDto1.getEmail() %>"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject" value="<%=boardDto1.getSubject() %>"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea name="content" style="width: 300px; height: 100px;"><%=boardDto1.getContent()%></textarea>
		</td>
	</tr>
	<tr>
		<td>공지글</td>
		<td>
			<% if(boardDto1.getNoticeNo() > 0) { %>
				<input type="radio" name="noticeGubun" value="T" checked> 공지글 &nbsp;
				<input type="radio" name="noticeGubun" value="F" > 공지글아님 &nbsp;
			<% } else { %>
				<input type="radio" name="noticeGubun" value="T" > 공지글 &nbsp;
				<input type="radio" name="noticeGubun" value="F" checked> 공지글아님 &nbsp;
			<% } %>
		</td>
	</tr>
	<tr>
		<td>비밀글</td>
		<td>
			<% if(boardDto1.getSecretGubun().equals("T")) { %>
				<input type="radio" name="secretGubun" value="T" checked> 비밀글 &nbsp;
				<input type="radio" name="secretGubun" value="F" > 비밀글아님 &nbsp;
			<% } else { %>
				<input type="radio" name="secretGubun" value="T"> 비밀글 &nbsp;
				<input type="radio" name="secretGubun" value="F" checked> 비밀글아님 &nbsp;
			<% } %>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="save();">수정하기</button>
			<button type="button" onClick="move('board_list','');">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('수정할까요?')) {
		document.DirForm.action = "mainProc.jsp?menuGubun=board_sujungProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
	
}
</script>