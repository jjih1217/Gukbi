<!-- WebContent/memberBasic/sujungProc.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="memberBasic.MemberBasicDAO"%>
<%@page import="memberBasic.MemberBasicDTO"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	
	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);

	String passwd = request.getParameter("passwd");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	String juso1 = request.getParameter("post1");
	String juso2 = request.getParameter("post2");
	String juso3 = request.getParameter("post3");
	String juso4 = request.getParameter("post4");
	
	if(juso4 == null || juso4.trim().equals("")){ 
		juso4 = "-";
	}
	
	MemberBasicDTO arguDto = new MemberBasicDTO();
	arguDto.setNo(no);
	arguDto.setPasswd(passwd);
	arguDto.setPhone(phone);
	arguDto.setEmail(email);
	arguDto.setJuso1(juso1);
	arguDto.setJuso2(juso2);
	arguDto.setJuso3(juso3);
	arguDto.setJuso4(juso4);
	
	MemberBasicDAO dao = new MemberBasicDAO();
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

