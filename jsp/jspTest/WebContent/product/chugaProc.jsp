<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@include file="../include/inc_dbInfo.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String productName = request.getParameter("productName");
	String productPrice_ = request.getParameter("productPrice");
	String productContent = request.getParameter("productContent");
	String productCategory = request.getParameter("productCategory");
	String vendor = request.getParameter("vendor");
	
	//price - 숫자만 허용
	
	/*
	int productPrice = 0;
	try {
		productPrice = Integer.parseInt(productPrice_); //15000a
	} catch (Exception e) {
		productPrice = 0;
	}
	*/
	String imsi = productPrice_;
	for(int i=0; i<=9; i++) {
		imsi = imsi.replace(i + "",""); // i를 문자로 캐스팅
	} 
	
	int productPrice = 0;
	if(imsi.equals("")){ // imsi.length() <= 0
		productPrice = Integer.parseInt(productPrice_);
	}
	
	
	if (productName == null || productName.equals("")) {
		out.println("상품명 비정상");
		return;
	}
	
	if (productContent == null || productContent.equals("")) {
		out.println("상품내용 비정상");
		return;
	}
	
	if (productCategory == null || productCategory.equals("")) {
		out.println("상품분류 비정상");
		return;
	}
	
	//제조사 공백 허용
	if (vendor == null) {
		vendor ="";
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	int result = 0;
    try {
	 	Class.forName(dbDriver);
        conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
        System.out.println("오라클 접속 성공");
        //-----------------------------------------------------------------
        String sql = "insert into product values (seq_product.nextval, ?, ?, ?, ?, ?, sysdate)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, productName);
        pstmt.setInt(2, productPrice);
        pstmt.setString(3, productContent);
        pstmt.setString(4, productCategory);
        pstmt.setString(5, vendor);
        
        result = pstmt.executeUpdate();
        //-----------------------------------------------------------------
    } catch (Exception e) {
    	//e.printStackTrace()
       System.out.println("오라클 접속 실패");
    } finally {
       if (rs != null) { rs.close(); }
       if (pstmt != null) { pstmt.close(); }
       if (conn != null) { conn.close(); }
       System.out.println("오라클 접속 해제");
    }
   
	if(result > 0) {
		response.sendRedirect("list.jsp"); 
	} else {
		out.print("<script>");
		out.print("alert('추가 처리 중 오류가 발생했습니다!')");
		out.print("location.href='chuga.jsp';");
		out.print("</script>");
	}
%>