<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<%@ page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>

<%@page import="org.apache.tika.Tika"%>

<%@page import="java.util.ArrayList"%>

<%@page import="shopProduct.model.dao.ShopProductDAO"%>
<%@page import="shopProduct.model.dto.ShopProductDTO"%>    

<%@page import="shopVendor.model.dao.ShopVendorDAO"%>
<%@page import="shopVendor.model.dto.ShopVendorDTO"%>   

<%@ include file = "../_include/inc_header.jsp" %>
<%@ include file = "../_include/inc_sessionChk.jsp" %>

<%
	String attachPath = "c:/jih/attach";
	String uploadPath = attachPath + request.getContextPath() + "/product";
	int maxUpload = 1024 * 1024 * 10;
	String encoding = "UTF-8";
%>