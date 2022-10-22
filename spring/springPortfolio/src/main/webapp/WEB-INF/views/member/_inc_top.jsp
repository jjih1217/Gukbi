<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../_include/inc_header.jsp" %>
<c:if test="${sessionScope.sessionNo == null || sessionScope.sessionNo == '' || sessionScope.sessionNo == 0 || sessionScope.sessionNo != 3 || sessionScope.sessionId != 'admin'}">	
	<script>
		alert('관리자 전용 메뉴입니다');
		location.href = '${path}/member/login';
	</script>
</c:if>