<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="config.Util"%>
<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%> 

<%
	Util util = new Util();
	String no_ = request.getParameter("no");
	no_ = util.getNullBlankCheck(no_, "0"); //새글의 no는 공백 ==> 0으로 replace
	//문자일때도 0 처리 하기
	int no = Integer.parseInt(no_);
	
	String imsiTitle = "";
	String subject = "";
	String content = "";
			
	if(no > 0) { //답변글
		BoardBasicDTO arguDto = new BoardBasicDTO();
		arguDto.setNo(no);
		
		BoardBasicDAO dao = new BoardBasicDAO();
		BoardBasicDTO returnDto = dao.getSelectOne(arguDto);
		
		imsiTitle = "답변글등록";
		subject = returnDto.getSubject();
		content = returnDto.getContent();
	} else {//새글 no = 0
		imsiTitle = "게시글등록";
	}
%>

<%@ include file="_inc_top.jsp" %>

<h2><%=imsiTitle %></h2>
<form name = "DirForm">
<input type="hidden" name="no" value="<%=no %>">
<table border="1" align="center">
	<tr>
		<td>작성자 : </td>
		<td><input type="text" name="writer" value=""></td>
	</tr>
	<tr>
		<td>제목 :</td>
		<td><input type="text" name="subject" value="<%=subject %>"></td>
	</tr>
	<tr>
		<td>내용 :</td>
		<td>
			<textarea name="content" style="width:300px; height: 300px;"><%=content %></textarea>
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
			<button type="button" Onclick="chuga();">등록하기</button>
			<button type="button" Onclick="location.href='main.jsp?menuGubun=boardBasic_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function chuga() {
	if (confirm('등록할까요?')){
		document.DirForm.action = "mainProc.jsp?menuGubun=boardBasic_chugaProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>