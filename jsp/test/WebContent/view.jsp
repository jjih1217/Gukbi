<%@page import="java.util.ArrayList"%>
<%@page import="test220819.model.EmployeesDAO"%>
<%@page import="test220819.model.EmployeesDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	

	String first_name = request.getParameter("first_name");
	String last_name = request.getParameter("last_name");
	
	first_name="Steven";
	last_name="King";
	
	EmployeesDTO arguDto = new EmployeesDTO();
	arguDto.setFirst_name(first_name);
	arguDto.setLast_name(last_name);
	
	EmployeesDAO dao = new EmployeesDAO();
	EmployeesDTO dto = dao.getSelectOne(arguDto);


%>
