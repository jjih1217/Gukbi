<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>

<h2 class="tit">${title}</h2>

<div class="board">
	<div class="board_view_head">
		<div class="col">
			<div class="colTit">순번</div>
			<div class="colCnt">${dto.no}</div>
		</div>
		<div class="col">
			<div class="colTit">작성자</div>
			<div class="colCnt">${dto.writer}</div>
		</div>
		<div class="col">
			<div class="colTit">내용</div>
			<div class="colCnt">
				${fn:replace(dto.content ,newLineChar, "<br/>")}
			</div>
		</div>
	</div>
</div>

<div class="btn_area">

	<a href="${path }/memo/list" class="btn_clear">전체목록</a>
	<a href="#" onClick="move('list','');" class="btn_clear">목록</a>
	<a href="#" onClick="move('chuga','');" class="btn_blue">등록</a>
	<a href="#" onClick="move('sujung','${dto.no}');" class="btn_blue">수정</a>
	<a href="#" onClick="move('sakje','${dto.no}');" class="btn_gray">삭제</a>
</div>

<script>
function move(value1, value2){
	location.href="${path}/memo/" + value1 + '?no=' + value2;
}
</script>