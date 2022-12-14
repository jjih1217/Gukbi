
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
		uploadPath, 
		maxUpload,  
		encoding,   
		new DefaultFileRenamePolicy() 
	);

	String productName = multi.getParameter("productName");
	String productPrice_ = multi.getParameter("productPrice");
	String vendorCode_ = multi.getParameter("vendorCode");
	String attachCounter_ = multi.getParameter("attachCounter");
	
	int productPrice = Integer.parseInt(productPrice_);
	int vendorCode = Integer.parseInt(vendorCode_);
	int attachCounter = Integer.parseInt(attachCounter_);
	
	
	String[] array = new String[attachCounter];
	
	Enumeration files = multi.getFileNames(); // 첨부파일의 집합, 순서 없음
	
	while(files.hasMoreElements()) { // 다음 요소가 있으면
		String OriginalName = "-";
		String saveName = "-";
		long fileSize = 0;
		String fileType = "-";
		String mimeType = "-"; //Tika
		
		String tagName = (String) files.nextElement();
		java.io.File f1 = multi.getFile(tagName);
		
		if(f1 != null) { //첨부O
			OriginalName = multi.getOriginalFileName(tagName);
			saveName = multi.getFilesystemName(tagName);
			fileSize = f1.length();
			fileType = multi.getContentType(tagName);
			Tika tika = new Tika();
			mimeType = tika.detect(f1);
			
			if(fileType.equals(mimeType)) { //첨부파일 정상
				String ext = saveName.substring(saveName.lastIndexOf(".") + 1);
				String newFileName = UUID.randomUUID().toString() + "." + ext; //savename -> newFileName
				
				java.io.File newFile = new java.io.File(uploadPath + "/" + newFileName);
				f1.renameTo(newFile);
				
				saveName = newFileName;
				
			} else {//첨부파일 비정상
				java.io.File f2 = new java.io.File(uploadPath + "/" + saveName);
				if(f2.exists()) {
					f2.delete();
				}
				//초기화
				OriginalName = "-";
				saveName = "-";
				fileSize = 0;
				fileType = "-";
				mimeType = "-";
			}
		}
		
		String imsiOneFileInfo = "";
		imsiOneFileInfo += OriginalName + "|";		
		imsiOneFileInfo += saveName + "|";		
		imsiOneFileInfo += fileSize + "|";		
		imsiOneFileInfo += fileType + "|";		
		imsiOneFileInfo += mimeType;
		
		String imsiTagName = tagName.replace("file", "");
		int intTagName = Integer.parseInt(imsiTagName); //1,2,3
		array[intTagName - 1] = imsiOneFileInfo;//0,1,2
	}
	
	
	String attachInfo = "";
	for(int i=0; i<array.length; i++) {
		if(!attachInfo.equals("")) {
			attachInfo += ",";
		}
		attachInfo += array[i];
	}
	
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