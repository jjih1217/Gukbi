<%@page import="config.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="_inc_top.jsp" %>

<%
	//String writer = request.getParameter("writer");
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	String noticeNo_ = request.getParameter("noticeNo");
	
	String noticeGubun = request.getParameter("noticeGubun");
	String secretGubun = request.getParameter("secretGubun");
	//null, 공백, html entity 체크
	//noticeGubun, secretGubun 은 T, F를 제외한 값은 return or F 처리 추가
	Util util = new Util();
	
	int failCounter = 0;
	
	email = util.getNullBlankCheck(email, "");
	email = util.getCheckString(email);
	if (email.length() <= 0) { failCounter++; }
	
	passwd = util.getNullBlankCheck(passwd, "");
	passwd = util.getCheckString(passwd);
	if (passwd.length() <= 0) { failCounter++; }
	
	subject = util.getNullBlankCheck(subject, "");
	subject = util.getCheckString(subject);
	if (subject.length() <= 0) { failCounter++; }
	
	content = util.getNullBlankCheck(content, "");
	content = util.getCheckString(content);
	if (content.length() <= 0) { failCounter++; }
	
	noticeNo_ = util.getNullBlankCheck(noticeNo_, "0");
	if (noticeNo_.equals("")) {  failCounter++; }
	int BoxNoticeNo = Integer.parseInt(noticeNo_);
	
	noticeGubun = util.getNullBlankCheck(noticeGubun, "");
	if ( !(noticeGubun.equals("T") || noticeGubun.equals("F")) ) {
		failCounter++;
	}
	
	secretGubun = util.getNullBlankCheck(secretGubun, "");
	if ( !(secretGubun.equals("T") || secretGubun.equals("F")) ) {
		failCounter++;
	}
	
	if (noticeGubun.equals("T") && secretGubun.equals("T")) { 
		failCounter++;
	}
	
	if(!dto.getPasswd().equals(passwd)) {
		failCounter++;
	}
	
	if (failCounter > 0 ) {
		out.println("<script>");
		out.println("alert('입력값이 정확하지 않습니다.');");
		out.println("location.href='main.jsp?menuGubun=board_list';");
		out.println("</script>");
		return;
	}
	
	
	int memberNo = sessionNo;
	
	/*
	공지글아님 -> 공지글아님 -> 0
	공지글아님 -> 공지글
	
	공지글 -> 공지글
	공지글 -> 공지글아님 -> 0
	*/
	int noticeNo = 0;
	if(noticeGubun.equals("T")) { //공지글로 변경
		if(BoxNoticeNo > 0){ //기존글이 공지
			noticeNo = dto.getNoticeNo(); //DB에 있는 값 그대로 대입
		} else { //기존글이 공지아님
			noticeNo = dao.getMaxNumRefNo("noticeNo") + 1;
		}
	}
	
	String attachInfo = dto.getAttachInfo();
			
	BoardDTO arguDto = new BoardDTO();
	arguDto.setNo(dto.getNo()); //중요
	arguDto.setSubject(subject);
	arguDto.setContent(content);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	//arguDto.setMemberNo(memberNo);
	arguDto.setNoticeNo(noticeNo); 
	arguDto.setSecretGubun(secretGubun);
	arguDto.setAttachInfo(attachInfo);
	
	BoardDAO sujungDao = new BoardDAO();
	int result = sujungDao.setUpdate(arguDto);
	
	String ment = "";
	String addr = "";
	if ( result > 0 ) {
		ment = "";
		addr = "main.jsp?menuGubun=board_view&no=" + dto.getNo();
	} else {
		ment = "수정 중 오류가 발생했습니다.";
		addr = "main.jsp?menuGubun=board_sujung&no=" + dto.getNo();
	}
	
	out.println("<script>");
	if (result > 0) {
		
	} else {
		out.println("alert('"  + ment + "');");
	}
	
	out.println("location.href='" + addr + "';");
	out.println("</script>");
	
%>