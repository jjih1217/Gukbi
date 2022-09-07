<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>

<%
	String productName = request.getParameter("productName");
	String productPrice_ = request.getParameter("productPrice");
	String vendorCode_ = request.getParameter("vendorCode");
	String attachInfo = request.getParameter("attachInfo");
	
	int productPrice = Integer.parseInt(productPrice_);
	int vendorCode = Integer.parseInt(vendorCode_);
	attachInfo = "-";
	
	ShopProductDTO arguDto = new ShopProductDTO();
	arguDto.setProductName(productName);
	arguDto.setProductPrice(productPrice);
	arguDto.setVendorCode(vendorCode);
	arguDto.setAttachInfo(attachInfo);
	
	ShopProductDAO dao = new ShopProductDAO();
	int result = dao.setInsert(arguDto);
	
	String ment = "";
	String addr = "";
	if ( result > 0 ) {
		ment = "등록성공";
		addr = "main.jsp?menuGubun=shopProduct_list";
	} else {
		ment = "등록 중 오류가 발생했습니다.";
		addr = "main.jsp?menuGubun=shopProduct_chuga";
	}
	
	out.println("<script>");
	out.println("alert('"  + ment + "');");
	out.println("location.href='" + addr + "';");
	out.println("</script>");
	
%>