<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>분류등록</h2>

<form name="DirForm">
<table border="1" width="60%" align="center">
	<tr>
		<td>분류명</td>
		<td><input type="text" name="profile" id="profile"></td>
	</tr>
</table>

<div style="width: 60%; margin: 10px 0;" align="right">
	<button type="button" onClick="formSubmit();">저장하기</button>
	<button type="button" onClick="location.href='list.jsp';">목록</button>
</div>

</form>

<script>
function formSubmit(){
	document.DirForm.action = "chugaProc.jsp";
	document.DirForm.method = "post";
	document.DirForm.submit();
}
</script>