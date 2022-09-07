
<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="config.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="boardBasic.model.dto.BoardBasicDTO"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	
	Util util = new Util();
	
	writer = util.getNullBlankCheck(writer, "");
	subject = util.getNullBlankCheck(subject, "");
	content = util.getNullBlankCheck(content, "");
	email = util.getNullBlankCheck(email, "");
	passwd = util.getNullBlankCheck(passwd, "");
	
	BoardBasicDAO dao = new BoardBasicDAO();
	
	// num
	int num = dao.getMaxNum() + 1;
	
	// reply
	BoardBasicDTO imsiDto = new BoardBasicDTO();
	imsiDto.setNo(no);
	
	BoardBasicDTO returnDto = dao.getSelectOne(imsiDto);
	
	dao.setUpdateRelevel(returnDto);

	int refNo = returnDto.getRefNo();
	int stepNo = returnDto.getStepNo() + 1;
	int levelNo = returnDto.getLevelNo() + 1;
	
	//조회수
	int hit = 0;
	
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
	
	//BoardBasicDAO dao = new BoardBasicDAO();
	int result = dao.setInsert(arguDto);
	
	if (result > 0) {
		out.println("<script>");	
		out.println("location.href='main.jsp?menuGubun=boardBasic_list';");	
		out.println("</script>");	
	} else {
		out.println("<script>");	
		out.println("alert('답변글 처리 중 오류가 발생했습니다.');");	
		out.println("location.href='main.jsp?menuGubun=boardBasic_reply';");	
		out.println("</script>");	
	}
	
%>