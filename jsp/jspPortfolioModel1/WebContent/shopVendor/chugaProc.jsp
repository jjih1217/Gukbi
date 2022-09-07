<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>

<%
	String vendorName = request.getParameter("vendorName");
	
	ShopVendorDTO arguDto = new ShopVendorDTO();
	arguDto.setVendorName(vendorName);
	
	ShopVendorDAO dao = new ShopVendorDAO();
	int result = dao.setInsert(arguDto);
	
	String ment = "";
	String addr = "";
	if ( result > 0 ) {
		ment = "등록성공";
		addr = "main.jsp?menuGubun=shopVendor_list";
	} else {
		ment = "등록 중 오류가 발생했습니다.";
		addr = "main.jsp?menuGubun=shopVendor_chuga";
	}
	
	out.println("<script>");
	out.println("alert('"  + ment + "');");
	out.println("location.href='" + addr + "';");
	out.println("</script>");
	
%>