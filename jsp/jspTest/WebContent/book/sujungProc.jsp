<!-- WebContent/book/sujungProc.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="book.model.dao.BookDAO"%>
<%@page import="book.model.dto.BookDTO"%>

<%@page import="java.sql.Date"%>

<%
 	request.setCharacterEncoding("UTF-8");
	
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);

	String subject = request.getParameter("subject");
	String author = request.getParameter("author");
	String created_ = request.getParameter("created");
	String profile = request.getParameter("profile");
	
	Date created = Date.valueOf(created_);
	
	BookDTO arguDto = new BookDTO();
	arguDto.setNo(no);
	arguDto.setSubject(subject);
	arguDto.setAuthor(author);
	arguDto.setCreated(created);
	arguDto.setProfile(profile);
	
	BookDAO dao = new BookDAO();
	int result = dao.setUpdate(arguDto);
	
	if (result > 0) {
		out.println("<script>");
		out.println("alert('정상적으로 수정되었습니다.');");
		out.println("location.href='view.jsp?no=" + no + "';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('정상적으로 수정되지않았습니다.');");
		out.println("location.href='sujung.jsp?no=" + no + "';");
		out.println("</script>");
	}
	
%>

