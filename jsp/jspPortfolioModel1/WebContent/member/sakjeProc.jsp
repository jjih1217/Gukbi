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
	//박스 값 받아올때
	//String attachInfo = request.getParameter("attachInfo"); 
	
	MemberDTO arguDto = new MemberDTO();
	arguDto.setNo(no);
	arguDto.setPasswd(passwd);
	
	MemberDAO dao = new MemberDAO();
	
	//DB에서 불러와서 삭제할때
	MemberDTO imsiDto = new MemberDTO();
	imsiDto.setNo(no);
	
	MemberDTO resultDto = dao.getSelectOne(imsiDto);
	String attachInfo = resultDto.getAttachInfo();
	
	int result = dao.setDelete(arguDto);
	
	String imsiMsg = "삭제 중 오류가 발생했습니다.";
	String imsiUrl = "main.jsp?menuGubun=member_sakje&no=" + no;
	if (result > 0) {
		imsiMsg = "삭제성공";
		imsiUrl = "main.jsp?menuGubun=member_list";
		
		//파일삭제처리
		String attachPath = "c:/jih/attach";
		String uploadPath = attachPath + request.getContextPath() + "/member";
		
		//setDelele 실패하면 파일만 삭제될 수 있음 --> setDelete 성공 시
		String[] imsiArray01 = attachInfo.split(",");
		for(int i=0; i<imsiArray01.length; i++) {
			String[] imsiArray02 = imsiArray01[i].split("[|]");
			
			String savedName = imsiArray02[1];
			String uploadFile = uploadPath + "/" + savedName;
			java.io.File f = new java.io.File(uploadFile);
			if(f.delete()) {
				//파일삭제성공
			} else  {
				//파일삭제실패
			};
		}
	}
	
	out.println("<script>");
	if (result <= 0) {
		out.println("alert('" + imsiMsg + "');");
	}
	out.println("location.href='" + imsiUrl + "';");	
	out.println("</script>");
	
%>