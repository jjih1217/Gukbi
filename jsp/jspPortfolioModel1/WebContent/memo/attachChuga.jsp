<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>메모 추가</h2>
<form name = "chugaForm">
<table border="1" align="center">
	<tr>
		<td>작성자 : </td>
		<td><input type="text" name="writer"></td>
	</tr>
	<tr>
		<td>내용 :</td>
		<td>
			<textarea name="content" style="width:300px; height: 300px;"></textarea>
		</td>
	</tr>
	<tr>
		<td>첨부파일 :</td>
		<td>
			<input type="file" name="file1"><br>
			<input type="file" name="file2"><br>
			<input type="file" name="file3"><br>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" Onclick="join();">등록하기</button>
			<button type="button" Onclick="location.href='main.jsp?menuGubun=memo_list';">목록으로</button>
		</td>
	</tr>
</table>
</form>

<script>
function join() {
	if (confirm('등록할까요?')){
		document.chugaForm.enctype = "multipart/form-data";
		document.chugaForm.action = "mainProc.jsp?menuGubun=memo_attachChugaProc";
		document.chugaForm.method = "post";
		document.chugaForm.submit();
	}
}
</script>