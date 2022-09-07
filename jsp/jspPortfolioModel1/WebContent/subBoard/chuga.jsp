<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="_inc_top.jsp" %> 


<% 
	String imsiTitle = "글쓰기";
	String imsiSubject = "";
	String imsiContent = "";
	
	if(no > 0) {
		imsiTitle = "답변쓰기";
		
		SubBoardDTO arguDto = new SubBoardDTO();
		arguDto.setNo(no);
		
		SubBoardDAO subBoardDao = new SubBoardDAO();
		SubBoardDTO returnDto = subBoardDao.getSelectOne(arguDto);
		
		if(returnDto.getNo() <= 0) {
			out.println("게시물이 존재하지 않숩니다.");
			return;
		}
		
		imsiSubject = returnDto.getSubject();
		imsiContent = returnDto.getContent();
		// 답변글에서 imsiSubject, imsiContent --> null
		// 처음에 getSelectOne 에서 searhGubun, searchGubun 값을 가지고 가도록 조건을 작성했기 때문이다
		// getSelectOne 에서 getSelectOne == null일때 조건 추가
	}
%>


<h2><%=imsiTitle %></h2>
<form name="DirForm">
<input type="text" name="no" value="<%=no %>"><br>
<input type="hidden" name="searchGubun" value="<%=searchGubun %>"><br>
<input type="hidden" name="searchData" value="<%=searchData %>">
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
		<td><input type="text" name="subject" value="<%=imsiSubject %>"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea name="content" style="width: 300px; height: 100px;"><%=imsiContent %></textarea>
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
			<button type="button" onClick="location.href='main.jsp?menuGubun=subBoard_list'">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('등록할까요?')) {
		document.DirForm.action = "mainProc.jsp?menuGubun=subBoard_chugaProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
	
}
</script>