<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String gender = request.getParameter("gender");
	
	out.print("name: " + name + "<br>");
	out.print("age: " + age + "<br>");
	out.print("gender: " + gender + "<br>");
	
%>