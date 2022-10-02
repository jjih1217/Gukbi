<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/inc_header.jsp" %>
<%@ include file = "_inc_top.jsp" %>

<h2>메모(Mybatis) 상세</h2>  
<table border="1" width="80%">
	<tr>
		<td width="150">순번</td>
		<td>${dto.no }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${dto.writer }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			${dto.content }
		</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${dto.regiDate }</td>
	</tr>
</table>

<div style="width: 80%; margin-top: 10px;" align="center">
	<table border="0" width="100%">
		<tr>
			<td width="150">이전글</td>
			<td>
				<c:if test="${dto.preNo > 0 }">
					<a href="#" onClick="move('memoMybatis_view.do','${dto.preNo }');">${dto.preName }</a>
				</c:if>
				<c:if test="${dto.preNo <= 0 }">
					등록된 메모가 없습니다
				</c:if>
			</td>
		</tr>
		<tr>
			<td>다음글</td>
			<td>
				<c:if test="${dto.nxtNo > 0 }">
					<a href="#" onClick="move('memoMybatis_view.do','${dto.nxtNo }');">${dto.nxtName }</a>
				</c:if>
				<c:if test="${dto.nxtNo <= 0 }">
					등록된 메모가 없습니다
				</c:if>
			</td>
		</tr>
	</table>
</div>

<div style="width: 80%; margin-top: 10px;" align="right">
	|
	<a href="${path }/memoMybatis_servlet/memoMybatis_list.do">전체목록</a>
	|
	<a href="#" onClick="move('memoMybatis_list.do','');">목록</a>
	|
	<a href="#" onClick="move('memoMybatis_chuga.do','');">등록</a>
	|
	<a href="#" onClick="move('memoMybatis_sujung.do','${dto.no}');">수정</a>
	|
	<a href="#" onClick="move('memoMybatis_sakje.do','${dto.no}');">삭제</a>
	|
</div>

<script>
function move (value1, value2) {
	location.href = "${path}/memoMybatis_servlet/" + value1 + "?no=" + value2 + "&${searchQuery}";
}
</script>