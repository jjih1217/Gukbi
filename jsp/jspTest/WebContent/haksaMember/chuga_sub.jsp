<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>학생등록</h2>

<form name="DirForm">
<table border="1" width="60%" align="center">
	<tr>
		<td>이름</td>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<td>연락처</td>
		<td><input type="text" name="phone" id="phone"></td>
	</tr>
	<tr>
		<td>부모연락처</td>
		<td><input type="text" name="parentPhone" id="parentPhone"></td>
	</tr>
	<tr>
		<td rowspan="3">주소</td>
		<td>
			<input type="text" name="addr1" id="sample6_postcode" placeholder="우편번호">
			<button type="button" onClick="sample6_execDaumPostcode();">우편번호 찾기</button>
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="addr2" id="sample6_address" placeholder="주소">
		</td>
	</tr>
	<tr>
		<td>
			<input type="text" name="addr3" id="sample6_detailAddress" placeholder="상세주소">
			<input type="text" name="addr4" id="sample6_extraAddress" placeholder="참고항목">
		</td>
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

<%@ include file = "_inc_daumApi.jsp" %>