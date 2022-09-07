<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="_inc_top.jsp" %>

<%
	String passwd = request.getParameter("passwd");
	
	Util util = new Util();
	
	int failCounter = 0;

	passwd = util.getNullBlankCheck(passwd, "");
	passwd = util.getCheckString(passwd);
	if (passwd.length() <= 0) { failCounter++; }
	
	
	if (failCounter > 0 ) {
		out.println("<script>");
		out.println("alert('입력값이 정확하지 않습니다.');");
		out.println("location.href='main.jsp?menuGubun=board_list';");
		out.println("</script>");
		return;
	}
	
	BoardDTO arguDto = new BoardDTO();
	arguDto.setNo(dto.getNo());
	arguDto.setPasswd(dto.getPasswd());
	
	BoardDAO sujungDao = new BoardDAO();
	int result = sujungDao.setDelete(arguDto);
	
	String ment = "";
	String addr = "";
	if ( result > 0 ) {
		ment = "";
		addr = "main.jsp?menuGubun=board_view&no=" + dto.getNo();
	} else {
		ment = "수정 중 오류가 발생했습니다.";
		addr = "main.jsp?menuGubun=board_sujung&no=" + dto.getNo();
	}
	
	out.println("<script>");
	if (result > 0) {
		
	} else {
		out.println("alert('"  + ment + "');");
	}
	
	out.println("location.href='" + addr + "';");
	out.println("</script>");
%>