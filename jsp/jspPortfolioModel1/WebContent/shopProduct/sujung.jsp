<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>
<%@ include file = "_inc_script.jsp" %>

<%
	String productCode_ = request.getParameter("productCode");
	int productCode = Integer.parseInt(productCode_);
	
	ShopProductDTO arguDto = new ShopProductDTO();
	arguDto.setProductCode(productCode);
	
	ShopProductDAO dao = new ShopProductDAO();
	ShopProductDTO resultDto = dao.getSelectOne(arguDto);
	
	ShopVendorDAO vendorDao = new ShopVendorDAO();
	ArrayList<ShopVendorDTO> vendorList = vendorDao.getSelectAll();
%>

<h2>상품 수정</h2>    
<form name="DirForm">
<input type="text" name="productCode" id="productCode" value="<%=productCode %>">
<table border="1" width="80%">
<tr>
	<th bgColor="lightgray" width="120px">상품코드</th>
	<td><%=resultDto.getProductCode() %></td>
</tr>
<tr>
	<th bgColor="lightgray">상품명</th>
	<td><input type="text" name="productName" id="productName" value="<%=resultDto.getProductName() %>"></td>
</tr>
<tr>
	<th bgColor="lightgray">상품가격</th>
	<td><input type="text" name="productPrice" id="productPrice" value="<%=resultDto.getProductPrice() %>"></td>
</tr>
<tr>
	<th bgColor="lightgray">제조사명</th>
	<td>
		<select name="vendorCode">
			<option value="" selected>--선택없음--</option>
			<% 
				for(int i=0; i<vendorList.size(); i++) { 
					ShopVendorDTO vendorDto = vendorList.get(i);
				
					if( vendorDto.getVendorCode() == resultDto.getVendorCode()) { %>
						<option value="<%=vendorDto.getVendorCode() %>"selected><%=vendorDto.getVendorName() %></option>
				 <% } else { %>
					<option value="<%=vendorDto.getVendorCode() %>"><%=vendorDto.getVendorName() %></option>
			<% 
					}
				}
			%>
		</select>
	</td>
</tr>
<tr>
	<th bgColor="lightgray">사진첨부</th>
	<td>
		<input type="file" name="file1" class="fileUp"><br>
		<input type="file" name="file2" class="fileUp"><br>
		<input type="file" name="file3" class="fileUp"><br>
		<input type="hidden" name="attachCounter" value="0">
	</td>
</tr>

<tr>
	<th bgColor="lightgray">첨부된 파일</th>
	<td>
		<% 
			if( resultDto.getAttachInfo() == null || resultDto.getAttachInfo().equals("-")) {
				out.println("&nbsp;");
			} else {
				String[] imsiArray = resultDto.getAttachInfo().split(",");
				
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
	<a href="#" onClick="save();">수정하기</a>
	|
	<a href="#" onClick="move('shopProduct_list', '');">목록으로</a>
	|
</div>

<script>
function save() {
	if(confirm('수정?')) {
		document.DirForm.attachCounter.value = document.getElementsByClassName("fileUp").length;
		document.DirForm.enctype = "multipart/form-data";
		document.DirForm.action = "mainProc.jsp?menuGubun=shopProduct_sujungProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
	
}
</script>