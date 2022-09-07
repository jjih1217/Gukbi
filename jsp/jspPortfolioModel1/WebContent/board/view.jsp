<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>
<%@ include file = "_inc_script.jsp" %>

<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	String searchValue = "O";
	String searchGubun = request.getParameter("searchGubun");
	String searchData = request.getParameter("searchData");
	
	if(searchGubun == null || searchGubun.trim().equals("")) {
		searchGubun = "";
	}
	if(searchData == null || searchData.trim().equals("")) {
		searchData = "";
	}
	if(searchGubun.trim().equals("") || searchData.trim().equals("")) {
		searchValue = "X";
		searchGubun = "";
		searchData = "";
	}
	
	BoardDTO arguDto = new BoardDTO();
	arguDto.setNo(no);
	
	BoardDAO boardDao1 = new BoardDAO();
	
	boardDao1.setUpdateHit(arguDto);//순서 중요
	
	BoardDTO boardDto1 = boardDao1.getSelectOne(arguDto);
%>

<h2>상세보기</h2>
<table border="1" width="80%">
<tr>
	<td>no</td>
	<td><%=boardDto1.getNo() %></td>
</tr>
<tr>
	<td>num</td>
	<td><%=boardDto1.getNum() %></td>
</tr>
<tr>
	<td>writer</td>
	<td><%=boardDto1.getWriter() %></td>
</tr>
<tr>
	<td>subject</td>
	<td><%=boardDto1.getSubject() %></td>
</tr>
<tr>
	<td>content</td>
	<td><%=boardDto1.getContent().replace("\n", "<br>") %></td>
</tr>
<tr>
	<td>email</td>
	<td><%=boardDto1.getEmail() %></td>
</tr>
<tr>
	<td>refNo</td>
	<td><%=boardDto1.getRefNo() %></td>
</tr>
<tr>
	<td>stepNo</td>
	<td><%=boardDto1.getStepNo() %></td>
</tr>
<tr>
	<td>hit</td>
	<td><%=boardDto1.getHit() %></td>
</tr>
<tr>
	<td>IP</td>
	<td><%=boardDto1.getIp() %></td>
</tr>
<tr>
	<td>membeNo</td>
	<td><%=boardDto1.getMemberNo() %></td>
</tr>
<tr>
	<td>공지글</td>
	<td><%=boardDto1.getNoticeNo() %></td>
</tr>
<tr>
	<td>비밀글</td>
	<td><%=boardDto1.getSecretGubun() %></td>
</tr>
<tr>
	<td>regiDate</td>
	<td><%=boardDto1.getRegiDate() %></td>
</tr>
<tr>
	<td>attachInfo</td>
	<td><%=boardDto1.getAttachInfo() %></td>
</tr>
</table>
<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="move('board_list', '', '', '');">전체목록</a>
	|
	<a href="#" onClick="move('board_list','','<%=searchGubun %>', '<%=searchData %>');">목록</a>
	|
	<a href="#" onClick="move('board_chuga','','<%=searchGubun %>', '<%=searchData %>');">등록</a>
	|
	<a href="#" onClick="move('board_chuga','<%=boardDto1.getNo() %>','<%=searchGubun %>', '<%=searchData %>');">답변</a>
	|
	<a href="#" onClick="move('board_sujung',<%=boardDto1.getNo() %>,'<%=searchGubun %>', '<%=searchData %>');">수정</a>
	|
	<a href="#" onClick="move('board_sakje','<%=boardDto1.getNo() %>','<%=searchGubun %>', '<%=searchData %>');">삭제</a>
</div>

<!-- <script>
function move(value1, value2) {
	var linkAddr = 'main.jsp?menuGubun=' + value1  + '&no=' + value2;
	location.href = linkAddr;
}
</script> -->