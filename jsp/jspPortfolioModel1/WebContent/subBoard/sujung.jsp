<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="_inc_top.jsp" %> 

<%
	SubBoardDTO arguDto = new SubBoardDTO();
	arguDto.setNo(no);
	//arguDto.setSearchGubun(searchGubun);
	//arguDto.setSearchData(searchData);
	
	SubBoardDAO subBoardDao = new SubBoardDAO();
	SubBoardDTO returnDto = subBoardDao.getSelectOne(arguDto);
	
	if(returnDto.getNo() <= 0) {
		out.println("게시물이 존재하지 않숩니다.");
		return;
	}
%>

<h2>글 수정</h2>
<form name="DirForm">
<input type="text" name="no" value="<%=returnDto.getNo() %>"><br>
<input type="text" name="dbNoticeNo" value="<%=returnDto.getNoticeNo() %>"><br>
<input type="text" name="searchGubun" value="<%=searchGubun %>"><br>
<input type="text" name="searchData" value="<%=searchData %>">
<table border="1" width="80%">
	<tr>
		<td>작성자</td>
		<td><%=returnDto.getWriter() %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><input type="text" name="email"  value="<%=returnDto.getEmail() %>"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><input type="text" name="subject" value="<%=returnDto.getSubject() %>"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea name="content" style="width: 300px; height: 100px;"><%=returnDto.getContent() %></textarea>
		</td>
	</tr>
	<tr>
		<td>공지글</td>
		<td>
			 <% if (returnDto.getNoticeNo() > 0) { %>
				<input type="radio" name="noticeGubun" value="T" checked> 공지글 &nbsp;
				<input type="radio" name="noticeGubun" value="F" > 공지글아님 &nbsp;
			<% } else { %>
				<input type="radio" name="noticeGubun" value="T"> 공지글 &nbsp;
				<input type="radio" name="noticeGubun" value="F" checked> 공지글아님 &nbsp;
			<% } %>
			
		</td>
	</tr>
	<tr>
		<td>비밀글</td>
		<td>
			<% if(returnDto.getSecretGubun().equals("T")) { %>
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
			<button type="button" onClick="save();">등록하기</button>
			<button type="button" onClick="location.href='main.jsp?menuGubun=subBoard_list'">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('수정할까요?')) {
		document.DirForm.action = "mainProc.jsp?menuGubun=subBoard_sujungProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
	
}
</script>