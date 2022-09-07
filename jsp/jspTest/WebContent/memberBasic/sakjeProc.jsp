<!-- WebContent/memberBasic/sakjeProc.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="memberBasic.MemberBasicDAO"%>
<%@page import="memberBasic.MemberBasicDTO"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);

	String passwd = request.getParameter("passwd");
	
	MemberBasicDTO arguDto = new MemberBasicDTO();
	arguDto.setNo(no);
	arguDto.setPasswd(passwd);
	
	MemberBasicDAO dao = new MemberBasicDAO();
	int result = dao.setDelete(arguDto);
	
	if (result > 0) {
		out.println("<script>");
		out.println("alert('정상적으로 삭제되었습니다.');");
		out.println("location.href='list.jsp';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('정상적으로 삭제되지않았습니다.');");
		out.println("location.href='sakje.jsp?no=" + no + "';");
		out.println("</script>");
	}
	
%>

