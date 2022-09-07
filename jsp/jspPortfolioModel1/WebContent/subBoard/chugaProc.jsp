<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="_inc_top.jsp" %> 

<% 
	String writer = request.getParameter("writer");
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String noticeGubun = request.getParameter("noticeGubun");
	String secretGubun = request.getParameter("secretGubun");
	
	SubBoardDAO subBoardDao = new SubBoardDAO();
	
	int num = subBoardDao.getMaxNumRefNoNoticeNo("num") + 1; //num 필드의 최대값 + 1
	String tbl = "-";
	
	//새글일때
	int refNo = subBoardDao.getMaxNumRefNoNoticeNo("refNo") + 1; //refNo 필드의 최대값  +1
	int stepNo = 1;   //1 대입
	int levelNo = 1;  //1 대입 
	int parentNo = 0; //0 대입
	
	int hit = 0;
	//String ip = "";
	int memberNo = sessionNo;
	
	int noticeNo = 0; //공지글아님
	if (noticeGubun.equals("T")) {
		noticeNo = subBoardDao.getMaxNumRefNoNoticeNo("noticeNo") + 1; //noticeNo 필드의 최대값 + 1
	}
	
	String attachInfo = "-";
	
	SubBoardDTO arguDto = new SubBoardDTO();
	arguDto.setNum(num);
	arguDto.setTbl(tbl);
	arguDto.setWriter(writer);
	arguDto.setSubject(subject);
	arguDto.setContent(content);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	arguDto.setRefNo(refNo);
	arguDto.setStepNo(stepNo);
	arguDto.setLevelNo(levelNo);
	arguDto.setParentNo(parentNo);
	arguDto.setHit(hit);
	arguDto.setIp(ip);
	arguDto.setMemberNo(memberNo);
	arguDto.setNoticeNo(noticeNo);
	arguDto.setSecretGubun(secretGubun);
	arguDto.setAttachInfo(attachInfo);
	
	int result = subBoardDao.setInsert(arguDto);
	
	if (result > 0) {
		out.println("<script>");
		out.println("alert('등록성공');");
		out.println("location.href='main.jsp?menuGubun=subBoard_list';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록실패');");
		out.println("location.href='main.jsp?menuGubun=subBoard_chuga';");
		out.println("</script>");
	}

	
%>