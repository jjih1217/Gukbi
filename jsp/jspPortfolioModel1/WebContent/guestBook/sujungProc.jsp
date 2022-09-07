<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="guestBook.model.dao.GuestBookDAO"%>
<%@page import="guestBook.model.dto.GuestBookDTO"%>

<%   
    request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);

	String name = request.getParameter("name");
	String email = request.getParameter("email");
	String passwd = request.getParameter("passwd");
	String content = request.getParameter("content");
	
	
	GuestBookDTO arguDto = new GuestBookDTO();
	arguDto.setNo(no);
	arguDto.setName(name);
	arguDto.setEmail(email);
	arguDto.setPasswd(passwd);
	arguDto.setContent(content);
	
	GuestBookDAO dao = new GuestBookDAO();
	
	//비밀번호 확인 처리
	GuestBookDTO returnDto = dao.getSelectOne(arguDto);
	if(!passwd.equals(returnDto.getPasswd())) {
		out.println("<script>");	
		out.println("alert('입력한 비밀번호가 다릅니다.');");	
		out.println("location.href='main.jsp?menuGubun=guestBook_sujung&no=" + no + "';");	
		out.println("</script>");	
		return;
	}
			
	int result = dao.setUpdate(arguDto);
	
	if (result > 0) {
		out.println("<script>");	
		out.println("location.href='main.jsp?menuGubun=guestBook_view&no=" + no + "';");	
		out.println("</script>");	
	} else {
		out.println("<script>");	
		out.println("alert('수정 중 오류가 발생했습니다.');");	
		out.println("location.href='main.jsp?menuGubun=guestBook_sujung&no=" + no + "';");	
		out.println("</script>");	
	}

%>