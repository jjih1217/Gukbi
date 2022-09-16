<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%@ include file = "../../_include/inc_menu.jsp" %>

<h2>05.do</h2>

<form name="DirForm">
<table border="1">
	<tr>
		<td>이름 : </td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>성별 : </td>
		<td>
			<input type="radio" name="gender" value="남자" checked> 남자
			<input type="radio" name="gender" value="여자" > 여자
		</td>
	</tr>
	<tr>
		<td>연령대 : </td>
		<td>
			<select name="aboutAge">
				<option value="10"> 10대</option>
				<option value="20"> 20대</option>
				<option value="30"> 30대</option>
				<option value="40"> 40대</option>
				<option value="50"> 50대</option>
				<option value="60"> 60대</option>
				<option value="70"> 70대</option>
				<option value="80"> 80대</option>
				<option value="90"> 90대</option>
				<option value="100"> 100대</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>관심분야 : </td>
		<td>
			<input type="checkbox" name="hobby" value="영화"> 영화
			<input type="checkbox" name="hobby" value="골프"> 골프
			<input type="checkbox" name="hobby" value="컴퓨터"> 컴퓨터<br>
			<input type="checkbox" name="hobby" value="음악"> 음악
			<input type="checkbox" name="hobby" value="독서"> 독서
			<input type="checkbox" name="hobby" value="게임"> 게임<br>
			<input type="checkbox" name="hobby" value="원예"> 원예
			<input type="checkbox" name="hobby" value="수영"> 수영
			<input type="checkbox" name="hobby" value="운전"> 운전
		</td>
	</tr>
	<tr>
		<td>나이 : </td>
		<td><input type="text" name="age"></td>
	</tr>
	<tr>
		<td>하고 싶은 말 : </td>
		<td>
			<textarea name="memo" style="width: 200px; height: 100px;"></textarea>
		</td>
	</tr>
	<tr>
		<td>생일 : </td>
		<td><input type="date" name="birthDay"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="save();">확인</button>
		</td>
	</tr>
</table>
</form>

<script>
function save(){
	if(confirm('실행할까요?')){
		document.DirForm.action = "/jspStudyModel2/exam_servlet/05Proc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
</body>
</html>