<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ include file = "../_include/inc_header.jsp" %> --%>
<%@ include file = "_inc_top.jsp" %>

<h2 class="tit">${title}</h2>
<form name="DirForm">
	<input type="hidden" name="no" value="${dto.no }">
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
				<div class="colTit">비밀번호</div>
				<div class="colCnt">
					<c:choose>
						<c:when test="${sessionScope.sessionNo != null && sessionScope.sessionNo == '3' && sessionScope.sessionId == 'admin'}">
							<input type="password" name="passwd" maxlength="8" value="${dto.passwd }" readonly>
						</c:when>
						<c:otherwise>
							<input type="password" name="passwd" maxlength="8" placeholder="비밀번호를 입력해주세요">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="col">
				<div class="col-group">
					<div class="colTit">작성자</div>
					<div class="colCnt">${dto.writer}</div>
				</div>
				<div class="col-group">
					<div class="colTit">이메일</div>
					<div class="colCnt">${dto.email}</div>
				</div>
				<div class="col-group">
					<div class="colTit">조회수</div>
					<div class="colCnt">${dto.hit}</div>
				</div>
			</div>
			<div class="col">
				<div class="colTit">내용</div>
				<div class="colCnt" style="height: 20rem; width: 100%">
				
					<span style="word-break: break-all;">${fn:replace(dto.content ,newLineChar, "<br/>")}</span>
				</div>
			</div>
			<div class="col">
				<div class="colTit">공지글</div>
				<div class="colCnt">
					<c:if test="${dto.noticeNo > 0}"> O </c:if> X
				</div>
			</div>
			<div class="col">
				<div class="colTit">비밀글</div>
				<div class="colCnt">
					<c:if test="${dto.secretGubun == 'T'}"> O </c:if>
				</div>
			</div>
			<%-- <div class="col">
				<div class="colTit">IP</div>
				<div class="colCnt">${dto.ip}</div>
			</div> --%>
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
</form>
	
<div class="btn_area">
	<a href="${path }/board/list" class="btn_gray">전체목록</a>
	<a href="#" onClick="save();" class="btn_blue">삭제하기</a>
</div>					

<script>
function move(value1, value2){
	location.href="${path}/board/" + value1 + '?no=' + value2 + "&${searchQuery}";
}

function save() {
	if(confirm('삭제할까요?')) {
		document.DirForm.action = "${path}/board/sakjeProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>