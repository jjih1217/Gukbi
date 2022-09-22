<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>메모추가</h2>  
<form name="DirForm">
<table border="1" align="center" width="80%">
	<tr>
		<td width="150">작성자</td>
		<td>
			<input type="text" name="writer" value="">
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea name="content">
			
			</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="button" onClick="save();">등록하기</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('OK?')){
		document.DirForm.action = "${path}/memo_servlet/memo_chugaProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
