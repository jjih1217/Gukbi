<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../_include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
  <link href="${pageContext.request.contextPath}/resources/css/reset.css" rel="stylesheet" type="text/css">
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" type="text/css">
</head>
<body>

<div class="wrap">
	<header>
		<jsp:include page="../_include/inc_menu.jsp" />
	</header>
	<main>
		<jsp:include page="../${folderName }/${fileName }.jsp" /> 
	</main>
	<footer>
		<jsp:include page="../_include/inc_bottom.jsp" />
	</footer>
</div>

</body>
</html>