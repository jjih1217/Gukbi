<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>

<%
	String productCode_ = request.getParameter("productCode");
	int productCode = Integer.parseInt(productCode_);
	
	ShopProductDTO arguDto = new ShopProductDTO();
	arguDto.setProductCode(productCode);
	
	ShopProductDAO dao = new ShopProductDAO();
	
	ShopProductDTO returnDto = dao.getSelectOne(arguDto);
	
	int result = dao.setDelete(arguDto);
	
	String imsiMsg = "삭제 중 오류가 발생했습니다.";
	String imsiUrl = "main.jsp?menuGubun=shopProduct_sakje&productCode=" + productCode;
	if (result > 0) { //DB에서 삭제후
		imsiMsg = "삭제성공";
		imsiUrl = "main.jsp?menuGubun=shopProduct_list";
		//파일삭제
		String[] imsiArray01 = returnDto.getAttachInfo().split(",");
		for(int i=0; i<imsiArray01.length; i++) {
			String[] imsiArray02 = imsiArray01[i].split("[|]");
			String uploadFile = uploadPath + "/" + imsiArray02[1];
			java.io.File f = new java.io.File(uploadFile);
			if(f.delete()) {
				//파일삭제성공
			} else  {
				//파일삭제실패
			};
		}
	}
	
	out.println("<script>");
	if (result <= 0) {
		out.println("alert('" + imsiMsg + "');");
	}
	out.println("location.href='" + imsiUrl + "';");	
	out.println("</script>");
	
%>