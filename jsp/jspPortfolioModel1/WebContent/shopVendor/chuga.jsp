<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>
<%@ include file = "_inc_script.jsp" %>

<h2>제조사 등록</h2>    
<form name="DirForm">
<table border="1" width="30%">
<tr>
	<th bgColor="lightgray">제조사명</th>
	<td><input type="text" name="vendorName" id="vendorName"></td>
</tr>
</table>
</form>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="save();">등록하기</a>
	|
	<a href="#" onClick="move('shopVendor_list', '');">목록으로</a>
	|
</div>

<script>
function save() {
	if(confirm('등록할까요?')) {
		document.DirForm.action = "mainProc.jsp?menuGubun=shopVendor_chugaProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
	
}
</script>