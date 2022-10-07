<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>

<h2 class="tit">${title}</h2>
<form name="DirForm">
	<input type="hidden" name="no" value="${dto.no }">
		<div class="board">
			<div class="board_view_head">
			<div class="col">
				<div class="colTit">순번</div>
				<div class="colCnt">${dto.no}</div>
			</div>
			<div class="col">
				<div class="colTit">작성자</div>
				<div class="colCnt">${dto.writer }</div>
			</div>
			<div class="col">
				<div class="colTit">내용</div>
				<div class="colCnt">
					${fn:replace(dto.content ,newLineChar, "<br/>")}
				</div>
			</div>
		</div>
	</div>
</form>

<div class="btn_area">
	<a href="${path }/member/list" class="btn_gray">전체목록</a>
	<a href="#" onClick="save();" class="btn_blue">삭제하기</a>
</div>

<script>

$(document).ready(function(){			
	$("#modifyFile").click(function() { 
		$("#modifyArea").css({"display":"block"});
	})
})


function save() {
	if(confirm('삭제할까요?')) {
		document.DirForm.action = "${path}/memo/sakjeProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}


</script>
</body>
</html>