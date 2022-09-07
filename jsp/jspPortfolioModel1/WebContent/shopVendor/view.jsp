<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>
<%@ include file = "_inc_script.jsp" %>

<%
	String vendorCode_ = request.getParameter("vendorCode");
	int vendorCode = Integer.parseInt(vendorCode_);
	
	ShopVendorDTO arguDto = new ShopVendorDTO();
	arguDto.setVendorCode(vendorCode);

	ShopVendorDAO dao = new ShopVendorDAO();
	ShopVendorDTO dto = dao.getSelectOne(arguDto);
%>


<h2>제조사 상세보기</h2>  
<table border="1" width="30%">
<tr>
	<th>제조사코드</th>
	<td><%=dto.getVendorCode() %></td>
</tr>
<tr>
	<th>제조사명</th>
	<td><%=dto.getVendorName() %></td>
</tr>
<tr>
	<th>등록일</th>
	<td><%=dto.getRegiDate() %></td>
</tr>
</table>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="move('shopVendor_list', '');">목록</a>
	|
	<a href="#" onClick="move('shopVendor_chuga', '');">등록</a>
	|
	<a href="#" onClick="move('shopVendor_sujung', '<%=vendorCode %>');">수정</a>
	|
	<a href="#" onClick="move('shopVendor_sakje', '<%=vendorCode %>');">삭제</a>
	|
</div>