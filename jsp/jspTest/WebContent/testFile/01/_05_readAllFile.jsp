<!-- _05_readAllFile.jsp  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>파일 읽기</h2>

<%
	String attachPath = "C:/jih/attach";
	String uploadPath = attachPath + "/testFile/aaa";
	String uploadFile = uploadPath + "/test01.txt";
	
	try {
		List<String> lines = Files.readAllLines(Paths.get(uploadFile));
		out.println(lines + "<br>");
		
		out.println("----------------------------------------------<br>");
		
		byte[] bytes = Files.readAllBytes(Paths.get(uploadFile));
		out.println(new String(bytes) + "<br>");
		
		out.println("----------------------------------------------<br>");
		
		String str = Files.readString(Paths.get(uploadFile));
		out.println(str + "<br>");
		
	} catch (Exception e ) {
		//e.printStackTrace();
	}
%>

</body>
</html>

