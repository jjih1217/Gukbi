<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/inc_header.jsp" %>

<h2>회원관리</h2>  
<table border="1" align="center" width="80%">
	<tr>
		<td>순번</td>
		<td>아이디</td>
		<td>비밀번호</td>
		<td>이름</td>
		<td>생년월일</td>
		<td>전화번호</td>
		<td>가입일</td>
	</tr>
	
	<c:if test="fn:length(list) == 0">
		<tr>
			<td colspan="7" height="200" align="center">등록된 회원이 없습니다.</td>
		</tr>
	</c:if>
	
	<c:forEach var="memberDto" items="${list }">
		<tr>
		<td>${memberDto.no}</td>
		<td>
			<a href="#" onClick="move('member_view.do','${memberDto.no}')">${memberDto.id}</a>
		</td>
		<td>${memberDto.passwd}</td>
		<td>${memberDto.name}</td>
		<td>${memberDto.jumin1} - ${memberDto.jumin2}</td>
		<td>${memberDto.phone1} - ${memberDto.phone2} - ${memberDto.phone3}</td>
		<td>${memberDto.regiDate}</td>
	</tr>
	</c:forEach>
</table>
<div style="width: 80%; margin-top: 10px;" align= right>
<a href="#" onClick="move('member_list.do','');">목록</a>
<a href="#" onClick="move('member_chuga.do','');">등록</a>
</div>
<script>
function move (value1, value2) {
	location.href = "${path}/member_servlet/" + value1 + "?no=" + value2;
}
</script>
