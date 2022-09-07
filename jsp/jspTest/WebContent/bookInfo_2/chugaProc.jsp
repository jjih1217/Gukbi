<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@page import="java.sql.Date"%>

<%
	request.setCharacterEncoding("UTF-8");

	String subject = request.getParameter("subject");
	String authorNo_ = request.getParameter("authorNo");
	String created_ = request.getParameter("created");
	String profileNo_ = request.getParameter("profileNo");
	
	int authorNo = Integer.parseInt(authorNo_);
	int profileNo = Integer.parseInt(profileNo_);
	
	
	Date created = Date.valueOf(created_);
	
	BookInfoDTO arguDtO = new BookInfoDTO();
	arguDtO.setSubject(subject);
	arguDtO.setAuthorNo(authorNo);
	arguDtO.setCreated(created);
	arguDtO.setProfileNo(profileNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	int result = dao.setInsert(arguDtO);
	
	if(result > 0) {
		out.println("<script>location.href = 'list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('추가 처리중 오류가 발생했습니다.');");
		out.println("location.href = 'list.jsp';");
		out.println("</script>");
	}
	
%>