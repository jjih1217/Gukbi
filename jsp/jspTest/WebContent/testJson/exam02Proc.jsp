<!-- testJson/exam02Proc.jsp -->
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="org.json.simple.JSONObject" %>

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String age_ = request.getParameter("age");
	
	int age = Integer.parseInt(age_);
	
	JSONObject jsonObj = new JSONObject();
	jsonObj.put("id", id);
	jsonObj.put("passwd", passwd);
	jsonObj.put("name", name);
	jsonObj.put("age", age);
	
	String json_member = jsonObj.toJSONString();
	
	PrintWriter pw = response.getWriter();
	pw.print(json_member);
	pw.flush();
	pw.close();

	//out.print("jsonObj : "  + jsonObj);
%>

