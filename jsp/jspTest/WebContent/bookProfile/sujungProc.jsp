

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<%@page import="bookProfile.model.dao.BookProfileDAO"%>
<%@page import="bookProfile.model.dto.BookProFileDTO"%>

<%
	request.setCharacterEncoding("UTF-8");

	String profileNo_ = request.getParameter("profileNo");
	String profile = request.getParameter("profile");
	
	int profileNo = Integer.parseInt(profileNo_);
	
	BookProFileDTO arguDto = new BookProFileDTO();
	arguDto.setProfileNo(profileNo);
	arguDto.setProfile(profile);
	
	BookProfileDAO dao = new BookProfileDAO();
	int result = dao.setUpdate(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 처리 중 오류가 발생했습니다.');");
		out.println("location.href='sujung.jsp?profileNo=" + profileNo + "';");
		out.println("</script>");
	}
%>