<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>메모 삭제</h2>
<form name="DirForm">
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
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="button" onClick="save();">삭제하기</button>
		</td>
	</tr>
</table>
</form>
<script>
function save() {
	if(confirm('OK?')){
		document.DirForm.action = "${path}/memo_servlet/memo_sakjeProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>