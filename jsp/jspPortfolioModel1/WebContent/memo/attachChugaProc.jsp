<%@page import="memo.model.dao.MemoDAO"%>
<%@page import="memo.model.dto.MemoDTO"%>

<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<%@ page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String attachPath = "c:/jih/attach";
	String uploadPath = attachPath + request.getContextPath() + "/memo";
	int maxUpload = 1024 * 1024 * 10;
	String encoding = "UTF-8";
	
	MultipartRequest multi = new MultipartRequest(
		request, 
		uploadPath,//파일저장경로
		maxUpload,//용량
		encoding,//인코딩타입
		new DefaultFileRenamePolicy()//중복파일처리(동일파일명 업로드시 뒤에 숫자 추가하여 중복방지)
	); //파일업로드 완료
	
	String writer = multi.getParameter("writer");
	String content = multi.getParameter("content");
	
	String attachInfo = "";
	try {
		Enumeration<String> files = multi.getFileNames();
		while(files.hasMoreElements()) {
			String tagName = "";
			String fileOriginName = "";
			String FileSavedName = "";
			String fileType = "";
			String fileSize = "";
			String fileExtName = ""; //.png .jpg .jpeg .gif
			String newFileName = "";
			
			tagName = (String)files.nextElement();
			
			File fileObj = multi.getFile(tagName);
			
			String imsiResult = "";
			
			if( fileObj != null) { 
				fileOriginName = multi.getOriginalFileName(tagName); //기존파일명
				FileSavedName = multi.getFilesystemName(tagName); //서버상파일명
				fileType = multi.getContentType(tagName);
				fileSize = String.valueOf(fileObj.length());
				fileExtName = FileSavedName.substring(FileSavedName.lastIndexOf(".") + 1);
				
				//확장자명 대소문자 구별함
				int imsiSucessfulCounter = 0;
				if (fileExtName.toLowerCase().equals("png")) { imsiSucessfulCounter ++; }
				if (fileExtName.toLowerCase().equals("jpg")) { imsiSucessfulCounter ++; }
				if (fileExtName.toLowerCase().equals("jpeg")) { imsiSucessfulCounter ++; }
				if (fileExtName.toLowerCase().equals("gif")) { imsiSucessfulCounter ++; }
				
				imsiResult = "비정상 파일";
				if (imsiSucessfulCounter > 0) { 
					imsiResult = "정상적인 파일";
				}
				
				
				//정상적인 확장자가 아닐때 파일 삭제
				int errorImgCounter = 0;
				if (fileExtName.toLowerCase().equals("png")) {
					
				} else if (fileExtName.toLowerCase().equals("jpg")) {
					
				} else if (fileExtName.toLowerCase().equals("jpeg")) {
					
				} else if (fileExtName.toLowerCase().equals("gif")) {
					
				} else {
					errorImgCounter ++;
				}
				
				if(errorImgCounter > 0) {
					String deleteFilePath = uploadPath + "/" + FileSavedName;
					java.io.File f = new java.io.File(deleteFilePath);
					if(f.delete()) {
						//파일삭제성공
					} else {
						//파일삭제실패
					}
					//초기화 필수
					fileOriginName = "";
					FileSavedName = "";
					fileType = "";
					fileSize = "";
				}
				
				newFileName = UUID.randomUUID().toString() + "." + fileExtName;// 새로 생성할 파일 이름.확장자
				String oldFilePath = uploadPath + "/" + FileSavedName; // 기존 서버에 저장된 파일명
				String newFilePath = uploadPath + "/" + newFileName; // 저장된 파일명을 변경
				File f1 = new File(oldFilePath);
				
				if(f1.exists()) { //기존에 저장한 파일이 있으면
					File newFile = new File(uploadPath + "/" + newFileName);
					f1.renameTo(newFile); //기존파일을 newFile로 바꿈
					FileSavedName = newFileName;
				}
				
				if(!attachInfo.trim().equals("")) {
					attachInfo += ",";
				}
				attachInfo += fileOriginName + "|"; //기존파일명
				attachInfo += FileSavedName + "|"; //서버에서의 파일명
				attachInfo += fileType + "|";
				attachInfo += fileSize;
			}
			
		}
	} catch (Exception e) {
		//e.printStackTrace();
	}
	
	out.println("attachInfo : " + attachInfo);
	
	MemoDTO arguDto = new MemoDTO();
	arguDto.setWriter(writer);
	arguDto.setContent(content);

	arguDto.setAttachInfo(attachInfo);
	
	MemoDAO dao = new MemoDAO();
	int result = dao.setInsert(arguDto);
	
	if (result > 0) {
		out.println("<script>");	
		out.println("location.href='main.jsp?menuGubun=memo_list';");	
		out.println("</script>");	
	} else {
		out.println("<script>");	
		out.println("alert('등록 중 오류가 발생했습니다.');");	
		out.println("location.href='main.jsp?menuGubun=memo_chuga';");	
		out.println("</script>");	
	}
%>