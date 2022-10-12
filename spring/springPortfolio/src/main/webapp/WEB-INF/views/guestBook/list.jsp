<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../_include/inc_header.jsp" %>

<h2 class="tit">${title}</h2>
<div class="board">
	<div class="board_guest_head">
	</div>
	<div class="board_guest_body">
		<c:if test="${list.size() == 0 }">
			<div class="empty">
				등록된 내용이 없습니다
			</div>
		</c:if>
		<c:forEach var="guestBookDto" items="${list }">
			<div class="item">
				<div class="top">
					<div>
						<span class="tit">작성자</span>
						<span class="sub">${guestBookDto.name}</span>
					</div>
					<div>
						<span class="tit">이메일</span>
						<span class="sub">${guestBookDto.email}</span>
					</div>
					<div>
						<span class="tit">등록일</span>
						<span class="sub">${guestBookDto.regiDate}</span>
					</div>
					
					<c:if test="${sessionScope.sessionNo != null && sessionScope.sessionNo == '23' && sessionScope.sessionId == 'admin'}">
						<div class="only-admin">
							<span class="tit">로그인여부</span>
							<c:if test="${ guestBookDto.memberNo == '0'}">
								비회원
							</c:if>
							<c:if test="${ guestBookDto.memberNo != '0'}">
								<span class="sub">${guestBookDto.memberId}(${guestBookDto.memberNo})</span>
							</c:if>
						</div>
					</c:if> 
					
					<div class="btn">
						<a href="#" onClick="move('sujung','${guestBookDto.no}');" >수정</a> / 
						<a href="#" onClick="move('sakje','${guestBookDto.no}');" >삭제</a>
					</div>
				</div>
				<div class="bottom">
					<div class="txt">
						${fn:replace(guestBookDto.content, newLineChar, "<br/>")}
					</div>
				</div>
			</div>
			
	</c:forEach>
	</div>
</div>

<div class="btn_area">
	<a href="${path }/guestBook/list" class="btn_gray">전체목록</a>
	<!-- <a href="#" onClick="move('list','');" class="btn_gray">목록</a> -->
	<!-- <a href="#" onClick="move('chuga','');" class="btn_red">등록</a> -->
	<a href="#" onClick="move('chuga','');" class="btn_blue">등록</a>
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
	location.href="${path}/guestBook/" + value1 + '?no='  + value2 + "&${searchQuery}";
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
	location.href = "${path}/guestBook/list?pageNumber=" + value1 + "&${searchQuery}";
}
</script>