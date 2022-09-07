<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>

<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	MemoDTO arguDto = new MemoDTO();
	arguDto.setNo(no);
	
	MemoDAO dao = new MemoDAO();
	MemoDTO dto = dao.getSelectOne(arguDto);
%>

<h2>메모 상세보기</h2>
<table border="1" align="center">
	<tr>
		<td>순번 : </td>
		<td><%=dto.getNo() %></td>
	</tr>
	<tr>
		<td>작성자 : </td>
		<td><%=dto.getWriter() %></td>
	</tr>
	<tr>
		<td>내용 : </td>
		<td><%=dto.getContent() %></td>
	</tr>
	<tr>
		<td>등록일 : </td>
		<td><%=dto.getRegiDate() %></td>
	</tr>
	<tr>
		<td colspan="2">
		<%=dto.getAttachInfo() %><br>
			<% 
				if( dto.getAttachInfo() == null || dto.getAttachInfo().equals("-")) {
					out.println("&nbsp;");
				} else {
					String[] imsiArray = dto.getAttachInfo().split(",");
					for(int j=0; j<imsiArray.length; j++) {
						String[] imsiArray2 = imsiArray[j].split("[|]");
						
						
						String imsiImgPath = "";
						imsiImgPath += request.getContextPath();
						imsiImgPath += "/attach";
						imsiImgPath += request.getContextPath();
						imsiImgPath += "/memo/";
						imsiImgPath += imsiArray2[1];
						out.println("<img src='" + imsiImgPath + "' width='80' height='80'><br>" + imsiArray2[0] + "(" + imsiArray2[3]+ ")" + "<br>" );
					}
				}
			%>
		</td>
	</tr>
</table>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="move('memo_list','');">목록</a>
	|
	<a href="#" onClick="move('memo_chuga','');">등록</a>
	|
	<a href="#" onClick="move('memo_sujung','<%=no %>');">수정</a>
	|
	<a href="#" onClick="move('memo_sujungAttach','<%=no %>');">수정(attach)</a>
	|
	<a href="#" onClick="move('memo_sakje','<%=no %>');">삭제</a>
	|
</div>

<script>

function move(value1, value2) {
	location.href = 'main.jsp?menuGubun=' + value1  + '&no=' + value2;
}
</script>
