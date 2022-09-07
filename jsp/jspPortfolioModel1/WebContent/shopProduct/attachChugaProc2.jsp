<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>

<%
	java.io.File isDir = new java.io.File(uploadPath);
	if(!isDir.exists()) {
		try {
			isDir.mkdirs();
			//System.out.println("디렉토리가 존재하지않습니다. 디렉토리를 생성합니다.")
		} catch (Exception e) {
			//e.printStackTrace();
		}
	}

	// MultipartRequest 인스턴스 생성(cos.jar의 라이브러리)
	MultipartRequest multi = new MultipartRequest(
		request, 
		uploadPath, // 파일저장경로
		maxUpload,  // 용량
		encoding,   // 인코딩타입
		new DefaultFileRenamePolicy() //  중복파일처리(동일파일명 업로드시 뒤에 숫자 추가하여 중복회피)
	); //파일업로드 완료

	String productName = multi.getParameter("productName");
	String productPrice_ = multi.getParameter("productPrice");
	String vendorCode_ = multi.getParameter("vendorCode");
	String attachCounter_ = multi.getParameter("attachCounter");
	
	int productPrice = Integer.parseInt(productPrice_);
	int vendorCode = Integer.parseInt(vendorCode_);
	int attachCounter = Integer.parseInt(attachCounter_);
	
	String attachInfo = "";
	
	for(int i=1; i <= attachCounter; i++) {
		String orgiName = multi.getOriginalFileName("file" + i);
		String saveName = multi.getFilesystemName("file" + i);
		String fileType = multi.getContentType("file" + i);
		
		if(orgiName == null || saveName == null || fileType == null) {
			orgiName = "-";
			saveName = "-";
			fileType = "-";
		}
		attachInfo += "," + orgiName + "|" + saveName + "|" + fileType;
	}
	attachInfo = attachInfo.substring(1);
	
	ShopProductDTO dto = new ShopProductDTO();
	dto.setProductName(productName);
	dto.setProductPrice(productPrice);
	dto.setVendorCode(vendorCode);
	dto.setAttachInfo(attachInfo);
	
	ShopProductDAO dao = new ShopProductDAO();
	int result = dao.setInsert(dto);
	
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