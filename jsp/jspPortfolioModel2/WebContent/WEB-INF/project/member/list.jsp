<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/inc_header.jsp" %>

<h2>회원관리</h2>

<div style="width: 80%; margin-top: 10px;" align="left">
	<c:choose>
		<c:when test="${searchGubun == '' }">
			* 전체목록 : ${totalRecord } 건
		</c:when>
		<c:otherwise>
			* 검색어 "<b style="color:red;">${searchData }</b>" 으/로 검색된 목록 :  ${totalRecord } 건
		</c:otherwise>
	</c:choose>
</div>  
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
	
	<c:if test="${totalRecord == 0 }">
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
<div style="width: 80%; margin-top: 10px;" align="right">
	|
	<a href="${path }/member_servlet/member_list.do">전체목록</a>
	|
	<a href="#" onClick="move('member_list.do','');">목록</a>
	|
	<a href="#" onClick="move('member_chuga.do','');">등록</a>
	|
</div>

<div style="width=80%; margin-top: 10px;" align="center">
<form name="searchForm">
	<select name="searchGubun" id="searchGubun">
		<c:choose>
			<c:when test="${searchGubun == 'id' }">
				<option value="">-- 선택 --</option>
				<option value="id" selected>아이디</option>
				<option value="name">이름</option>
				<option value="id_name">아이디+이름</option>
			</c:when>
			<c:when test="${searchGubun == 'name' }">
				<option value="">-- 선택 --</option>
				<option value="id">아이디</option>
				<option value="name" selected>이름</option>
				<option value="id_name">아이디+이름</option>
			</c:when>
			<c:when test="${searchGubun == 'id_name' }">
				<option value="" >-- 선택 --</option>
				<option value="id">아이디</option>
				<option value="name">이름</option>
				<option value="id_name"  selected>아이디+이름</option>
			</c:when>
			<c:otherwise>
				<option value="" selected>-- 선택 --</option>
				<option value="id">아이디</option>
				<option value="name">이름</option>
				<option value="id_name">아이디+이름</option>
			</c:otherwise>
		</c:choose>
		
	</select>
	<input type="text" name="searchData" id="searchData" value="${searchData }" style="width: 150px;">
	<button type="button" onClick="search();">검색</button>
</form>
</div>
<c:if test="${totalRecord > 0 }">
	<div style="width: 80%; margin-top: 10px;" align="center">
		<a href="#" onClick="goPage('1');">[첫페이지]</a>
		&nbsp;
		<c:if test="${map.startPage > map.blockSize }">
			<a href="#" onClick="goPage('${map.startPage - map.blockSize}')">[이전10개]</a>
		</c:if>
		<c:if test="${map.startPage <= map.blockSize }">
			[이전10개]
		</c:if>
		&nbsp;
		<c:forEach var="i" begin="${map.startPage }" end="${map.lastPage }" step="1">
		
			<c:if test="${i == pageNumber }">
				[${i }]
			</c:if>
			<c:if test="${i != pageNumber }">
				<a href="#" onClick="goPage('${i }')">${i }</a>
			</c:if>
		</c:forEach>
		&nbsp;
		<c:if test="${map.lastPage < map.totalPage }">
			<a href="#" OnClick="goPage('${map.startPage + map.blockSize }');">[다음10개]</a>
		</c:if>
		<c:if test="${map.lastPage >= map.totalPage }">
			[다음10개]
		</c:if>
		&nbsp;
		<a href="#" onClick="goPage('${map.totalPage}');">[끝페이지]</a>
	</div>
</c:if>
<script>
function move (value1, value2) {
	location.href = "${path}/member_servlet/" + value1 + "?no=" + value2 + "&${searchQuery}";
}

function search() {
	if(confirm('searchOK?')){
		document.searchForm.action = "${path}/member_servlet/member_search.do";
		document.searchForm.method = "post";
		document.searchForm.submit();
	}
}

function goPage (value1) {
	location.href = "${path}/member_servlet/member_list.do?pageNumber=" + value1 + "&${searchQuery}";
}
</script>
