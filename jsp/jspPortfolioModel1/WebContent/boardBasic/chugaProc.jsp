<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="config.Util"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%>
<%@page import="boardBasic.model.dao.BoardBasicDAO"%>

<%@ include file = "_inc_top.jsp" %>

<%
	//post로 넘어오는 값 
	request.setCharacterEncoding("UTF-8");

	Util util = new Util();

	String no_ = request.getParameter("no");
	no_ = util.getNullBlankCheck(no_, "0"); 
	int no = Integer.parseInt(no_);
	
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	
	BoardBasicDAO dao = new BoardBasicDAO();
	 
	int num = dao.getMaxNum() + 1; //첫번째 레코드 : 0 + 1 ==> 1
	
	//새글일 때 no=0
	int refNo = dao.getMaxRefNo() + 1;
	int stepNo = 1;  //답변과 RE답변의 단계, 들여쓰기
	int levelNo = 1; //화면에 보여지는 순서
	int parentNo = 0;
	
	//답변글일 때
	if( no > 0 ) {
		BoardBasicDTO imsiArguDto = new BoardBasicDTO();
		imsiArguDto.setNo(no);
		
		BoardBasicDAO imsiDao = new BoardBasicDAO(); 
		BoardBasicDTO imsiReturnDto = imsiDao.getSelectOne(imsiArguDto);
		
		imsiDao.setUpdateRelevel(imsiReturnDto);
		
		refNo = imsiReturnDto.getRefNo(); //부모글의 refNo
		stepNo = imsiReturnDto.getStepNo() + 1; //부모글의 stepNo + 1
		levelNo = imsiReturnDto.getLevelNo() + 1;
		parentNo = no;
	}	
	
	
	//조회수
	int hit = 0;
	
	//로그인여부
	//int memberNo = 0; //비회원
	int memberNo = sessionNo;
	
	//String ip = ""; //inc_header에서 공유중임
	
/*
	새글 일때
	refNo   : refNo의 최대값 + 1
	stepNo  : 1
	levelNo : 1
	
	답변글(자식글) 일때
	refNo   : 부모글의 refNo
	stepNo  : 부모글의 stepNo + 1
	levelNo : 부모글의 refNo가 같은 것 중에서
			  부모글의 levelNo 보다 큰 값들은 1씩 증가시킨다.
			  그리고 levelNo + 1을 한다.
			  
    subject    refNo	 stepNo	   levelNo
	맥주		   1         1         1
	소주		   2         1         1
	막걸리	   3         1         1
	새우깡	   1         2         3          <-- 맥주
	두부김치	   2         2         3          <-- 소주
	땅콩     	   1         2         2          <-- 맥주  
	오징어	   2         2         2          <-- 소주 
	새우깡블	   1         3         5          <-- 새우깡 
	새우깡랙	   1         3         4          <-- 새우깡 
	
	refNo desc, levelNo asc
	막걸리	   3         1         1
	
	소주		   2         1         1
	 오징어	   2         2         2
	 두부김치	   2         2         3
	
	맥주		   1         1         1
	 땅콩		   1         2         2
	 새우깡	   1         2         3 
	  새우깡랙	   1         3         4      
	  새우깡블	   1         3         5        
	
*/
	
	BoardBasicDTO arguDto = new BoardBasicDTO();
	arguDto.setNum(num);
	arguDto.setWriter(writer);
	arguDto.setSubject(subject);
	arguDto.setContent(content);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	arguDto.setRefNo(refNo);
	arguDto.setStepNo(stepNo);
	arguDto.setLevelNo(levelNo);
	arguDto.setHit(hit);
	arguDto.setMemberNo(memberNo);
	arguDto.setIp(ip);
	arguDto.setParentNo(parentNo);
	
	int result = dao.setInsert(arguDto);
	
	if (result > 0) {
		out.println("<script>");	
		out.println("location.href='main.jsp?menuGubun=boardBasic_list';");	
		out.println("</script>");	
	} else {
		out.println("<script>");	
		out.println("alert('등록 중 오류가 발생했습니다.');");	
		out.println("location.href='main.jsp?menuGubun=boardBasic_chuga';");	
		out.println("</script>");	
	}
	
%>