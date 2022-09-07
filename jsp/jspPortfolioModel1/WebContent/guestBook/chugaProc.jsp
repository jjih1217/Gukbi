<%@page import="config.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>

<%@ include file="../_include/inc_sessionChk.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	String content = request.getParameter("content");

	Util util = new Util();
	name = util.getNullBlankCheck(name, "");
	email = util.getNullBlankCheck(email, "");
	passwd = util.getNullBlankCheck(passwd, "");
	content = util.getNullBlankCheck(content, "");

	name = util.getCheckString(name);
	email = util.getCheckString(email);
	passwd = util.getCheckString(passwd);
	content = util.getCheckString(content);
	passwd = util.getCheckString(passwd);
	
	
	GuestBookDTO arguDto = new GuestBookDTO();
	arguDto.setName(name);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	arguDto.setContent(content);
	arguDto.setMemberNo(sessionNo);
	
	GuestBookDAO dao = new GuestBookDAO();
	int result = dao.setInsert(arguDto);
	
	if (result > 0) {
		out.println("<script>");	
		out.println("location.href='main.jsp?menuGubun=guestBook_list';");	
		out.println("</script>");	
	} else {
		out.println("<script>");	
		out.println("alert('등록 중 오류가 발생했습니다.');");	
		out.println("location.href='main.jsp?menuGubun=guestBook_chuga';");	
		out.println("</script>");	
	}
	
%>