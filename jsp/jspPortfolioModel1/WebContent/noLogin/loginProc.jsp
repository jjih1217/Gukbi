<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="config.Util"%>

<%@page import="member.model.dto.MemberDTO"%>
<%@page import="member.model.dao.MemberDAO"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	Util util = new Util();
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	// null bank
	// & " '
	
	MemberDTO arguDto = new MemberDTO();
	arguDto.setId(id);
	arguDto.setPasswd(passwd);
	
	MemberDAO dao = new MemberDAO();
	// getSelectOne 은 parameter가 no
	// id, passwd 로 받는 메소드 생성 후 사용
	MemberDTO returnDto = dao.getLogin(arguDto);
	
	//세션(Session) - 서버에 저장
	if(returnDto.getNo() > 0) { //로그인 성공
		// session ("변수", 값)
		// 위치 : 로그인 성공 시 한번! session에 담음
		session.setAttribute("sessionNo", returnDto.getNo());//회원번호
		session.setAttribute("sessionId", id);//회원아이디
		session.setAttribute("sessionName", returnDto.getName());//회원이름
		session.setAttribute("sessionGrade", returnDto.getGrade());//회원등급
		
		out.println("<script>");
		out.println("alert('로그인 성공');");
		out.println("location.href='main.jsp?menuGubun=dashBoard_list';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('등록된 정보가 없습니다 \\n확인 후 다시 로그인 해주세요');");
		out.println("location.href='main.jsp?menuGubun=noLogin_login';");
		out.println("</script>");
	} 
%>