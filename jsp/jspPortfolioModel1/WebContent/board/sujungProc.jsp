<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>

<%
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	//DBNoticeNo
	String dbNoticeNo_ = request.getParameter("dbNoticeNo");
	int dbNoticeNo = Integer.parseInt(dbNoticeNo_);
	
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String noticeGubun = request.getParameter("noticeGubun");
	String secretGubun = request.getParameter("secretGubun");
	BoardDAO dao = new BoardDAO();
	
	int memberNo = sessionNo;
	String attachInfo = "-";
	
	//공지글수정 ex01 > imsiDTO 생성 후 사용
	/* 
	BoardDTO imsiDto1 = new BoardDTO();
	imsiDto1.setNo(no);
	
	BoardDTO imsiDto2 = dao.getSelectOne(imsiDto1);
	int noticeNo = 0;
	if(noticeGubun.equals("T")) { //공지글로 수정
		if(imsiDto2.getNoticeNo() > 0) { //기존 글이 공지글일때 (DB에 있는 값을 불러와야함 -> getSelectOne)
			noticeNo = imsiDto2.getNoticeNo();
		} else {//기존 글이 공지글아님 일때
			noticeNo = dao.getMaxNumRefNo("noticeNo") + 1;	
		}
	} 
	*/
	
	//공지글수정 ex03 > sujung에서 넘어온 dbNoticeNo
	int noticeNo = 0;
	if(noticeGubun.equals("T")) { //공지글로 수정
		if(dbNoticeNo > 0) { // 기존 글이 공지글
			noticeNo = dbNoticeNo;
		} else {
			noticeNo = dao.getMaxNumRefNo("noticeNo") + 1;	
		}
	} 
	
	BoardDTO arguDto = new BoardDTO();
	arguDto.setNo(no);
	arguDto.setSubject(subject);
	arguDto.setContent(content);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	arguDto.setMemberNo(memberNo);
	arguDto.setNoticeNo(noticeNo);
	arguDto.setSecretGubun(secretGubun);
	arguDto.setAttachInfo(attachInfo);
	
	
	//비밀번호처리
	BoardDTO returnDto = dao.getSelectOne(arguDto);
	
	if(!returnDto.getPasswd().equals(passwd)){ //수정한 pw와 기존 pw 비교
		out.println("<script>");
		out.println("alert('입력한 비밀번호가 다릅니다. \\n확인 후 다시 입력해주세요');");
		out.println("location.href='main.jsp?menuGubun=board_sujung&no=" + no + "';");
		out.println("</script>");
		out.println("");
	}
	
	//공지글 수정 ex02 > 기존에 있는 returnDto 사용 후 arguDto.setNoticeNo(noticeNo);
	/* int noticeNo = 0;
	if(noticeGubun.equals("T")) { 
		if(returnDto.getNoticeNo() > 0) {
			noticeNo = returnDto.getNoticeNo();
		} else {//기존 글이 공지글아님 일때
			noticeNo = dao.getMaxNumRefNo("noticeNo") + 1;	
		}
	}
	arguDto.setNoticeNo(noticeNo); */
	
	
	int result = dao.setUpdate(arguDto);
	
	String ment = "";
	String addr = "";
	if ( result > 0 ) {
		ment = "수정성공";
		addr = "main.jsp?menuGubun=board_list";
	} else {
		ment = "수정 중 오류가 발생했습니다.";
		addr = "main.jsp?menuGubun=board_sujung&no=" + no;
	}
	
	out.println("<script>");
	out.println("alert('"  + ment + "');");
	out.println("location.href='" + addr + "';");
	out.println("</script>"); 
	
%>