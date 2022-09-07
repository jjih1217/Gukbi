<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>
<%@ include file = "_inc_script.jsp" %>

<%
	ShopVendorDAO vendorDao = new ShopVendorDAO();
	ArrayList<ShopVendorDTO> vendorList = vendorDao.getSelectAll();
%>

<h2>상품 등록(For)</h2>    
<form name="DirForm">
<table border="1" width="80%">
<tr>
	<th bgColor="lightgray">상품명</th>
	<td><input type="text" name="productName" id="productName"></td>
</tr>
<tr>
	<th bgColor="lightgray">상품가격</th>
	<td><input type="text" name="productPrice" id="productPrice"></td>
</tr>
<tr>
	<th bgColor="lightgray">제조사명</th>
	<td>
		<select name="vendorCode">
			<option value="" selected>--선택없음--</option>
			<% for(int i=0; i<vendorList.size(); i++) { 
				ShopVendorDTO vendorDto = vendorList.get(i);
				
				String selectedValue = "";
				if( vendorDto.getVendorCode() == 0) {
					selectedValue = "selected";
				}
			%>
				<option value="<%=vendorDto.getVendorCode() %>" <%=selectedValue %>><%=vendorDto.getVendorName() %></option>
			<% } %>
		</select>
	</td>
</tr>
<tr>
	<th bgColor="lightgray">첨부파일</th>
	<td>
		<input type="file" name="file1" class="fileUp"><br>
		<input type="file" name="file2" class="fileUp"><br>
		<input type="file" name="file3" class="fileUp"><br>
		<input type="text" name="attachCounter" value="0">
	</td>
</tr>
</table>
</form>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="save();">등록하기</a>
	|
	<a href="#" onClick="move('shopProduct_list', '');">목록으로</a>
	|
</div>


<script>
function save() {
	if(confirm('등록?')){
		document.DirForm.attachCounter.value = document.getElementsByClassName("fileUp").length;
	    document.DirForm.enctype = "multipart/form-data";
	    document.DirForm.action="mainProc.jsp?menuGubun=shopProduct_attachChugaForProc";
	    document.DirForm.method="post";
	    document.DirForm.submit();
	}
}
</script>