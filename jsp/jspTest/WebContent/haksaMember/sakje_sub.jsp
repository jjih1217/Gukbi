<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.util.ArrayList"%>
<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>

<%
	String hakbun_ = request.getParameter("hakbun");
	int hakbun = Integer.parseInt(hakbun_);
	
	HaksaMemberDTO arguDto = new HaksaMemberDTO();
	arguDto.setHakbun(hakbun);
	
	HaksaMemberDAO dao = new HaksaMemberDAO();
	HaksaMemberDTO resultDto = dao.getSelectOne(arguDto);
	
%>

<h2>학생삭제</h2>

<form name="DirForm">
<input type="text" name="hakbun" value="<%=resultDto.getHakbun() %>">
<table border="1" width="60%" align="center">
	<tr>
		<th>학번</th>
		<td><%=resultDto.getHakbun() %></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><%=resultDto.getName() %></td>
	</tr>
	<tr>
		<th>연락처</th>
		<td><%=resultDto.getPhone() %></td>
	</tr>
	<tr>
		<th>부모연락처</th>
		<td><%=resultDto.getParentPhone() %></td>
	</tr>
	<tr>
		<th>주소 </th>
		<td>(<%=resultDto.getAddr1() %>) <%=resultDto.getAddr2() %> <%=resultDto.getAddr3() %> <%=resultDto.getAddr4() %></td>
	</tr>
</table>

<div style="width: 60%; margin: 10px 0;" align="right">
	<button type="button" onClick="formSubmit();">삭제</button>
	<button type="button" onClick="move('list.jsp','');">목록</button>
</div>

</form>

<script>
function formSubmit(){

	if(confirm('삭제하시겠습니까?')) {
		document.DirForm.action = "sakjeProc.jsp";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

function move(value1, value2) {
	location.href= value1 + '?hakbun=' + value2;
}
</script>

<%@ include file = "_inc_daumApi.jsp" %>