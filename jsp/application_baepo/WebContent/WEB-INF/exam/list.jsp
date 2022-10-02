<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "_inc_top.jsp" %>

<table border="1" align="center" width="80%">
	<tr>
		<td colspan="5" ><h2 style="padding-top: 20px">회원목록</h2></td>
	</tr>
	<tr>
		<td width="80">순번</td>
		<td>아이디</td>
		<td>이름</td>
		<td>성별</td>
		<td>등록일</td>
	</tr>
	
	
	<c:forEach var="dto" items="${list }">
	<tr>
		<td>${dto.no}</td>
		<td>
			<a href="#" onClick="move('exam_view.do','${dto.no}')">${dto.id}</a>
		</td>
		<td>${dto.name}</td>
		<td>${dto.gender}</td>
		<td>${dto.regiDate}</td>
	</tr>
	</c:forEach>
</table>
<script>
function move (value1, value2) {
	location.href = "${path}/ApplicationBaepoController/" + value1 + "?no=" + value2;
}

</script>