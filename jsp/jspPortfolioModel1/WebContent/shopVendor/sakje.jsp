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

<h2>제조사 삭제</h2>
<form name="DirForm">
<input type="text" name="vendorCode" id="vendorCode" value="<%=vendorCode %>">
<table border="1" width="30%">
<tr>
	<th bgColor="lightgray">제조사코드</th>
	<td><%=dto.getVendorCode()%></td>
</tr>
<tr>
	<th bgColor="lightgray">제조사명</th>
	<td><%=dto.getVendorName()%></td>
</tr>
<tr>
	<th bgColor="lightgray">등록일</th>
	<td><%=dto.getRegiDate()%></td>
</tr>
</table>
</form>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="save()">삭제하기</a>
	|
	<a href="#" onClick="move('shopVendor_list', '');">목록으로</a>
	|
</div>

<script>
function save() {
	if(confirm('수정할까요?')) {
		document.DirForm.action = "mainProc.jsp?menuGubun=shopVendor_sakjeProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
	
}
</script>