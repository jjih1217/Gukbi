<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file = "../_include/inc_menu.jsp" %>

<h2>${title}</h2>
<form name="DirForm">
<input type="text" name="no" value="${dto.no }"> 
<table border="1" width="60%">
	<tr>
		<td>아이디 : </td>
		<td><input type="text" name="id" value="${dto.id }"></td>
	</tr>
	<tr>
		<td>비밀번호 :</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td>${dto.name }</td>
	</tr>
	<tr>
		<td>연락처 : </td>
		<td><input type="text" name="phone" value="${dto.phone }"></td>
	</tr>
	<tr>
		<td>이메일 : </td>
		<td><input type="text" name="email" value="${dto.email }"></td>
	</tr>
	<tr>
		<td>주민번호 : </td>
		<td>${dto.jumin }</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>
			<input type="text" id="sample6_postcode" placeholder="우편번호" name="juso1" value="${dto.juso1 }">
			<button type="button" onClick="sample6_execDaumPostcode();">우편번호 찾기</button><br>
			<input type="text" id="sample6_address" placeholder="주소" name="juso2"  value="${dto.juso2 }"><br>
			<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="juso3"  value="${dto.juso3 }">
			<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="juso4" value="${dto.juso4 }" >
		</td>
	</tr>
	<tr>
		<td>회원등급</td>
		<td>
			<c:if test="${dto.grade == '최우수회원'}">
					<input type="radio" name="grade" value="최우수회원" checked> 최우수회원 &nbsp;
					<input type="radio" name="grade" value="우수회원"> 우수회원 &nbsp;
					<input type="radio" name="grade" value="일반회원"> 일반회원
			</c:if>
			<c:if test="${dto.grade == '우수회원'}">
					<input type="radio" name="grade" value="최우수회원"> 최우수회원 &nbsp;
					<input type="radio" name="grade" value="우수회원" checked> 우수회원 &nbsp;
					<input type="radio" name="grade" value="일반회원"> 일반회원
			</c:if>
			<c:if test="${dto.grade == '일반회원'}">
					<input type="radio" name="grade" value="최우수회원"> 최우수회원 &nbsp;
					<input type="radio" name="grade" value="우수회원"> 우수회원 &nbsp;
					<input type="radio" name="grade" value="일반회원" checked> 일반회원
			</c:if>
		</td>
	</tr>
	
	<tr>
		<td>첨부파일</td>
		<td>
			<c:choose>
				<c:when test="${dto.attachInfo == '-' }">
					이미지 없음
					<br>
					<input type="file" name="file" >
				</c:when>
				<c:otherwise>
					<c:set var="tempArray1" value="${fn:split(dto.attachInfo, ',') }"></c:set>
					<c:set var="temp1" value="${tempArray1[0]}"></c:set>
					<c:set var="temp2" value="${tempArray1[1]}"></c:set>
					<img src="${path }/attach${path}/member/${temp2}" alt="${tempArray1[0]}" title="${dto.name }" style="width: 50px; height: 50px">
					
					<input type="file" name="file" >
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<button type="button" Onclick="save();">확인</button>
		</td>
	</tr>
</table>
</form>

<script>
function save() {
	if(confirm('저장할까요?')) {
		document.DirForm.enctype="multipart/form-data";
		document.DirForm.action = "${path}/member/sujungProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
</body>
</html>