<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/inc_header.jsp" %>
<%@ include file = "_inc_top.jsp" %>
    
<h2>메모(Mybatis) 삭제</h2>  
<form name="DirForm">
<input type="hidden" name="searchGubun" value="${searchGubun }">
<input type="hidden" name="searchData" value="${searchData }">
<input type="hidden" name="no" value="${dto.no}">
<table border="1" align="center" width="80%">
	<tr>
		<td width="150">이름</td>
		<td>
			${dto.writer}
		</td>
	</tr>
	<tr>
		<td>메모</td>
		<td>
			${dto.content}
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="button" onClick="sakje();">삭제하기</button>
			<button type="button" onClick="move('memoMybatis_list.do','');">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function sujung() {
	if(confirm('OK?')){
		document.DirForm.action = "${path}/memoMybatis_servlet/memoMybatis_sakjeProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

function move (value1, value2) {
	location.href = "${path}/memoMybatis_servlet/" + value1 + "?no=" + value2 + "&${searchQuery}";
}
</script>
