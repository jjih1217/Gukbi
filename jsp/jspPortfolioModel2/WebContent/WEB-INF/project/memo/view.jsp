<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>메모 상세</h2>  
<table border="1" width="80%">
	<tr>
		<td width="100px">작성자</td>
		<td>${dto.writer }</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>${dto.content }</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${dto.regiDate }</td>
	</tr>
</table>
<div style="width: 80%; margin-top: 10px;" align="right">
	<a href="#" onClick="move('memo_list.do','');">목록</a>
	<a href="#" onClick="move('memo_chuga.do','');">등록</a>
	<a href="#" onClick="move('memo_sujung.do','${dto.no}');">수정</a>
	<a href="#" onClick="move('memo_sakje.do','${dto.no}');">삭제</a>
</div>

<script>
function move (value1, value2) {
	location.href = "${path}/memo_servlet/" + value1 + "?no=" + value2;
}
</script>