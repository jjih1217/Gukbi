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
	
	int productPrice = Integer.parseInt(productPrice_);
	int vendorCode = Integer.parseInt(vendorCode_);
	
	String attachInfo = "";
	
	//file1
	String orgiName1 = multi.getOriginalFileName("file1");  //
	String saveName1 = multi.getFilesystemName("file1");    // 서버에 저장된 이름
	String fileType1 = multi.getContentType("file1");       //
	
	if(orgiName1 == null || saveName1 == null || fileType1 == null) {
		orgiName1 = "-";
		saveName1 = "-";
		fileType1 = "-";
	}
	attachInfo += "," + orgiName1 + "|" + saveName1 + "|" + fileType1;
	
	//file2
	String orgiName2 = multi.getOriginalFileName("file2");  
	String saveName2 = multi.getFilesystemName("file2");    
	String fileType2 = multi.getContentType("file2");       
	
	if(orgiName2 == null || saveName2 == null || fileType2 == null) {
		orgiName2 = "-";
		saveName2 = "-";
		fileType2 = "-";
	}
	attachInfo += "," + orgiName2 + "|" + saveName2 + "|" + fileType2;
	
	//file3
	String orgiName3 = multi.getOriginalFileName("file3");  
	String saveName3 = multi.getFilesystemName("file3");    
	String fileType3 = multi.getContentType("file3");       
	
	if(orgiName3 == null || saveName3 == null || fileType3 == null) {
		orgiName3 = "-";
		saveName3 = "-";
		fileType3 = "-";
	}
	attachInfo += "," + orgiName3 + "|" + saveName3 + "|" + fileType3;
	
	attachInfo = attachInfo.substring(1);// 처음 , 없앰
	
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