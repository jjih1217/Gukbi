<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>

<h2 class="tit">${title}</h2>

<div class="board">
	<div class="board_view_head">
		<div class="col">
			<div class="colTit">회원번호</div>
			<div class="colCnt">${dto.no}</div>
		</div>
		<div class="col">
			<div class="colTit">아이디</div>
			<div class="colCnt">${dto.id}</div>
		</div>
		<div class="col">
			<div class="colTit">이름</div>
			<div class="colCnt">${dto.name}</div>
		</div>
		<div class="col">
			<div class="colTit">연락처</div>
			<div class="colCnt">
				${fn:substring(dto.phone, 0, 3)} - 
				${fn:substring(dto.phone, 3, 7)} - 
				${fn:substring(dto.phone, 7, 11)}
			</div>
		</div>
		<div class="col">
			<div class="colTit">이메일</div>
			<div class="colCnt">${dto.email}</div>
		</div>
		<div class="col">
			<div class="colTit">주민번호</div>
			<div class="colCnt">
				${fn:substring(dto.jumin, 0, 6)} - ${fn:substring(dto.jumin, 7, 8)}****** 
			</div>
		</div>
		<div class="col">
			<div class="colTit">주소</div>
			<div class="colCnt">
				${dto.juso1}<br>
				${dto.juso2} ${dto.juso3} ${dto.juso4}
			</div>
		</div>
		<div class="col">
			<div class="colTit">회원등급</div>
			<div class="colCnt">${dto.grade}</div>
		</div>
		<div class="col">
			<div class="colTit">등록일</div>
			<div class="colCnt">${dto.regiDate}</div>
		</div>
		
		<div class="pic">
			<div class="pic_area">
				<c:choose>
					<c:when test="${dto.attachInfo == '-' }">
						이미지 없음
					</c:when>
					<c:otherwise>
						<c:set var="tempArray1" value="${fn:split(dto.attachInfo, ',') }"></c:set>
						<c:set var="temp1" value="${tempArray1[0]}"></c:set>
						<c:set var="temp2" value="${tempArray1[1]}"></c:set>
						<img src="${path }/attach${path}/member/${temp2}" alt="${tempArray1[0]}" title="${dto.name }">
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>

<div class="btn_area">

	<a href="${path }/member/list" class="btn_clear">전체목록</a>
	<!-- <a href="#" onClick="move('list','','');" class="btn_clear">목록</a> -->
	<a href="#" onClick="move('chuga','');" class="btn_blue">등록</a>
	<a href="#" onClick="move('sujung','${dto.no}');" class="btn_blue">수정</a>
	<a href="#" onClick="move('sakje','${dto.no}');" class="btn_gray">삭제</a>
</div>

<script>
function move(value1, value2){
	location.href="${path}/member/" + value1 + '?no=' + value2 + "&${searchQuery}";
}
</script>