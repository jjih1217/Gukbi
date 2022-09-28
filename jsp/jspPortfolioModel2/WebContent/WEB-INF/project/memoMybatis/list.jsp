<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/inc_header.jsp" %>
<%@ include file = "_inc_top.jsp" %>
    
<h2>메모(Mybatis)</h2>  
<div style="width: 80%; margin-top: 10px;" align="left">
	<c:choose>
		<c:when test="${searchGubun == '' }">
			* 전체목록 : ${totalRecord } 건
		</c:when>
		<c:otherwise>
			* 검색어 "<b style="color:red;">${searchData }</b>" 으/로 검색된 목록 :  ${totalRecord } 건
		</c:otherwise>
	</c:choose>
	(${pageNumber} / ${map.totalPage })
</div> 
<table border="1" align="center" width="80%">
	<tr>
		<td width="80">순번</td>
		<td width="120">이름</td>
		<td>내용</td>
		<td width="120">등록일</td>
		<td>비고</td>
	</tr>
	
	<c:if test="${totalRecord == 0 }">
		<tr>
			<td colspan="4" height="200" align="center">등록된 메모가 없습니다.</td>
		</tr>
	</c:if>
	
	<c:forEach var="memoMybatisDto" items="${list }">
	<tr>
		<td>${memoMybatisDto.no}</td>
		<td>
			<a href="#" onClick="move('memoMybatis_view.do','${memoMybatisDto.no}')">${memoMybatisDto.writer}</a>
		</td>
		<td>${memoMybatisDto.content}</td>
		<td>${memoMybatisDto.regiDate}</td>
		<td>
			<a href="#" onClick="move('memoMybatis_sujung.do','${memoMybatisDto.no}')">[수정]</a>
			/
			<a href="#" onClick="move('memoMybatis_sakje.do','${memoMybatisDto.no}')">[삭제]</a>
		</td>
	</tr>
	</c:forEach>
</table>
<div style="width: 80%; margin-top: 10px;" align= right>
	<a href="#" onClick="move('memoMybatis_list.do','');">목록</a>
	<a href="#" onClick="move('memoMybatis_chuga.do','');">등록</a>
</div>

<div style="width:80%; margin-top: 10px;" align="center">
<form name="searchForm">
	<select name="searchGubun" id="searchGubun">
		<c:choose>
			<c:when test="${searchGubun == 'writer' }">
				<option value="">-- 선택 --</option>
				<option value="writer" selected>작성자</option>
				<option value="content">내용</option>
				<option value="writer_content">작성자 + 내용</option>
			</c:when>
			<c:when test="${searchGubun == 'content' }">
				<option value="">-- 선택 --</option>
				<option value="writer" >작성자</option>
				<option value="content" selected>내용</option>
				<option value="writer_content">작성자 + 내용</option>
			</c:when>
			<c:when test="${searchGubun == 'writer_content' }">
				<option value="" >-- 선택 --</option>
				<option value="writer" >작성자</option>
				<option value="content">내용</option>
				<option value="writer_content" selected>작성자 + 내용</option>
			</c:when>
			<c:otherwise>
				<option value="" selected>-- 선택 --</option>
				<option value="writer">작성자</option>
				<option value="content">내용</option>
				<option value="writer_content">작성자 + 내용</option>
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
		&nbsp;
	</c:forEach>
	
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
	location.href = "${path}/memoMybatis_servlet/" + value1 + "?no=" + value2 + "&${searchQuery}";
}

function search() {
	if(confirm('searchOK?')){
		document.searchForm.action = "${path}/memoMybatis_servlet/memoMybatis_search.do";
		document.searchForm.method = "post";
		document.searchForm.submit();
	}
}

function goPage (value1) {
	location.href = "${path}/memoMybatis_servlet/memoMybatis_list.do?pageNumber=" + value1 + "&${searchQuery}";
}
</script>


