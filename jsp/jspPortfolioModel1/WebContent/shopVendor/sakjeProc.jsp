<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>

<%	
	String vendorCode_ = request.getParameter("vendorCode");
	int vendorCode = Integer.parseInt(vendorCode_);
	
	ShopVendorDTO arguDto = new ShopVendorDTO();
	arguDto.setVendorCode(vendorCode);
	
	ShopVendorDAO dao = new ShopVendorDAO();
	int result = dao.setDelete(arguDto);
	
	String ment = "";
	String addr = "";
	if ( result > 0 ) {
		ment = "삭제성공";
		addr = "main.jsp?menuGubun=shopVendor_list";
	} else {
		ment = "삭제 중 오류가 발생했습니다.";
		addr = "main.jsp?menuGubun=shopVendor_sakje&vendorCode=" + vendorCode;
	}
	
	out.println("<script>");
	out.println("alert('"  + ment + "');");
	out.println("location.href='" + addr + "';");
	out.println("</script>");
	
%>