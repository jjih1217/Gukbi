<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>
<%@ include file = "_inc_script.jsp" %>

<%
	String productCode_ = request.getParameter("productCode");
	int productCode = Integer.parseInt(productCode_);
	
	ShopProductDTO productDto = new ShopProductDTO();
	productDto.setProductCode(productCode);
	
	ShopProductDAO productDao = new ShopProductDAO();
	ShopProductDTO productResultDto = productDao.getSelectOne(productDto);
	
	ShopVendorDTO vendorDto = new ShopVendorDTO();
	vendorDto.setVendorCode(productResultDto.getVendorCode());
	
	ShopVendorDAO vendorDao = new ShopVendorDAO();
	ShopVendorDTO vendorResultDto = vendorDao.getSelectOne(vendorDto);
%>

<h2>상품 삭제</h2>    
<form name="DirForm">
<input type="text" name="productCode" id="productCode" value="<%=productCode %>">
<table border="1" width="80%">
<tr>
	<th bgColor="lightgray" width="120px">상품코드</th>
	<td><%=productResultDto.getProductCode() %></td>
</tr>
<tr>
	<th bgColor="lightgray">상품명</th>
	<td><%=productResultDto.getProductName() %></td>
</tr>
<tr>
	<th bgColor="lightgray">상품가격</th>
	<td><%=productResultDto.getProductPrice() %></td>
</tr>
<tr>
	<th bgColor="lightgray">제조사명(제조사코드)</th>
	<td><%=vendorResultDto.getVendorName() %>(<%=vendorResultDto.getVendorCode() %>)</td>
</tr>
<tr>
	<th bgColor="lightgray">첨부파일</th>
	<td>
		<% 
			if( productResultDto.getAttachInfo() == null || productResultDto.getAttachInfo().equals("-")) {
				out.println("&nbsp;");
			} else {
				String[] imsiArray = productResultDto.getAttachInfo().split(",");
				
				for(int j=0; j<imsiArray.length; j++) {
					if(!imsiArray[j].equals("-|-|0|-|-")) { //파일 있을때
						String[] imsiArray2 = imsiArray[j].split("[|]");
						
						String imsiImgPath = "";
						imsiImgPath += request.getContextPath();
						imsiImgPath += "/attach";
						imsiImgPath += request.getContextPath();
						imsiImgPath += "/product/";
						imsiImgPath += imsiArray2[1];
						out.println("<img src='" + imsiImgPath + "' width='70'><hr>");
					} else {
						out.println("첨부된 파일 없음<br><hr>");
					}
				}
			}
		%>
	</td>
</tr>
</table>
</form>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="save();">삭제하기</a>
	|
	<a href="#" onClick="move('shopProduct_list', '');">목록으로</a>
	|
</div>

<script>
function save() {
	if(confirm('삭제할까요?')) {
		document.DirForm.action = "mainProc.jsp?menuGubun=shopProduct_sakjeProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
	
}
</script>