<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>

<%	
	//답글 no 추가
	String no_ = request.getParameter("no");
	
	int failCounter = 0;
	if(no_ == null || no_.trim().equals("")) { //앞에서 int처리 함
		failCounter++;
	}
	int no = Integer.parseInt(no_);

	String writer = request.getParameter("writer");
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String noticeGubun = request.getParameter("noticeGubun");
	String secretGubun = request.getParameter("secretGubun");
	
	BoardDAO dao = new BoardDAO();
	
	int num = dao.getMaxNumRefNo("num") + 1;
	String tbl = "-";
	
	//새글
	int refNo = dao.getMaxNumRefNo("refNo") + 1;
	int stepNo = 1;
	int levelNo = 1;
	int parentNo = 0;
	
	if(no > 0) { //답변글
		BoardDTO boardDto1 = new BoardDTO();
		boardDto1.setNo(no);
		
		BoardDAO boardDao1 = new BoardDAO();
		BoardDTO boardDto2 = boardDao1.getSelectOne(boardDto1);
		
		boardDao1.setUpdateRelevel(boardDto2);
		//부모글의 levelNo보다 큰 levelNo들은 1씩 증가
		refNo = boardDto2.getRefNo(); //부모글의 refNo
		stepNo = boardDto2.getStepNo() + 1; //부모글의 stepNo + 1
		levelNo = boardDto2.getLevelNo() + 1; //부모글의 levelNo + 1
		parentNo = no;
	}
	
	
	
	int hit = 0;
	//String ip = "";
	int memberNo = sessionNo;
	
	int noticeNo = 0;
	if(noticeGubun.equals("T")) { //공지글이면
		noticeNo = dao.getMaxNumRefNo("noticeNo") + 1;	
	}
	
	String attachInfo = "-";
	
	BoardDTO arguDto = new BoardDTO();
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
	
	int result = dao.setInsert(arguDto);
	
	String ment = "";
	String addr = "";
	if ( result > 0 ) {
		ment = "등록성공";
		addr = "main.jsp?menuGubun=board_list";
	} else {
		ment = "등록 중 오류가 발생했습니다.";
		addr = "main.jsp?menuGubun=board_chuga";
	}
	
	out.println("<script>");
	out.println("alert('"  + ment + "');");
	out.println("location.href='" + addr + "';");
	out.println("</script>");
	
%>