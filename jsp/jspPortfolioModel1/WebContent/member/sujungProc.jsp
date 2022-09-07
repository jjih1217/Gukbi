<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "_inc_top.jsp" %> <!-- LOGIN CHK -->

<%@page import="member.model.dto.MemberDTO"%>
<%@page import="member.model.dao.MemberDAO"%>

<%
	request.setCharacterEncoding("UTF-8");

	String no_ = request.getParameter("no");
	//null처리
	int no = Integer.parseInt(no_);

	String passwd = request.getParameter("passwd");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String juso1 = request.getParameter("juso1");
	String juso2 = request.getParameter("juso2");
	String juso3 = request.getParameter("juso3");
	String juso4 = request.getParameter("juso4");
	String grade = request.getParameter("grade");
	
	//null, 공백체크, 패스워드확인체크
	//즈민번호 숫자, 자릿수 6-7
	//주소값 juso4가 공백일때
	if(juso4 == null || juso4.trim().equals("")) {
		juso4 = "-";
	}
	
	MemberDTO arguDto = new MemberDTO();
	arguDto.setNo(no);
	arguDto.setPasswd(passwd);
	arguDto.setPhone(phone);
	arguDto.setEmail(email);
	arguDto.setJuso1(juso1);
	arguDto.setJuso2(juso2);
	arguDto.setJuso3(juso3);
	arguDto.setJuso4(juso4);
	arguDto.setGrade(grade);
	
	MemberDAO dao = new MemberDAO();
	int result = dao.setUpdate(arguDto);
	
	if (result > 0) {
		out.println("<script>");	
		out.println("location.href='main.jsp?menuGubun=member_view&no=" + no + "';");	
		out.println("</script>");	
	} else {
		out.println("<script>");	
		out.println("alert('수정 중 오류가 발생했습니다.');");	
		out.println("location.href='main.jsp?menuGubun=member_sujung&no=" + no + "';");	
		out.println("</script>");	
	}
	
%>