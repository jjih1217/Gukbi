<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.ArrayList"%>
<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>

<%
	HaksaMemberDAO dao = new HaksaMemberDAO();
	ArrayList<HaksaMemberDTO> list = dao.getSelectAll();
	
	int totalRecord = list.size();
	/* System.out.println(totalRecord); */
%>
<h2>학생목록</h2>

<table border="1" width="60%" align="center">
	<tr>
		<th>순번</th>
		<th>학번</th>
		<th>이름</th>
		<th>연락처</th>
		<th>등록일</th>
		<!-- <th>부모연락처</th>
		<th>주소</th> -->
	</tr>
	<% if( totalRecord == 0) { %>
		<tr>
			<td colspan="6" height="200px" align="center">등록된 내용이 없습니다</td>
		</tr>
	<% } %>
	
	<%
		int num = totalRecord;
		for(int i=0; i < list.size(); i++) {
			HaksaMemberDTO dto = list.get(i);
	%>
		<tr>
			<td><%=num %> </td>
			<td><%=dto.getHakbun() %> </td>
			<td><a href="#" onClick="move('view.jsp','<%=dto.getHakbun() %>');"><%=dto.getName() %></a></td>
			<td><%=dto.getPhone() %></td>
			<%-- <td><%=dto.getParentPhone() %></td>
			<td>
				<%=dto.getAddr1() %> <%=dto.getAddr2() %> <br> 
				<%=dto.getAddr3() %> <%=dto.getAddr4() %>
			</td> --%>
			<td><%=dto.getRegiDate() %></td>
		</tr>
	<%  		
			num--;
		} 
	%>
</table>

<div style="width: 60%; margin: 10px 0;" align="right">
	<button type="button" onClick="move('list.jsp','');">목록</button>
	<button type="button" onClick="move('chuga.jsp','');">등록</button>
</div>


<script>
function move(value1, value2) {
	location.href= value1 + '?hakbun=' + value2;
}

</script>

<%@ include file = "_inc_daumApi.jsp" %>