<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>

<%@page import="subBoard.model.dto.SubBoardDTO"%>
<%@page import="subBoard.model.dao.SubBoardDAO"%>

<%@include file = "../_include/inc_header.jsp"%>
<%@include file = "../_include/inc_sessionChk.jsp"%>

<%	
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
	
	String imsiQueryString = "searchGubun=" + searchGubun + "&searhData=" + searchData;
%>

검색 :  <%=pageNumber %>/ <%=searchGubun %>  / <%=searchData %> <hr> 