<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	

	String[] names = request.getParameterValues("name");
	String grade = request.getParameter("grade");
	
	
	String name = "";
	for(int i=0; i<names.length; i++) {
		if(!name.equals("")) { //공백이 아니면
			name += ",";
		}
		name += names[i];
	}
	
	out.println("name : " + name + "<br>");
	out.println("grade : " + grade + "<br>");

%>


