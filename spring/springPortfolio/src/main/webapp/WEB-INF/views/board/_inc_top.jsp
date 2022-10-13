<%@page import="com.jih.springPortfolio.board.model.dto.BoardChkDTO"%>
<%@page import="com.jih.springPortfolio.board.model.dao.BoardChkDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>


<%	
	String tbl = request.getParameter("tbl");
	if(tbl == null || tbl.trim().equals("")) {
		tbl = "freeboard"; 
	}
	
	//tbl 중복체크
	BoardChkDAO boardChkDao = new BoardChkDAO();
	BoardChkDTO returnTblDto = boardChkDao.getSelectOne(tbl);
	
	//게시판관리에서 추가한 게시판만 나타냄
	String imsiBoardTitle = "";
	if (returnTblDto.getBoardChkNo() > 0) {
		imsiBoardTitle = returnTblDto.getTblName();
	} else {
		out.println("<script>");
		out.println("alert('없는 게시판입니다');");
		out.println("location.href='main.jsp?menuGubun=subBoard_list&tbl=freeboard'");
		out.println("</script>");
	}
	
	//게시판목록명
	if(tbl.equals("free")) {
		imsiBoardTitle = "자유";
	} else if (tbl.equals("onebyone")) {
		imsiBoardTitle = "1:1";
	} else if (tbl.equals("qna")) {
		imsiBoardTitle = "Q&A";
	} else {
		out.println("<script>");
		out.println("alert('return freeboard')");
		out.println("location.href='main.jsp?menuGubun=subBoard_list&tbl=freeboard';");
		out.println("</script>");
	}
	
%>
