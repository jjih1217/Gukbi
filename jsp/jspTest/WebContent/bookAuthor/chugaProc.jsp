
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="bookAuthor.model.dto.BookAuthorDTO"%>
<%@page import="bookAuthor.model.dao.BookAuthorDAO"%>

<%
	request.setCharacterEncoding("UTF-8");
	String author = request.getParameter("author");
	
	BookAuthorDTO arguDto = new BookAuthorDTO();
	arguDto.setAuthor(author);
	
	BookAuthorDAO dao = new BookAuthorDAO();
	int result = dao.setInsert(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('추가 처리 중 오류가 발생했습니다.');");
		out.println("location.href='chuga.jsp';");
		out.println("</script>");
	}
%>