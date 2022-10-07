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

<h2>${title }</h2>
<table border="0" width="80%">
	<tr>
		<td>
			<c:if test="${list.size() == 0 }">
				<table border="1" width="100%">
					<tr>
						<td align="center" colspan="4" height="150px">등록된 내용이 없습니다</td>
					</tr>
				</table>
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<c:forEach var="guestBookDto" items="${list }">
				<table border="1" width="100%">
					<tr>
						<th>순번</th>
						<td>${guestBookDto.no }</td>
						<th>이름</th>
						<td>${guestBookDto.name }</td>
						<td rowspan="2">
							<a href="#" onClick="move('sujung','${guestBookDto.no}');">수정</a>/
							<a href="#" onClick="move('sakje','${guestBookDto.no}');">삭제</a>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${guestBookDto.email }</td>
						<th>등록일</th>
						<td>${guestBookDto.regiDate }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="4"  height="150px" style="vertical-align:top;">
							${fn:replace(guestBookDto.content, newLineChar, "<br/>")}
						</td>
					</tr>
				</table>
			</c:forEach>
		</td>
	</tr>
</table>

<div style="border: 0px solid red; padding-top: 20px; width: 80%;" align="right">
	|
	<a href="#" onClick="move('list','');">목록</a>
	|
	<a href="#" onClick="move('chuga','');">등록</a>
	|
</div>
<script>
function move(value1, value2){
	location.href="${path}/guestBook/" + value1 + '?no=' + value2;
}
</script>
</body>
</html>