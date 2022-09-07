<!-- testAjax/exam01.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<h2>로그인</h2>

id : <input type="text" name="id" id="id"><br>
passwd : <input type="password" name="passwd" id="passwd"><br>
<button type="button" id="btnLogin">로그인</button>

<div id="result" style="border:1px solid red;"></div>

<script>
$(function() {
	$("#btnLogin").click(function() {
		id = $("#id").val();
		passwd = $("#passwd").val();
		param = {
			"id": id, 
			"passwd": passwd
		}
		$.ajax({
			type: "post",
			data: param,
			url: "exam01Proc.jsp",
			success : function(data) {
				$("#result").html(data);
			}
		})
	});
})
</script>

</body>
</html>

