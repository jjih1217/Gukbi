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
	
	dao.setUpdateHit(arguDto);//순서 중요
	
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

<h2>게시글 상세보기</h2>
<table border="1" align="center"  width="80%">
	<tr>
		<td>No</td>
		<td><%=dto.getNo() %></td>
	</tr>
	<tr>
		<td>num</td>
		<td><%=dto.getNum() %></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><%=dto.getWriter() %></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><%=dto.getSubject() %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<%
				String content = dto.getContent();
				content = content.replace("\n", "<br>");
				out.println(content);
			%>
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=dto.getEmail() %></td>
	</tr>
	<tr>
		<td>refNo</td>
		<td><%=dto.getRefNo() %></td>
	</tr>
	<tr>
		<td>stepNo</td>
		<td><%=dto.getStepNo() %></td>
	</tr>
	<tr>
		<td>levelNo</td>
		<td><%=dto.getLevelNo() %></td>
	</tr>
	<tr>
		<td>hit</td>
		<td><%=dto.getHit() %></td>
	</tr>
	<tr>
		<td>등록일</td>
		<td><%=dto.getRegiDate() %></td>
	</tr>
</table>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="move('boardBasic_list','');">목록</a>
	|
	<a href="#" onClick="move('boardBasic_chuga','');">등록</a>
	|
	<a href="#" onClick="move('boardBasic_sujung','<%=dto.getNo() %>');">수정</a>
	|
	<a href="#" onClick="move('boardBasic_sakje','<%=no %>');">삭제</a>
	|
	<a href="#" onClick="move('boardBasic_chuga','<%=no %>');">답변글 등록</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href = 'main.jsp?menuGubun=' + value1  + '&no=' + value2;
}
</script>
