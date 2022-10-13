<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>

<h2 class="tit">${title}</h2>
<form name="DirForm">
	<input type="hidden" name="boardChkNo" value="${dto.boardChkNo }">
	<div class="board">
		<div class="board_view_head">
			<div class="col">
				<div class="colTit">테이블 ID</div>
				<div class="colCnt">${dto.tbl }</div>
			</div>
			<div class="col">
				<div class="colTit">테이블 명</div>
				<div class="colCnt">${dto.tblName }</div>
			</div>
			<div class="col">
				<div class="colTit">등록일</div>
				<div class="colCnt">${dto.regiDate}</div>
			</div>
		</div>
	</div>
</form>

<div class="btn_area">
	<a href="${path }/boardChk/list" class="btn_gray">전체목록</a>
	<a href="#" onClick="save();" class="btn_blue">삭제</a>
</div>


<script>
function save() {
	if(confirm('삭제하시겠습니까?')) {
		document.DirForm.action = "${path}/boardChk/sakjeProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
