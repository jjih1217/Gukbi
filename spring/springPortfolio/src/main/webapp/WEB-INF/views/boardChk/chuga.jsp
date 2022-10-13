<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>

<h2 class="tit">${title}</h2>
<form name="DirForm">
	<div class="board">
		<div class="board_write_head">
			<div class="col">
				<div class="colTit">테이블 ID</div>
				<div class="colCnt">
					<input type="text" name="tbl">
				</div>
			</div>
			<div class="col">
				<div class="colTit">테이블 명</div>
				<div class="colCnt">
					<input type="text" name="tblName" id="tblName">
				</div>
			</div>
		</div>
	</div>
</form>

<div class="btn_area">
	<a href="${path }/boardChk/list" class="btn_gray">전체목록</a>
	<a href="#" onClick="save();" class="btn_blue">등록</a>
</div>


<script>
function save() {
	if(confirm('저장하시겠습니까??')) {
		document.DirForm.action = "${path}/boardChk/chugaProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
