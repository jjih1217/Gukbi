<!-- sungjukFile/_inc_fileInfo.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.io.*"%>
<%@page import="java.util.*"%>

<%@page import="config.Constants"%>

<%
	String attachPath = Constants.ATTACH_PATH; // C:/jih/attach
	String uploadPath = attachPath + request.getContextPath(); // C:/jih/attach/jspTest
	String uploadFile = uploadPath + "/sungjuk.txt";
	
	java.io.File isDir = new java.io.File(uploadPath);
	if(!isDir.exists()) {
		try { //필수
			isDir.mkdirs();
		} catch (Exception e) {
			//e.printStackTrace();
		}
	}
	
	java.io.File f = new java.io.File(uploadFile);
	if(!f.exists()) {
		f.createNewFile();
	}
	
	//if(pageName.equals("listPage")) {
	//	out.println("-->list<br>");
	//} else if (pageName.equals("viewPage")) {
	//	out.println("-->view<br>");
	//}
%>

