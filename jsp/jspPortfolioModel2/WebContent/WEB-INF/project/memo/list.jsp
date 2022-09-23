<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/inc_header.jsp" %>

<h2>메모관리</h2>  
${list }
<table border="1" align="center" width="80%">
	<tr>
		<td>순번</td>
		<td>작성자</td>
		<td>내용</td>
		<td>등록일</td>
	</tr>
	
	<c:if test="fn:length(list) == 0">
		<tr>
			<td colspan="4" height="200" align="center">등록된 회원이 없습니다.</td>
		</tr>
	</c:if>
	
	<c:forEach var="memoDto" items="${list }">
		<tr>
		<td>${memoDto.no}</td>
		<td>
			<a href="#" onClick="move('memo_view.do','${memoDto.no}')">${memoDto.writer}</a>
		</td>
		<td>${memoDto.content}</td>
		<td>${memoDto.regiDate}</td>
	</tr>
	</c:forEach>
</table>
<div style="width: 80%; margin-top: 10px;" align= right>
	<a href="#" onClick="move('memo_list.do','');">목록</a>
	<a href="#" onClick="move('memo_chuga.do','');">등록</a>
</div>
<script>
function move (value1, value2) {
	location.href = "${path}/memo_servlet/" + value1 + "?no=" + value2;
}
</script>
