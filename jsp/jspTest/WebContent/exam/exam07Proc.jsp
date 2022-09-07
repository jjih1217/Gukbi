<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String grade = request.getParameter("grade");
	String address = request.getParameter("address");
	String[] hobbys = request.getParameterValues("hobby");
	
	out.println("id : " + id + "<br>");
	out.println("passwd : " + passwd + "<br>");
	out.println("name : " + name + "<br>");
	out.println("grade : " + grade + "<br>");
	out.println("address : " + address + "<br>");
	
	//out.println("hobby : " + hobby + "<br>");
	
	String hobby = "";
	for(int i=0; i<hobbys.length; i++) {
		if(!hobby.equals("")) { //공백이 아니면
			hobby += ", ";
		}
		hobby += hobbys[i];
	}
	//hobby = hobby.substring(0, hobby.length()-1);
	out.println("hobby : " + hobby + "<br>");
	
%>


