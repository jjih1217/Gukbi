<!-- memberFile/chugaProc.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.io.FileWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String address = request.getParameter("address");
	
	String str = ""; 
	str += id + ",";
	str += passwd + ",";
	str += name + ",";
	str += phone + ",";
	str += email + ",";
	str += address + "\n";
	
	out.println(str);
	
	String attachPath = "C:/jih/attach";
	String uploadPath = attachPath + request.getContextPath();
	String uploadFile = uploadPath + "/member.txt";
	

	try {
		FileWriter fw = new FileWriter(uploadFile, true);//append
		fw.write(str);
		fw.close();
		out.println("alert('저장 성공');");
		response.sendRedirect("list.jsp");
		
	} catch (Exception e ) {
		//e.printStackTrace();
		out.println("alert('저장 실패');");
		response.sendRedirect("chuga.jsp");
	}
	
%>

