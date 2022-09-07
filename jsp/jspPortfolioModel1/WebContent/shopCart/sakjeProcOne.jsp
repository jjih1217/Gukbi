<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "_inc_top.jsp" %>

<%
	String cartNo_ = request.getParameter("cartNo");
	int cartNo = Integer.parseInt(cartNo_);
	
	CartDTO arguDto = new CartDTO();
	arguDto.setCartNo(cartNo);
	
	CartDAO dao = new CartDAO();
	int result = dao.setDelete(arguDto);
	
	if(result > 0) {
		out.println("<script>");
		out.println("alert('장바구니에서 삭제되었습니다');");
		out.println("location.href='main.jsp?menuGubun=shopCart_list';");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('삭제 중 오류가 발생했습니다');");
		out.println("location.href='main.jsp?menuGubun=shopCart_list';");
		out.println("</script>");
	}
	
%>