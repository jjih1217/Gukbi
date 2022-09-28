<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String sessionId = (String) session.getAttribute("sessionId");

	if(sessionId == null){
		out.println("<script>");
   		out.println("alert('로그인 후 이용해주세요');");
   		out.println("location.href='login.jsp'");
   		out.println("</script>");
   		return;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2><%=sessionId %>님 환영합니다. &nbsp;&nbsp;&nbsp;<a href="logout.jsp">[로그아웃]</a></h2>
	<h2>메인페이지입니다.</h2>
</body>
</html>