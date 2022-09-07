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
	
	String productCode_ = multi.getParameter("productCode");
	String productName = multi.getParameter("productName");
	String productPrice_ = multi.getParameter("productPrice");
	String vendorCode_ = multi.getParameter("vendorCode");
	String attachCounter_ = multi.getParameter("attachCounter");
	
	int productCode = Integer.parseInt(productCode_);
	int productPrice = Integer.parseInt(productPrice_);
	int vendorCode = Integer.parseInt(vendorCode_);
	int attachCounter = Integer.parseInt(attachCounter_);
	
	
	//DB에서 읽어와서 
	ShopProductDTO arguDto = new ShopProductDTO();
	arguDto.setProductCode(productCode);
	
	ShopProductDAO shopProductDao = new ShopProductDAO();
	ShopProductDTO returnDto = shopProductDao.getSelectOne(arguDto);
	String[] dbArray01 = returnDto.getAttachInfo().split(",");
	
	
	String[] array = new String[attachCounter];
	
	Enumeration files = multi.getFileNames();
	//파일존재 -> 파일삭제 or 파일변경 // 파일미존재 -> 파일추가 or 데이터만 변경
	while(files.hasMoreElements()) {
		String originalName = "-";
		String saveName = "-";
		long fileSize = 0;
		String fileType = "-";
		String mimeType = "-"; //Tika
		
		String tagName = (String) files.nextElement();
		java.io.File f1 = multi.getFile(tagName);
		
		String imsiTagName = tagName.replace("file", "");
		int intTagName = Integer.parseInt(imsiTagName);
		
		String[] dbArray02 = dbArray01[intTagName - 1].split("[|]");
		
		if (f1 == null) { //파일 첨부 안하면 DB에 있는 값 불러옴
			originalName = dbArray02[0];
			saveName = dbArray02[1];
			fileSize = Integer.parseInt(dbArray02[2]);
			fileType = dbArray02[3];
			mimeType = dbArray02[4];
		} else { //파일 있으면 파일 추가
			originalName = multi.getOriginalFileName(tagName);
			saveName = multi.getFilesystemName(tagName);
			fileSize = f1.length();
			fileType = multi.getContentType(tagName);
			Tika tika = new Tika();
			mimeType = tika.detect(f1);
			
			if (fileType.equals(mimeType)) { //첨부파일 정상..
				//String[] imsiArray = saveName.split(".");
			    //String ext = imsiArray[imsiArray.length - 1];
				
				String ext = saveName.substring(saveName.lastIndexOf(".") + 1);
				String newFileName = UUID.randomUUID().toString() + "." + ext; //saveName -> newFileName
				
				java.io.File newFile = new java.io.File(uploadPath + "/" + newFileName);
				f1.renameTo(newFile);
				
				saveName = newFileName;
				
				java.io.File f2 = new java.io.File(uploadPath + "/" + dbArray02[1]);
				if (f2.exists()) {
					f2.delete();
				}
			} else { //첨부파일 비정상..
				java.io.File f2 = new java.io.File(uploadPath + "/" + saveName);
				if (f2.exists()) {
					f2.delete();
				}
				
				originalName = "-";
				saveName = "-";
				fileSize = 0;
				fileType = "-";
				mimeType = "-";
			}
		}
		
		String imsiOneFileInfo = "";
		imsiOneFileInfo += originalName + "|";		
		imsiOneFileInfo += saveName + "|";		
		imsiOneFileInfo += fileSize + "|";		
		imsiOneFileInfo += fileType + "|";		
		imsiOneFileInfo += mimeType;
		
		//String imsiTagName = tagName.replace("file", "");
		//int intTagName = Integer.parseInt(imsiTagName); //1,2,3
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
	dto.setProductCode(productCode);
	dto.setProductName(productName);
	dto.setProductPrice(productPrice);
	dto.setVendorCode(vendorCode);
	dto.setAttachInfo(attachInfo);
	
	ShopProductDAO dao = new ShopProductDAO();
	int result = dao.setUpdate(dto);
	
	String ment = "";
	String addr = "";
	if ( result > 0 ) {
		ment = "수정성공";
		addr = "main.jsp?menuGubun=shopProduct_list";
	} else {
		ment = "수정 중 오류가 발생했습니다.";
		addr = "main.jsp?menuGubun=shopProduct_sujung&productCode=" + productCode;
	}
	
	out.println("<script>");
	out.println("alert('"  + ment + "');");
	out.println("location.href='" + addr + "';");
	out.println("</script>");
	
%>