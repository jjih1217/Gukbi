<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css?v=1"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css?v=1"/>

</head>
<body>
<div class="wrap">
	<header>
		<jsp:include page="../include/inc_menu.jsp"></jsp:include>
	</header>
	<div class="main">
		<jsp:include page="../${folderName }/${fileName }.jsp"></jsp:include>
	</div>
	<footer>
		<jsp:include page="../include/inc_bottom.jsp"></jsp:include>
	</footer>
</div>

</body>
</html>