<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="config.Util"%>

<%
	//받음
	request.setCharacterEncoding("UTF-8");
	
	String searchGubun = request.getParameter("searchGubun");
	String searchData = request.getParameter("searchData");
	
	Util util = new Util();
	searchGubun = util.getNullBlankCheck(searchGubun, "");
	searchData = util.getNullBlankCheck(searchData, "");
	
	if(searchGubun.equals("") || searchData.equals("")){
		searchGubun = "";
		searchData = "";
	}
	
%>
<!-- 보냄 get-->
<script>
function move() {
	location.href = 'main.jsp?menuGubun=guestBook_list&searchGubun=<%=searchGubun %>&searchData=<%=searchData %>';
}
move();
</script>