<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>

<h2 class="tit">${title}</h2>
<form name="DirForm">
	<div class="board">
		<div class="board_write_head">
			<div class="col">
				<div class="colTit">작성자</div>
				<div class="colCnt"><input type="text" name="writer"></div>
			</div>
			<div class="col">
				<div class="colTit">내용</div>
				<div class="colCnt">
					<textarea rows="" cols="" name="content"></textarea>
				</div>
			</div>
		</div>
	</div>
</form>

<div class="btn_area">
	<a href="${path }/member/list" class="btn_gray">전체목록</a>
	<a href="#" onClick="save();" class="btn_blue">저장하기</a>
</div>


<script>
function save() {
	if(confirm('저장하시겠습니까??')) {
		document.DirForm.action = "${path}/memo/chugaProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
