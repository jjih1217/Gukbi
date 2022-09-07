<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "_inc_top.jsp" %>

<% 
	String no_ = request.getParameter("no");
	if(no_ == null || no_.trim().equals("")) {
		no_ = "0";
	}
	int no = Integer.parseInt(no_);
	
	String pageName = "글쓰기";
	if(no > 0) { //답글
		pageName = "답글쓰기";
	}
	
	String subject = "";
	String content = "";
	if(no > 0) {
		BoardDTO arguDto = new BoardDTO();
		arguDto.setNo(no);
		
		BoardDAO boardDao = new BoardDAO();
		BoardDTO boardDto = boardDao.getSelectOne(arguDto);
		
		subject = boardDto.getSubject();
		content = boardDto.getContent();
	}
%>

<h2><%=pageName %></h2>
<form name="DirForm">
<input type="text" name="no" id="no" value="<%=no %>">
<table border="1" width="80%">
	<tr>
		<td>작성자</td>
		<td><input type="text" name="writer"></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject" value="<%=subject %>"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea name="content" style="width: 300px; height: 100px;"><%=content %></textarea>
		</td>
	</tr>
	<tr>
		<td>공지글</td>
		<td>
			<input type="radio" name="noticeGubun" value="T"> 공지글 &nbsp;
			<input type="radio" name="noticeGubun" value="F" checked> 공지글아님 &nbsp;
		</td>
	</tr>
	<tr>
		<td>비밀글</td>
		<td>
			<input type="radio" name="secretGubun" value="T"> 비밀글 &nbsp;
			<input type="radio" name="secretGubun" value="F" checked> 비밀글아님 &nbsp;
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="save();">등록하기</button>
			<button type="button" onClick="location.href='main.jsp?menuGubun=board_list'">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('등록할까요?')) {
		document.DirForm.action = "mainProc.jsp?menuGubun=board_chugaProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
	
}
</script>