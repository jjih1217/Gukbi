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

<table border="1" width="60%">
	<tr>
		<td>회원번호</td>
		<td>${dto.no}</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>${dto.id}</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${dto.name}</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td>${dto.phone}</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${dto.email}</td>
	</tr>
	<tr>
		<td>주민번호</td>
		<td>
			${dto.jumin}<hr>
			${fn:substring(dto.jumin, 0, 6)} - ${fn:substring(dto.jumin, 7, 8)}****** 
		</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>${dto.juso1} ${dto.juso2} ${dto.juso3} ${dto.juso4}</td>
	</tr>
	<tr>
		<td>회원등급</td>
		<td>${dto.grade}</td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td>
			
			<%-- ${fn:replace(dto.attachInfo, '|', '<br>') }
			<hr>
			<c:set var="tempArray1" value="${fn:split(dto.attachInfo, '|')}"></c:set>
			<c:forEach var="i" begin="0" end="${fn:length(tempArray1)- 1 }" step="1">
				<c:choose>
					<c:when test="${tempArray1[i] == ',,0,,' }">
						<a href="#" onClick="suntaek('view','0','${dto.no}')">이미지X</a>
					</c:when>
					<c:otherwise>
						<c:set var="tempArray2" value="${fn:split(tempArray1[i], ',') }"></c:set>
						<c:set var="temp1" value="${tempArray2[0]}"></c:set>
						<c:set var="temp2" value="${tempArray2[1]}"></c:set>
						<a href="#" onClick="move('${dto.no}','${i }')">
							<img src="${path }/attach${path}/member/${temp2}" alt="${dto.name }" title="${dto.name }" style="width: 50px; height: 50px">
						</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>  --%>
			
			 <c:choose>
				<c:when test="${dto.attachInfo == '-' }">
					이미지 없음
				</c:when>
				<c:otherwise>
					<c:set var="tempArray1" value="${fn:split(dto.attachInfo, ',') }"></c:set>
					<c:set var="temp1" value="${tempArray1[0]}"></c:set>
					<c:set var="temp2" value="${tempArray1[1]}"></c:set>
					<img src="${path }/attach${path}/member/${temp2}" alt="${tempArray1[0]}" title="${dto.name }" style="width: 50px; height: 50px">
				</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${dto.regiDate}</td>
	</tr>
</table>
<div style="border: 0px solid red; padding-top: 20px; width: 60%;" align="right">
	|
	<a href="${path }/member/list">전체목록</a>
	|
	<a href="#" onClick="move('list','');">목록</a>
	|
	<a href="#" onClick="move('chuga','');">등록</a>
	|
	<a href="#" onClick="move('chugaAttach','');">등록(attach)</a>
	|
	<a href="#" onClick="move('sujung','${dto.no}');">수정</a>
	|
	<a href="#" onClick="move('sakje','${dto.no}');">삭제</a>
	|
</div>
<script>
function move(value1, value2){
	location.href="${path}/member/" + value1 + '?no=' + value2;
}
</script>
</body>
</html>