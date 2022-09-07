<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exam07.jsp</title>
</head>
<body>

<h2>exam07.jsp</h2>

<form name="test07Form">
<table border="1">
	<tr>
		<td>아이디 : </td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>비번 : </td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>이름: </td>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<td>회원등급: </td>
		<td>
			<input type="radio" name="grade" value="최우수회원"> 최우수회원 &nbsp;
			<input type="radio" name="grade" value="우수회원"> 우수회원 &nbsp;
			<input type="radio" name="grade" value="일반회원"> 일반회원 &nbsp;
		</td>
	</tr>
	<tr>
		<td>주소 : </td>
		<td>
			<select name="address">
				<option value="" selected>-- 선택 --</option>
				<option value="서울">서울</option>
				<option value="대전">대전</option>
				<option value="대구">대구</option>
				<option value="부산">부산</option>
				<option value="광주">광주</option>
				<option value="제주">제주</option>
				<option value="강원">강원</option>
				<option value="기타">기타</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>관심분야 : </td>
		<td>
			<input type="checkbox" name="hobby" value="영화"> 영화 &nbsp;
			<input type="checkbox" name="hobby" value="독서"> 독서 &nbsp;
			<input type="checkbox" name="hobby" value="음악"> 음악 &nbsp;
			<br>
			<input type="checkbox" name="hobby" value="캠핑"> 캠핑 &nbsp;
			<input type="checkbox" name="hobby" value="골프"> 골프 &nbsp;
			<input type="checkbox" name="hobby" value="등산"> 등산 &nbsp;
			<br>
			<input type="checkbox" name="hobby" value="스쿠버"> 스쿠버 &nbsp;
			<input type="checkbox" name="hobby" value="모터사이클"> 모터사이클 &nbsp;
			<input type="checkbox" name="hobby" value="자동차"> 자동차 &nbsp;
			<br>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="formSubmit();">확인</button>
		</td> 
	</tr>
</table>
</form>

<script>
function formSubmit() {
	document.test07Form.action = "exam07Proc.jsp";
	document.test07Form.method = "post";
	document.test07Form.submit();
}
</script>

</body>
</html>