<!-- WebContent/book/sakjeProc.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="book.model.dao.BookDAO"%>
<%@page import="book.model.dto.BookDTO"%>

<%@page import="java.sql.Date"%>

<%
 	request.setCharacterEncoding("UTF-8");
	
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);

	
	BookDTO arguDto = new BookDTO();
	arguDto.setNo(no);
	
	BookDAO dao = new BookDAO();
	int result = dao.setDelete(arguDto);
	
	if (result > 0) {
		out.println("<script>");
		out.println("alert('정상적으로 삭제되었습니다.');");
		out.println("location.href='view.jsp?no=" + no + "';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('정상적으로 삭제되지않았습니다.');");
		out.println("location.href='sakje.jsp?no=" + no + "';");
		out.println("</script>");
	}
	
%>



