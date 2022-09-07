<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "_inc_top.jsp" %> <!-- LOGIN CHK -->
   
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>

<%@ page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>

<%@page import="member.model.dto.MemberDTO"%>
<%@page import="member.model.dao.MemberDAO"%>

<%
	String attachPath = "c:/jih/attach";
	String uploadPath = attachPath + request.getContextPath() + "/member";
	//request.getContextPath() : /jspPortfolioModel1
	//uploadPath : c:/jih/attach/jspPortfolioModel1/member
	int maxUpload = 1024 * 1024 * 10;
	String encoding = "UTF-8";
	
	//MultipartRequest 인스턴스 생성(cos.jar의 라이브러리)
	MultipartRequest multi = new MultipartRequest(
		request, 
		uploadPath,//파일저장경로
		maxUpload,//용량
		encoding,//인코딩타입
		new DefaultFileRenamePolicy()//중복파일처리(동일파일명 업로드시 뒤에 숫자 추가하여 중복방지)
	); //파일업로드 완료
	
	String id = multi.getParameter("id");
	String passwd = multi.getParameter("passwd");
	String passwdChk = multi.getParameter("passwdChk");
	String name = multi.getParameter("name");
	String phone = multi.getParameter("phone");
	String email = multi.getParameter("email");
	String jumin1 = multi.getParameter("jumin1");
	String jumin2 = multi.getParameter("jumin2");
	String juso1 = multi.getParameter("juso1");
	String juso2 = multi.getParameter("juso2");
	String juso3 = multi.getParameter("juso3");
	String juso4 = multi.getParameter("juso4");
	String grade = multi.getParameter("grade");
	
	//null, 공백체크, 패스워드확인체크
	//즈민번호 숫자, 자릿수 6-7
	//주소값 juso4가 공백일때
	if(juso4 == null || juso4.trim().equals("")) {
		juso4 = "-";
	}
	
	String jumin = jumin1 + "-" + jumin2;
	
	
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
			
			//form 태그에서 <input type="file" name="여기에 지정한 이름"/> 을 가져온다.
			tagName = (String)files.nextElement();
			//out.println("tagName : " + tagName + "<br>");
			
			//input file name에 해당하는 실제 파일을 가져옴
			File fileObj = multi.getFile(tagName);
			//out.println("fileObj : " + fileObj + "<br>");
			
			String imsiResult = "";
			
			// 해당 tagName에 파일을 첨부했으면
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
				
				
				//UUID : 중복이 안되는 값으로 자동생성
				newFileName = UUID.randomUUID().toString() + "." + fileExtName;// 새로 생성할 파일 이름.확장자
				String oldFilePath = uploadPath + "/" + FileSavedName; // 기존 서버에 저장된 파일명
				String newFilePath = uploadPath + "/" + newFileName; // 저장된 파일명을 변경
				File f1 = new File(oldFilePath);
				
				if(f1.exists()) { //기존에 저장한 파일이 있으면
					File newFile = new File(uploadPath + "/" + newFileName);
					f1.renameTo(newFile); //기존파일을 newFile로 바꿈
					FileSavedName = newFileName;
				}
				
				//oldFilePath : c:/jih/attach/jspPortfolioModel1/member/수박1.png
				//newFilePath :  c:/jih/attach/jspPortfolioModel1/member/051d2b3c-e224-4d2c-9227-15e43b9e6472.png
				
				if(!attachInfo.trim().equals("")) {
					attachInfo += ",";
				}
				attachInfo += fileOriginName + "|"; //기존파일명
				attachInfo += FileSavedName + "|"; //서버에서의 파일명
				attachInfo += fileType + "|";
				attachInfo += fileSize;
			}
			
			//fileOriginName : 수박.png
			//FileSavedName : 051d2b3c-e224-4d2c-9227-15e43b9e6472.png
			//fileType: image/png
			//fileSize: 271977
			//fileExtName:png
			//FileSavedName: 051d2b3c-e224-4d2c-9227-15e43b9e6472.png
			
		}
	} catch (Exception e) {
		//e.printStackTrace();
	}
	
	out.println("attachInfo : " + attachInfo);
	//수박.png|1bab8935-75b4-42f0-8251-56aea56ffc21.png|image/png|271977
	
	MemberDTO arguDto = new MemberDTO();
	arguDto.setId(id);
	arguDto.setPasswd(passwd);
	arguDto.setName(name);
	arguDto.setPhone(phone);
	arguDto.setEmail(email);
	arguDto.setJumin(jumin);
	arguDto.setJuso1(juso1);
	arguDto.setJuso2(juso2);
	arguDto.setJuso3(juso3);
	arguDto.setJuso4(juso4);
	arguDto.setGrade(grade);
	arguDto.setAttachInfo(attachInfo);
	
	MemberDAO dao = new MemberDAO();
	int result = dao.setInsert(arguDto);
	
	if (result > 0) {
		out.println("<script>");	
		out.println("location.href='main.jsp?menuGubun=member_list';");	
		out.println("</script>");	
	} else {
		out.println("<script>");	
		out.println("alert('등록 중 오류가 발생했습니다.');");	
		out.println("location.href='main.jsp?menuGubun=member_chuga';");	
		out.println("</script>");	
	}
%>