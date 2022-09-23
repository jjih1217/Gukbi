<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/inc_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

<form name="DirForm">
	<table border="1" align="center" width="80%">
		<tr>
			<td colspan="2"><h2>아이디 찾기</h2></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id" id="id" value="${id }" style="width: 100px">
				<span id="spanMsg">${msg }</span>
				<br>
				<input type="text" name="result" id="result" value="" style="width: 100px">
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center" style="height: 50px">
				<button type="button" onClick="search();">검색</button>
				<span id="spanView" style="display:none;">
					<button type="button" onClick="save();">적용</button>
				</span>
			</td>
		</tr>
	</table>
</form>
<script>
function search() {
	if(document.DirForm.id.value == '') {
		alert('id를 입력하세요');
		document.DirForm.id.focus();
		return;
	}
	
	if(confirm('ok?')) {
		document.DirForm.action = "${path}/member_servlet/member_idCheckWinProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>

</body>
</html>