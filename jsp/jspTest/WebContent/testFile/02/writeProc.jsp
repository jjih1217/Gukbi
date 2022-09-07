<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.FileWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	String str = name + "," + email + "," + subject  + "," +  content + "\n";
	
	String attachPath = "C:/jih/attach";
	//String uploadPath = attachPath + "/testfile/jspTest";
	String uploadPath = attachPath + "/testfile" + request.getContextPath();
	String uploadFile = uploadPath + "/sample.txt";
	
	String ment = "";
	try {
		//FileWriter fw = new FileWriter(uploadFile, true); //write
		FileWriter fw = new FileWriter(uploadFile, true);//append
		fw.write(str);
		fw.close();
		//response.sendRedirect("write.jsp");
		ment = "저장 성공";

	} catch (Exception e ) {
		//e.printStackTrace();
		//response.sendRedirect("write.jsp");
		ment = "저장 실패";
	}
	
	out.println("<script>");
	out.println("alert('" + ment + "');");
	out.println("location.href='write.jsp';");
	out.println("</script>");
%>
	

<!--  attach/testFile/jspTest/sample.txt-->


