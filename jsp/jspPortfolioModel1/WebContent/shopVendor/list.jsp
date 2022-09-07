<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>
<%@ include file = "_inc_script.jsp" %>

<%
	ShopVendorDAO dao = new ShopVendorDAO();
	ArrayList<ShopVendorDTO> list = dao.getSelectAll();
%>

<h2>제조사 목록</h2>  
<table border="1" width="80%">
<tr>
	<th bgColor="lightgray" style="width:100px">제조사코드</th>
	<th bgColor="lightgray">제조사명</th>
	<th bgColor="lightgray">등록일</th>
	<th bgColor="lightgray">비고</th>
</tr>
	<% for(int i=0; i<list.size(); i++) { 
		ShopVendorDTO dto = list.get(i);
	%>
		<tr>
			<td><%=dto.getVendorCode() %></td>
			<td>
				<%-- <a href="#" onClick="move('shopVendor_view','<%=dto.getVendorCode() %>')"><%=dto.getVendorName() %></a> --%>
				<%=dto.getVendorName() %>
			</td>
			<td><%=dto.getRegiDate() %> </td>
			<td>
				<a href="#" onClick="move('shopVendor_sujung', '<%=dto.getVendorCode() %>');">[수정]</a>
				<a href="#" onClick="move('shopVendor_sakje', '<%=dto.getVendorCode() %>');">[삭제]</a>
			</td>
		</tr>
	<% } %>
</table>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="move('shopVendor_list', '');">목록</a>
	|
	<a href="#" onClick="move('shopVendor_chuga', '');">등록</a>
	|
</div>
