<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="_inc_top.jsp" %> 


<script>
function move() {
	location.href = 'main.jsp?menuGubun=subBoard_list&searchGubun=<%=searchGubun %>&searchData=<%=searchData %>';
}

move();
</script>