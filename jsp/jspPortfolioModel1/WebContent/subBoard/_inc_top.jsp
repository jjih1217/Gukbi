<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>

<%@page import="subBoard.model.dto.SubBoardDTO"%>
<%@page import="subBoard.model.dao.SubBoardDAO"%>

<%@page import="subBoard.model.dto.SubBoardChkDTO"%>
<%@page import="subBoard.model.dao.SubBoardChkDAO"%>

<%@include file = "../_include/inc_header.jsp"%>
<%@include file = "../_include/inc_sessionChk.jsp"%>

<%	
	String tbl = request.getParameter("tbl");
	if(tbl == null || tbl.trim().equals("")) {
		tbl = "freeboard"; 
	}
	
	//tbl 중복체크
	SubBoardChkDAO subBoardChkDao = new SubBoardChkDAO();
	SubBoardChkDTO returnTblDto = subBoardChkDao.getSelectOne(tbl);
	
	//out.println("<hr>" + returnTblDto.getBoardChkNo()+ "< hr>");
	//게시판관리에서 추가한 게시판만 나타냄
	String imsiBoardTitle = "";
	if (returnTblDto.getBoardChkNo() > 0) {
		imsiBoardTitle = returnTblDto.getTblName();
	} else {
		out.println("<script>");
		out.println("alert('없는 게시판');");
		out.println("location.href='main.jsp?menuGubun=subBoard_list&tbl=freeboard'");
		out.println("</script>");
	}
	
	//게시판목록명
	if(tbl.equals("freeboard")) {
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
	
	// 현재 페이지 정보 설정
	// 페이지 번호가 없을 때 내가 보는 페이지가 첫페이지
	String pageNumber_ = request.getParameter("pageNumber");
	if(pageNumber_ == null || pageNumber_.trim().equals("")) {
		pageNumber_ = "1"; 
	}
	int pageNumber = Integer.parseInt(pageNumber_);
	

	String no_ = request.getParameter("no");
	if(no_ == null || no_.trim().equals("")) { //나중에 숫자가 아닌 값 체크 추가하기
		no_ = "0"; //새글
	}
	int no = Integer.parseInt(no_);

	String searchGubun = request.getParameter("searchGubun");
	String searchData = request.getParameter("searchData");
	
	int imsiSearchCounter = 0;
	if(searchGubun == null || searchGubun.trim().equals("")) {
		searchGubun = "";	
		imsiSearchCounter++;
	}
	
	if(searchData == null || searchData.trim().equals("")) {
		searchData = "";	
		imsiSearchCounter++;
	}
	
	if(imsiSearchCounter > 0) { 
		searchGubun = "";
		searchData = "";
	}
	
	String imsiQueryString = "tbl=" + tbl + "&searchGubun=" + searchGubun + "&searchData=" + searchData;
%>

검색 :  <%=tbl %>/ <%=pageNumber %> / <%=searchGubun %>  / <%=searchData %> / <%=imsiQueryString %> <hr> 