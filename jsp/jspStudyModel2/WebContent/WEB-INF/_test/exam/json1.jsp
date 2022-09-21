<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
</head>
<body>

<%@ include file = "../../_include/inc_menu.jsp" %>

<h2>json1.do</h2>
id  : <input type="text" name="id" id="id"><br>
passwd  : <input type="text" name="passwd" id="passwd"><br>
name  : <input type="text" name="name" id="name"><br>
age  : <input type="text" name="age" id="age"><br>
<button type="button" id="btnSave">확인</button>

<hr>

id  : <span id="json_id"></span><br>
passwd  : <span id="json_passwd"></span><br>
name  : <span id="json_name"></span><br>
age  : <span id="json_age"></span><br>

<hr>

<div id="result"></div>

<script>
$(document).ready(function(){
	$("#btnSave").click(function(){
		examProc();
	});
});

function examProc() {
	var param = {
			id: $("#id").val(),
			passwd: $("#passwd").val(),
			name: $("#name").val(),
			age: $("#age").val()
	}
	var url = "${path}/exam_servlet/join1Proc.do";
	
	$.ajax({
		type: "post",
		data: param,
		datatype: "JSON",
		url: url,
		success: function(data) { //콜백함수 : 서버에서 처리가 완료된 후 실행되는 코드
			//$("#result").text(data)
			//console.log("data: " + data);
			//alert("1. " + data);
			
			var jsonMember = JSON.parse(data);
			//alert("2. " + jsonMember);
			$("#result").text(data);
			$("#json_id").text(jsonMember.id);
			$("#json_passwd").text(jsonMember.passwd);
			$("#json_name").text(jsonMember.name);
			$("#json_age").text(jsonMember.age);
			
		}
	});
}
</script>

</body>
</html>