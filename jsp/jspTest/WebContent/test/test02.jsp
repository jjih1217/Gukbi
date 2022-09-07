<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>test02.jsp</h2>
	<%
	String name = "홍길동";
	int kor = 90;
	int eng = 80;
	int mat = 70;
	%>
	
	이름 : <%=name %><br>
	국어 : <%=kor %><br>
	영어 : <%=eng %><br>
	수학 : <%=mat %><br>
	
	<hr>
	
	<%
	String msg = "";
	msg += "이름 : " + name + "<br>";
	msg += "국어 : " + kor + "<br>";
	msg += "영어 : " + eng + "<br>";
	msg += "수학 : " + mat + "<br>";
	
	out.print(msg);
	%>
	
	<hr>
	
	<%=msg %>
</body>
</html>