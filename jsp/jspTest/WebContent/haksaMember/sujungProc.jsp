<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="haksaMember.model.dto.HaksaMemberDTO"%>
<%@page import="haksaMember.model.dao.HaksaMemberDAO"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String hakbun_ = request.getParameter("hakbun");
	int hakbun = Integer.parseInt(hakbun_);
	
	String phone = request.getParameter("phone");
	String parentPhone = request.getParameter("parentPhone");
	String addr1 = request.getParameter("juso1");
	String addr2 = request.getParameter("juso2");
	String addr3 = request.getParameter("juso3");
	String addr4 = request.getParameter("juso4");
	
	out.println("hakbun: " + hakbun + "<br>");
	out.println("phone: " + phone + "<br>");
	out.println("parentPhone: " + parentPhone + "<br>");
	out.println("juso1: " + addr1 + "<br>");
	out.println("juso2: " + addr2 + "<br>");
	out.println("juso3: " + addr3 + "<br>");
	out.println("juso4: " + addr4 + "<br>");
	
	HaksaMemberDTO arguDto = new HaksaMemberDTO();
	arguDto.setHakbun(hakbun);
	arguDto.setPhone(phone);
	arguDto.setParentPhone(parentPhone);
	arguDto.setAddr1(addr1);
	arguDto.setAddr2(addr2);
	arguDto.setAddr3(addr3);
	arguDto.setAddr4(addr4);
	
	HaksaMemberDAO dao = new HaksaMemberDAO();
	int result = dao.setUpdate(arguDto);
	
	if(result > 0) {
		out.println("<script>location.href='list.jsp';</script>");
	} else {
		out.println("<script>");
		out.println("alert('수정 처리 중 오류가 발생했습니다.');");
		out.println("location.href='sujung.jsp?hakbun=" + hakbun + "';");
		out.println("</script>");
	} 
%>