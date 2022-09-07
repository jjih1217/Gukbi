<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.net.Inet4Address"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	// referer : 이전페이지
	String referer = request.getHeader("REFERER");
	String url = request.getRequestURL().toString();
	String uri = request.getRequestURI().toString();
	String path = request.getContextPath();
	String ip = Inet4Address.getLocalHost().getHostAddress(); //import java.net.Inet4Address
	
	
	//out.println("referer : "  + referer + "<br>"); //  http://localhost:8090/jspPortfolioModel1/main/main.jsp?menuGubun=guestBook_list
	//out.println("url : "  + url + "<br>");         //  http://localhost:8090/jspPortfolioModel1/main/main.jsp 전체주소(고정)
	//out.println("uri : "  + uri + "<br>");         //  /jspPortfolioModel1/main/main.jsp 
	//out.println("path : "  + path + "<br>");       //  /jspPortfolioModel1
	//out.println("ip : "  + ip + "<br>");
	//referer.split("?") url와 동일한지 비교해 외부접근 차단

	String menuGubun = request.getParameter("menuGubun");

	if (menuGubun == null || menuGubun.equals("")) {
		menuGubun = "member_list";
	/* 	out.println("<script>");
		out.println("location.href='../error.jsp?errorCode=001';");
		out.println("</script>"); */
		return;
	}
	//out.println("menuGubun : " + menuGubun + "<br>");
	
	String[] imsiMenuGuBunArray = menuGubun.split("_");
	String folderName = imsiMenuGuBunArray[0];
	String fileName = imsiMenuGuBunArray[1];
	String includePage = "../" + folderName + "/" + fileName + ".jsp";
	
	//이미지
	String imgDisplayPath = "";
	imgDisplayPath += request.getContextPath();
	imgDisplayPath += "/attach";
	imgDisplayPath += request.getContextPath();

	
%>