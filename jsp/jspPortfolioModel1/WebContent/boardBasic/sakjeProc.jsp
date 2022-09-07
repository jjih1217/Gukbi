<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="boardBasic.model.dao.BoardBasicDAO"%>
<%@page import="boardBasic.model.dto.BoardBasicDTO"%> 

<%@ include file = "_inc_top.jsp" %>

<%   
    request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	int no = Integer.parseInt(no_);
	
	String parentNo_ = request.getParameter("parentNo");
	int parentNo = Integer.parseInt(parentNo_);
	
	String passwd = request.getParameter("passwd");
	
	BoardBasicDTO arguDto = new BoardBasicDTO();
	arguDto.setNo(no);
	arguDto.setPasswd(passwd);
	
	arguDto.setParentNo(parentNo);
	
	
	BoardBasicDAO dao = new BoardBasicDAO();
	
	//비밀번호 확인 처리(DB에서 처리하기 전에 실행)
	BoardBasicDTO returnDto = dao.getSelectOne(arguDto);
	if(!passwd.equals(returnDto.getPasswd())) {
		out.println("<script>");	
		out.println("alert('입력한 비밀번호가 다릅니다.');");	
		out.println("location.href='main.jsp?menuGubun=boardBasic_sujung&no=" + no + "';");	
		out.println("</script>");	
		return;
	}
	
	//답글이 있으면 삭제가 안됨
	/* if( no == arguDto.getParentNo()) {
		out.println("<script>");	
		out.println("alert('삭제할수 없습니당');");	
		out.println("</script>");	
		return;
	} */
	

	int result = dao.setDelete(arguDto);
	
	if (result > 0) {
		out.println("<script>");	
		out.println("location.href='main.jsp?menuGubun=boardBasic_list';");	
		out.println("</script>");	
	} else {
		out.println("<script>");	
		out.println("alert('삭제 중 오류가 발생했습니다.');");	
		out.println("location.href='main.jsp?menuGubun=boardBasic_sakje&no=" + no + "';");	
		out.println("</script>");	
	}

%>