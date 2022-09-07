<!-- testJson/exam01.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>JASON TEST</h2>
<form name="DirForm">
아이디 : <input type="text" name="id" id="id"><br>
비밀번호 : <input type="password" name="passwd" id="passwd"><br>
이름 : <input type="text" name="name" id="name"><br>
나이 : <input type="text" name="age" id="age"><br>
<button type="button" onClick="save();">확인</button>
</form>

<script type="text/javascript">
function save() {
	document.DirForm.action = "exam01Proc.jsp";
	document.DirForm.method = "post";
	document.DirForm.submit();
}
</script>
</body>
</html>

