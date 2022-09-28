<%@page import="com.itextpdf.text.log.SysoCounter"%>
<%@page import="application.model.dao.MemberDAO"%>
<%@page import="application.model.dto.MemberDTO"%>
<%@page import="common.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    request.setCharacterEncoding("UTF-8");

   	Util util = new Util();
   	String id = request.getParameter("id");
   	String passwd = request.getParameter("passwd");
   	
    MemberDTO arguDto = new MemberDTO();
   	arguDto.setId(id);
   	arguDto.setPasswd(passwd);
   	
   	MemberDAO dao = new MemberDAO();
   	MemberDTO returnDto = dao.getLogin(arguDto);
   	
  	if(returnDto.getId() != null) {
	 	session.setMaxInactiveInterval(1 * 60);
   		session.setAttribute("sessionId", returnDto.getId());
   		
   		if(returnDto.getMonth() > 6) {
   			out.println("<script>");
   			out.println("alert('6개월동안 비밀번호를 변경하지 않았습니다.\\n비밀번호변경 페이지로 이동합니다');");
   			out.println("location.href='change.jsp'");
   			out.println("</script>");
   		} else {
   			out.println("<script>");
   	   		out.println("alert('로그인 성공');");
   	   		out.println("location.href='main.jsp'");
   	   		out.println("</script>");
   		}
   	} else {
   			out.println("<script>");
	   		out.println("location.href='login.jsp'");
	   		out.println("</script>");
   	}
   	
   %>