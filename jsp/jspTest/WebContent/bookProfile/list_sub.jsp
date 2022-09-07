
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.ArrayList"%>
    
<%@page import="bookProfile.model.dto.BookProFileDTO"%>
<%@page import="bookProfile.model.dao.BookProfileDAO"%>

<%
	BookProfileDAO dao = new BookProfileDAO();
	ArrayList<BookProFileDTO> list = dao.getSelectAll();
	
	int totalRecord = list.size();
%>
<h2>분류목록</h2>

<table border="1" width="60%" align="center">
	<tr>
		<th>순번</th>
		<th>분류명</th>
		<th>등록일</th>
		<th>비고</th>
	</tr>
	<% if( totalRecord == 0) { %>
		<tr>
			<td colspan="3" height="200px" align="center">등록된 내용이 없습니다</td>
		</tr>
	<% } %>
	
	<%
		int temp = 0;
		int num = totalRecord;
		for(int i=0; i < list.size(); i++) {
			BookProFileDTO dto = list.get(i);
	%>
			<tr>
				<td><%=num %></td>
				<td><%=dto.getProfile() %></td>
				<td><%=dto.getRegiDate() %></td>
				<td>
					<a href="#" onClick="move('sujung.jsp','<%=dto.getProfileNo() %>')">[수정]</a>
					<a href="#" onClick="move('sakje.jsp','<%=dto.getProfileNo() %>')">[삭제]</a>
				</td>
			</tr>
	<%  		
			num--;
			temp++;
		} 
	%>
</table>

<div style="width: 60%; margin: 10px 0;" align="right">
	<button type="button" onClick="move('list.jsp','');">목록</button>
	<button type="button" onClick="move('chuga.jsp','');">등록</button>
</div>


<script>
function move(value1, value2){
	location.href = value1 + '?profileNo=' + value2;
}
</script>