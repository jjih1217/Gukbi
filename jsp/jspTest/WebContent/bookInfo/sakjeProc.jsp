

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>

   
<%
	request.setCharacterEncoding("UTF-8");
	String infoNo_ = request.getParameter("infoNo");
	String subject = request.getParameter("subject");
	String created = request.getParameter("created");
	String authorNo_ = request.getParameter("authorNo");
	String profileNo_ = request.getParameter("profileNo");
	
	int infoNo = Integer.parseInt(infoNo_);
	int authorNo = Integer.parseInt(authorNo_);
	int profileNo = Integer.parseInt(profileNo_);
	
	BookInfoDTO arguDto = new BookInfoDTO();
	arguDto.getInfoNo();
	arguDto.getSubject();
	arguDto.getCreated();
	arguDto.getAuthorNo();
	arguDto.getProfileNo();
	
	BookInfoDAO dao = new BookInfoDAO();
	int result = dao.setDelete(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('삭제 처리 중 오류가 발생했습니다.');");
		out.println("location.href='sakje.jsp?infoNo=" + infoNo + "';");
		out.println("</script>");
	}
%>