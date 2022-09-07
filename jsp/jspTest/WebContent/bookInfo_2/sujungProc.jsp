<%@page import="bookInfo.model.dao.BookInfoDAO"%>
<%@page import="bookInfo.model.dto.BookInfoDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@page import="java.sql.Date"%>

<%
	request.setCharacterEncoding("UTF-8");
	String infoNo_ = request.getParameter("infoNo");
	int infoNo = Integer.parseInt(infoNo_);
	
	String subject = request.getParameter("subject");
	String authorNo_ = request.getParameter("authorNo");
	String created_ = request.getParameter("created");
	String profileNo_ = request.getParameter("profileNo");
	
	Date created = Date.valueOf(created_);
	
	int authorNo = Integer.parseInt(authorNo_);
	int profileNo = Integer.parseInt(profileNo_);
	
	
	BookInfoDTO arguDtO = new BookInfoDTO();
	arguDtO.setInfoNo(infoNo);
	arguDtO.setSubject(subject);
	arguDtO.setAuthorNo(authorNo);
	arguDtO.setCreated(created);
	arguDtO.setProfileNo(profileNo);
	
	BookInfoDAO dao = new BookInfoDAO();
	int result = dao.setUpdate(arguDtO);
	
	if(result > 0) {
		out.println("<script>location.href = 'view.jsp?infoNo=" + infoNo +"';</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 처리중 오류가 발생했습니다.');");
		out.println("location.href = 'sujung.jsp?infoNo="+infoNo+"';");
		out.println("</script>");
	}
%>