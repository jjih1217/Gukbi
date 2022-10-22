<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ include file = "../_include/inc_header.jsp" %> --%>
<%@ include file = "_inc_top.jsp" %>

<h2 class="tit">${title}</h2>
<div class="board">
	<div class="board_view_head">
		<div class="col">
			<div class="colTit">no</div>
			<div class="colCnt">${dto.no}</div>
		</div>
		<div class="col">
			<div class="colTit">제목</div>
			<div class="colCnt">
				${dto.subject}
			</div>
		</div>
		<div class="col">
			<div class="col-group">
				<div class="colTit">작성자</div>
				<div class="colCnt">${dto.writer}</div>
			</div>
			<div class="col-group">
				<div class="colTit">조회수</div>
				<div class="colCnt">${dto.hit}</div>
			</div>
		</div>
		<div class="col">
			<!-- <div class="colTit">내용</div> -->
			<div class="colCnt" style="height: 20rem; width: 100%">
				<span style="word-break: break-all;">${fn:replace(dto.content ,newLineChar, "<br/>")}</span>
			</div>
		</div>
		<div class="col">
			<div class="colTit">공지글</div>
			<div class="colCnt">
				<c:if test="${dto.noticeNo > 0}"> O </c:if>
			</div>
		</div>
		<div class="col">
			<div class="colTit">등록일</div>
			<div class="colCnt">${dto.regiDate}</div>
		</div>
		<div class="col">
			<div class="colTit">첨부파일</div>
			<div class="colCnt">
				<c:choose>
					<c:when test="${dto.attachInfo == '-' }">
						이미지 없음
					</c:when>
					<c:otherwise>
						<c:set var="tempArray1" value="${fn:split(dto.attachInfo, ',') }"></c:set>
						<c:set var="temp1" value="${tempArray1[0]}"></c:set>
						<c:set var="temp2" value="${tempArray1[1]}"></c:set>
						<a href="${path }/attach${path}/member/${temp2}" download>${tempArray1[0]}</a>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>

<div class="board_view_bottom">
	<div class="col-group">
		<div class="col1">이전글</div>
		<div class="col2">
			<c:choose>
				<c:when test="${dto.preNo > 0 }">
					<a href="#" onClick="move('view', '${dto.preNo}');" class="col_blue">${dto.preSubject}</a>
				</c:when>
				<c:otherwise>
					이전글이 없습니다
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div class="col-group">
		<div class="col1">다음글</div>
		<div class="col2">
			<c:choose>
				<c:when test="${dto.nxtNo > 0 }">
					<a href="#" onClick="move('view', '${dto.nxtNo}');">${dto.nxtSubject}</a>
				</c:when>
				<c:otherwise>
					다음글이 없습니다
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
	
<div class="btn_area">
	<a href="${path }/notice/list" class="btn_clear">전체목록</a>
	<!-- <a href="#" onClick="move('list','','');" class="btn_clear">목록</a> -->
	<c:if test="${sessionScope.sessionNo != null && sessionScope.sessionNo == '3' && sessionScope.sessionId == 'admin'}">
		<a href="#" onClick="move('chuga','');" class="btn_blue">등록</a>
		<a href="#" onClick="move('sujung','${dto.no}');" class="btn_blue">수정</a>
		<a href="#" onClick="move('sakje','${dto.no}');" class="btn_gray">삭제</a>
	</c:if>
	
</div>					


<script>
function move(value1, value2){
	location.href="${path}/notice/" + value1 + '?no=' + value2 + "&${searchQuery}";
}
</script>