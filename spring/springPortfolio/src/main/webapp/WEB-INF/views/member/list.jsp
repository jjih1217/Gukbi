<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../_include/inc_header.jsp" %>

<h2 class="tit">${title}</h2>
<form name="searchForm">
	<div class="searchBox">
		<div class="form-inline">
			<div class="form-group">
				<label for="searchGubun">구분</label>
				<select name="searchGubun" id="searchGubun">
					<c:choose>
						<c:when test="${searchGubun == 'id' }">
							<option value="">-- 선택 --</option>
							<option value="id" selected>아이디</option>
							<option value="name">이름</option>
							<option value="id_name">아이디 또는 이름</option>
						</c:when>
						<c:when test="${searchGubun == 'name' }">
							<option value="">-- 선택 --</option>
							<option value="id">아이디</option>
							<option value="name" selected>이름</option>
							<option value="id_name">아이디 또는 이름</option>
						</c:when>
						<c:when test="${searchGubun == 'id_name' }">
							<option value="" >-- 선택 --</option>
							<option value="id">아이디</option>
							<option value="name">이름</option>
							<option value="id_name" selected>아이디 또는 이름</option>
						</c:when>
						<c:otherwise>
							<option value="" selected>-- 선택 --</option>
							<option value="id">아이디</option>
							<option value="name">이름</option>
							<option value="id_name">아이디 또는 이름</option>
						</c:otherwise>
					</c:choose>
				</select>
			</div>
			<div class="form-group">
				<label for="searchData">검색어</label>
				<input type="text" name="searchData" id="searchData" value="${searchData }">
			</div>
			<div class="form-group">
				<a href="#" onClick="goSearch();" class="btn btn_search">검색</a>
				<a href="#" onClick="goReset()" class="btn btn_reset">초기화</a>
			</div>
		</div>
	</div>
</form>
<div class="boardInfo">
	<div class="info1">
		<c:choose>
			<c:when test="${searchGubun == null || searchGubun == '' }">
				전체 : ${totalRecord } 건
			</c:when>
			<c:otherwise>
				검색어 " <span class="col-blue"><b>${searchData }</b></span>" 으/로 검색된 목록 : ${totalRecord } 건
			</c:otherwise>
		</c:choose>
	</div>
	
	<div class="info2">
		<c:choose>
			<c:when test="${map.totalPage == 0 }">
				현재페이지 (<span class="col-blue"><b>${pageNumber}</b></span> / 1)
			</c:when>
			<c:otherwise>
				현재페이지 (<span class="col-blue"><b>${pageNumber}</b></span> / ${map.totalPage })
			</c:otherwise>
		</c:choose>
	</div>
</div>

<div class="board">
	<div class="board_list_head">
		<div class="col-20">순번</div>
		<div class="col-20">아이디</div>
		<div class="col-20">이름</div>
		<div class="col-20">연락처</div>
	<!-- 	<div class="col-20">주민번호</div> -->
		<div class="col-20">가입일</div>
	</div>
	<div class="board_list_body">
		<c:if test="${list.size() == 0 }">
			<div class="empty">
				등록된 내용이 없습니다
			</div>
		</c:if>
		
		<c:forEach var="memberDto" items="${list }">
			<div class="item">
				<div class="col-20">${memberDto.no }</div>
				<div class="col-20"><a href="#" onClick="move('view','${memberDto.no}')">${memberDto.id}</a></div>
				<div class="col-20">${memberDto.name}</div>
				<div class="col-20">
					${fn:substring(memberDto.phone, 0, 3)} - 
					${fn:substring(memberDto.phone, 3, 7)} - 
					${fn:substring(memberDto.phone, 7, 11)}
				</div>
				<div class="col-20">${memberDto.regiDate}</div>
			</div>
		</c:forEach>
	</div>
</div>

<div class="btn_area">
	<a href="${path }/member/list" class="btn_gray">전체목록</a>
	<!-- <a href="#" onClick="move('list','');" class="btn_gray">목록</a> -->
	<a href="#" onClick="move('chuga','');" class="btn_blue">등록(Attach)</a>
</div>

<div class="paging">
<c:if test="${totalRecord > 0 }">
	<div class="inner">
		<a href="#" onClick="goPage('1');" class="btn-paging paging-on">첫페이지</a>
		<c:if test="${map.startPage > map.blockSize }">
			<a href="#" onClick="goPage('${map.startPage - map.blockSize}')" class="btn-paging paging-on">이전10개</a>
		</c:if>
		<c:if test="${map.startPage <= map.blockSize }">
			<span class="btn-paging">이전10개</span>
		</c:if>
		
		<div class="paging-number">
			<c:forEach var="i" begin="${map.startPage }" end="${map.lastPage }" step="1">
			
				<c:if test="${i == pageNumber }">
					<span class="btn-paging-number paging-number-on">
					${i }
					</span>
				</c:if>
				<c:if test="${i != pageNumber }">
					<a href="#" onClick="goPage('${i }')" class="btn-paging-number ">${i }</a>
				</c:if>
			</c:forEach>
		</div>
		<c:if test="${map.lastPage < map.totalPage }">
			<a href="#" OnClick="goPage('${map.startPage + map.blockSize }');" class="btn-paging paging-on">다음10개</a>
		</c:if>
		<c:if test="${map.lastPage >= map.totalPage }">
			<span class="btn-paging">다음10개</span>
		</c:if>
		<a href="#" onClick="goPage('${map.totalPage}');" class="btn-paging paging-on">끝페이지</a>
	</div>
</c:if>
</div>
<script>
function move(value1, value2){
	location.href="${path}/member/" + value1 + '?no='  + value2 + "&${searchQuery}";
}

function goSearch() {
	if(confirm('검색하시겠습니까?')){
		document.searchForm.action = "${path}/member/search";
		document.searchForm.method = "post";
		document.searchForm.submit();
	}
}

function goReset() {
	document.searchForm.searchGubun.value = "";
	document.searchForm.searchData.value= "";
}
function goPage (value1) {
	location.href = "${path}/member/list?pageNumber=" + value1 + "&${searchQuery}";
}
</script>
