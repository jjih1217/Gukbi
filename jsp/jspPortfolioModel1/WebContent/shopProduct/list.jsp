<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>
<%@ include file = "_inc_script.jsp" %>

<%
	ShopProductDAO dao = new ShopProductDAO();
	ArrayList<ShopProductDTO> list = dao.getSelectAll();
%>

<h2>상품 목록</h2>  
<table border="1" width="80%">
<tr>
	<th bgColor="lightgray" style="width:100px">상품코드</th>
	<th bgColor="lightgray">첨부파일</th>
	<th bgColor="lightgray">상품명</th>
	<th bgColor="lightgray">제조사명(제조사코드)</th>
	<th bgColor="lightgray">등록일</th>
</tr>
	<% for(int i=0; i<list.size(); i++) { 
		ShopProductDTO dto = list.get(i);
	%>
		<tr>
			<td><%=dto.getProductCode() %></td>
			<td>
				<%-- <%=dto.getAttachInfo() %> --%>
				<% 
					if( dto.getAttachInfo() == null || dto.getAttachInfo().equals("-")) {
						out.println("&nbsp;");
					} else {
						String[] imsiArray = dto.getAttachInfo().split(",");
						
						for(int j=0; j<imsiArray.length; j++) {
							if(!imsiArray[j].equals("-|-|0|-|-")) { //파일 있을때
								String[] imsiArray2 = imsiArray[j].split("[|]");
								
								String imsiImgPath = "";
								imsiImgPath += request.getContextPath();
								imsiImgPath += "/attach";
								imsiImgPath += request.getContextPath();
								imsiImgPath += "/product/";
								imsiImgPath += imsiArray2[1];
								out.println("<img src='" + imsiImgPath + "' width='40' height='40'>");
								
							}
							if(j == 0) {
								break;
							}
						}
					}
				%>
			</td>
			<td>
				<a href="#" onClick="move('shopProduct_view','<%=dto.getProductCode() %>')"><%=dto.getProductName() %></a>
			</td>
			<td><%=dto.getVendorName() %>(<%=dto.getVendorCode() %>)</td>
			
			<td><%=dto.getRegiDate() %> </td>
		</tr>
	<% } %>
</table>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="move('shopProduct_list', '');">목록</a>
	|
	<a href="#" onClick="move('shopProduct_attachChuga', '');">등록</a>
	|
	<a href="#" onClick="move('shopProduct_attachChugaFor', '');">등록(For)</a>
	|
	<a href="#" onClick="move('shopProduct_attachChugaWhile', '');">등록(While)</a>
	|
</div>
