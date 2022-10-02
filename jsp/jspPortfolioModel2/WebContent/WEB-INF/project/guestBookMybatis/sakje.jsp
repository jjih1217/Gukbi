<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/inc_header.jsp" %>
<%@ include file = "_inc_top.jsp" %>

<h2>방명록 삭제(Mybatis) </h2>  
<form name="DirForm">
<input type="hidden" name="no" value="${dto.no}">
<input type="hidden" name="pageNumber" value="${pageNumber }">
<input type="hidden" name="searchGubun" value="${searchGubun }">
<input type="hidden" name="searchData" value="${searchData }">
<table border="1" align="center" width="80%">
	<tr>
		<td width="150">이름</td>
		<td>
			${dto.name }
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>
			${dto.email }
		</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="passwd" value="">
		</td>
	</tr>
	<tr>
		<td colspan="2">
			 ${fn:replace(dto.content, newLineChar, "<br/>") }
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="button" onClick="sakje();">삭제</button>
			<button type="button" onClick="move('guestBookMybatis_list.do','');">목록</button>
		</td>
	</tr>
</table>
</form>

<script>
function sakje() {
	if(confirm('OK?')){
		document.DirForm.action = "${path}/guestBookMybatis_servlet/guestBookMybatis_sakjeProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

function move (value1, value2) {
	location.href = "${path}/guestBookMybatis_servlet/" + value1 + "?no=" + value2 + "&${searchQuery}";
}
</script>
    