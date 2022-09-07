<!-- _02_createFile.jsp  -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>파일 만들기</h2>

<%
	String attachPath = "C:/jih/attach";
	String uploadPath = attachPath + "/testFile/aaa";
	String uploadFile = uploadPath + "/test01.txt";
	
	//UploadFile :  C:/jih/attach/testFile/aaa/test01.txt
	
	java.io.File f = new java.io.File(uploadFile);
	
	if(f.exists()) {
		System.out.println("파일 존재함");
	} else {
		System.out.println("파일 존재안함");
	}
	
	if(f.createNewFile()) {
		System.out.println("파일 생성 성공 : " + f.getName());
	} else {
		System.out.println("파일 생성 실패");
	}
	
%>
</body>
</html>