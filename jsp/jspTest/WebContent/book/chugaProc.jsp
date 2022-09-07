<!-- WebContent/book/chugaProc.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.sql.Date"%>

<%@page import="book.model.dao.BookDAO"%>
<%@page import="book.model.dto.BookDTO"%>

<%
 	request.setCharacterEncoding("UTF-8");

	String subject = request.getParameter("subject");
	String author = request.getParameter("author");
	String created_ = request.getParameter("created");
	String profile = request.getParameter("profile");
	
	Date created = Date.valueOf(created_);
	
	BookDTO arguDto = new BookDTO();
	arguDto.setSubject(subject);
	arguDto.setAuthor(author);
	arguDto.setCreated(created);
	arguDto.setProfile(profile);
	
	BookDAO dao = new BookDAO();
	int result = dao.setInsert(arguDto);
	
	if( result > 0 ) {
		out.println("<script>");
		out.println("location.href='list.jsp';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('추가 처리 중 오류가 발생했습니다.')");
		out.println("location.href='chuga.jsp';");
		out.println("</script>");
	}
	
%>

