<!-- WebContent/memberBasic/list_sub.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>

<%@page import="memberBasic.MemberBasicDAO"%>
<%@page import="memberBasic.MemberBasicDTO"%>
    
<%
	MemberBasicDAO dao = new MemberBasicDAO();
	ArrayList<MemberBasicDTO> list = dao.getSelectAll();
%>
    
<h2>회원목록</h2>
<table border="1" align="center" width="70%">
	<tr>
		<th>순번</th>
		<th>아이디</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>등록일</th>
	</tr>
	
	<% if(list.size() == 0) { %>
		<tr>
			<td align="center" colspan="6" height="200px;">
				등록된 내용이 없습니다.
			</td>
		</tr>
	<% } %>
	
	<% 
		int bunho = list.size();
		for (int i=0; i<list.size(); i++) {
			MemberBasicDTO dto = list.get(i);
	%>	
			<tr>
				<td><%=bunho %></td>
				<td><a href="#" onClick="move('view.jsp', '<%=dto.getNo() %>')"><%=dto.getId() %></a></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getPhone() %></td>
				<td>(<%=dto.getJuso1() %>) <%=dto.getJuso2() %> <%=dto.getJuso3() %> <%=dto.getJuso4() %></td>
				<td><%=dto.getRegiDate() %></td>
			</tr>
	<% 
			bunho--;
		} 
	%>
</table>

<div style="border : 0px solid blue; width: 70%; margin-top: 10px;" align="right">
	<button type="button" onClick="move('list.jsp', '');">목록</button>
	<button type="button" onClick="move('chuga.jsp', '');">등록</button>
</div>

<!-- <form name="imsi">
<input type="text" name="no">
</form> -->

<script>
function move(value1, value2) {
	location.href = value1 + '?no=' + value2; //get 방식
	
	/* document.imsi.no.value = value2;
	document.imsi.action = value1;
	document.imsi.method = "post"
	document.imsi.submit(); */
}
</script>
