<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/inc_header.jsp" %>
<%@ include file = "_inc_top.jsp" %>

<h2>방명록 등록(Mybatis)</h2>  
<form name="DirForm">
<input type="hidden" name="pageNumber" value="${pageNumber }">
<input type="hidden" name="searchGubun" value="${searchGubun }">
<input type="hidden" name="searchData" value="${searchData }">
<table border="1" align="center" width="80%">
	<tr>
		<td width="20%">이름(*)</td>
		<td>
			<input type="text" name="name" value="">
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>
			<input type="text" name="email" value="">
		</td>
	</tr>
	<tr>
		<td>비밀번호(*)</td>
		<td>
			<input type="password" name="passwd" value="">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<textarea name="content" rows="5" cols="55" ></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="button" onClick="save();">등록</button>
			<button type="button" onClick="${path}/guestBookMybatis_servlet/guestBookMybatis_list.do">목록</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('OK?')){
		document.DirForm.action = "${path}/guestBookMybatis_servlet/guestBookMybatis_chugaProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
    