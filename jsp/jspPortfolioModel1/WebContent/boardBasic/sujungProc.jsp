<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%> 

<%@ include file = "_inc_top.jsp" %>

<%   
    request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);

	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	
	
	BoardBasicDTO arguDto = new BoardBasicDTO();
	arguDto.setNo(no);
	arguDto.setWriter(writer);
	arguDto.setSubject(subject);
	arguDto.setContent(content);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	
	BoardBasicDAO dao = new BoardBasicDAO();
	
	//비밀번호 확인 처리
	/* BoardBasicDTO returnDto = dao.getSelectOne(arguDto);
	if(!passwd.equals(returnDto.getPasswd())) {
		out.println("<script>");	
		out.println("alert('입력한 비밀번호가 다릅니다.');");	
		out.println("location.href='main.jsp?menuGubun=boardBasic_sujung&no=" + no + "';");	
		out.println("</script>");	
		return;
	} */
			
	int result = dao.setUpdate(arguDto);
	
	if (result > 0) {
		out.println("<script>");	
		out.println("location.href='main.jsp?menuGubun=boardBasic_view&no=" + no + "';");	
		out.println("</script>");	
	} else {
		out.println("<script>");	
		out.println("alert('수정 중 오류가 발생했습니다.');");	
		out.println("location.href='main.jsp?menuGubun=boardBasic_sujung&no=" + no + "';");	
		out.println("</script>");	
	}

%>