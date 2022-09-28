<%@page import="java.sql.Date"%>
<%@page import="application.model.dao.MemberDAO"%>
<%@page import="application.model.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    request.setCharacterEncoding("UTF-8");

   	String id = request.getParameter("id");
   	String passwd = request.getParameter("passwd");
   	String passwdChk = request.getParameter("passwdChk");
   	
   	int failCounter = 0;
   	if(passwd == null || passwdChk == null || passwd.trim().equals("") || passwdChk.trim().equals("")) {
   		response.sendRedirect("change.jsp");
   		return;
   	} 
   	
 	if(!passwd.equals(passwdChk) ) {
 		response.sendRedirect("change.jsp");
 		return;
	}
   	
 	String sessionId = (String) session.getAttribute("sessionId");
 	
   	MemberDTO arguDto = new MemberDTO();
   	arguDto.setId(sessionId);
   	arguDto.setPasswd(passwd);
   	
	MemberDAO dao = new MemberDAO();
   	int result  = dao.setUpdate(arguDto);
   
   	if (result > 0) {
		out.println("<script>");	
		out.println("alert('비밀번호 변경 성공')");	
		out.println("location.href='main.jsp'");
		out.println("</script>");	
	} else {
		out.println("<script>");	
		out.println("alert('수정 중 오류 발생');");	
		out.println("location.href='change.jsp?id=" + id + "'");
		out.println("</script>");	
	}
  
   %>