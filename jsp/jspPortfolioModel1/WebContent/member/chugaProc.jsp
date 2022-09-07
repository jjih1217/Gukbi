<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../_include/inc_header.jsp" %>
<%@ include file = "_inc_top.jsp" %> <!-- LOGIN CHK -->

<%@page import="member.model.dto.MemberDTO"%>
<%@page import="member.model.dao.MemberDAO"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String passwdChk = request.getParameter("passwdChk");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String jumin1 = request.getParameter("jumin1");
	String jumin2 = request.getParameter("jumin2");
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
	
	String jumin = jumin1 + "-" + jumin2;
	
	String attachInfo = "-";
	// chugaProc에서는 attachInfo를 받아오지 않음
	// DB에서는 필드를 추가했기때문에 (null)
	// 강제로 "-" 추가
	
	MemberDTO arguDto = new MemberDTO();
	arguDto.setId(id);
	arguDto.setPasswd(passwd);
	arguDto.setName(name);
	arguDto.setPhone(phone);
	arguDto.setEmail(email);
	arguDto.setJumin(jumin);
	arguDto.setJuso1(juso1);
	arguDto.setJuso2(juso2);
	arguDto.setJuso3(juso3);
	arguDto.setJuso4(juso4);
	arguDto.setGrade(grade);
	arguDto.setAttachInfo(attachInfo);
	
	MemberDAO dao = new MemberDAO();
	int result = dao.setInsert(arguDto);
	
	if (result > 0) {
		out.println("<script>");	
		out.println("alert('등록 성공');");	
		//out.println("location.href='main.jsp?menuGubun=member_list';");	
		out.println("</script>");	
	} else {
		out.println("<script>");	
		out.println("alert('등록 중 오류가 발생했습니다.');");	
		//out.println("location.href='main.jsp?menuGubun=member_chuga';");	
		out.println("</script>");	
	}
	
%>