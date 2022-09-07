<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="config.Util"%> 

<%@page import="java.util.ArrayList"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>
<%@page import="guestBook.model.dao.GuestBookDAO"%>

<% 
	//listSearch에서 보낸 값 받아서 searchForm에서 사용
	String searchGubun = request.getParameter("searchGubun");
	String searchData = request.getParameter("searchData");
	
	Util util = new Util();
	searchGubun = util.getNullBlankCheck(searchGubun, "");
	searchData = util.getNullBlankCheck(searchData, "");
	
	if(searchGubun.equals("") || searchData.equals("")){
		searchGubun = "";
		searchData = "";
	}
	
	GuestBookDAO dao = new GuestBookDAO();
	ArrayList<GuestBookDTO> list = dao.getSelectAll(searchGubun, searchData);
%>
<h2>방명록 목록</h2>

<div style="border: 0px solid red; padding: 0; width: 80%; text-align: left;">
<% if(searchGubun.equals("") || searchData.equals("")) { %>
	* 전체목록 ( <%=list.size() %> 건 )
<% } else {  %>
	* 검색어 "<%=searchData %>" 으/로 검색된 목록 ( <%=list.size() %> 건 )
<% } %>
</div>

<table border="1" width="80%">
	<tr>
		<th>순번</th>
		<th>이름</th>
		<th>내용</th>
		<th>이메일</th>
		<th>등록일</th>
		<th>실작성자</th>
	</tr>
	
	<% 
		for(int i=0; i<list.size(); i++) {
			GuestBookDTO dto = list.get(i);	
	%>
		<tr>
			<td><%=dto.getNo() %></td>
			<td><a href="#" onClick="move('guestBook_view','<%=dto.getNo() %>');"><%=dto.getName() %></a></td>
			<td><%=dto.getContent() %></td>
			<td><%=dto.getEmail() %></td>
			<td><%=dto.getRegiDate() %></td>
			<td><%=dto.getMemberNo() %></td>
		</tr>
	<%
		}
	%>
	
	<tr>
		<td colspan="6" align="center" style="padding: 20px 0px">
			<form name="searchForm">
				<select name="searchGubun">
					<option value="" <% if(searchGubun.equals("")) { out.println("selected"); } %> >-- 선택 --</option>
					<option value="name" <% if(searchGubun.equals("name")) { out.println("selected"); } %> >이름</option>
					<option value="content" <% if(searchGubun.equals("content")) { out.println("selected"); } %> >내용</option>
					<option value="name_content" <% if(searchGubun.equals("mname_content")) { out.println("selected"); } %> >이름+내용</option>
				</select>
				
				<input type="text" name="searchData" value="<%=searchData %>">
				&nbsp;
				<button type="button" onClick="search();">검색하기</button>
			</form>
			
			<script>
			function search() {
				document.searchForm.action = "mainProc.jsp?menuGubun=guestBook_listSearch";
				document.searchForm.method = "post";
				document.searchForm.submit();
			}
			</script>
		</td>
	</tr>
</table>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="move('guestBook_list','');">목록</a>
	|
	<a href="#" onClick="move('guestBook_chuga','');">등록</a>
	|
</div>

<script>
function move(value1, value2) {
	location.href = 'main.jsp?menuGubun=' + value1  + '&no=' + value2;
}

</script>