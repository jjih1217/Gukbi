<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>메모 수정</h2>
<form name="DirForm">
<input type="text" name="no" value="${dto.no }">
<table border="1" width="80%">
	<tr>
		<td width="100px">작성자</td>
		<td><input type="text" name="writer" value="${dto.writer }"></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><input type="text" name="writer" value="${dto.content }"></td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${dto.regiDate }</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="button" onClick="save();">수정하기</button>
		</td>
	</tr>
</table>
</form>
<script>
function save() {
	if(confirm('OK?')){
		document.DirForm.action = "${path}/memo_servlet/memo_sujungProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>