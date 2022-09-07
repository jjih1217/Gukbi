<!-- main/mainProc.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@include file="../include/inc_dbInfo.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");
	
	String includePage = "";
	String menuGubun = request.getParameter("menuGubun");

	String movePage = "../" + menuGubun.replace("_","/") + ".jsp";
	//out.print("movePage : " + movePage);
	
	includePage = movePage;
	
%> 

<jsp:include page="<%=includePage %>" flush="true"></jsp:include>

