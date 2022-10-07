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
				<div class="colCnt"><input type="text" name="writer" value="${dto.writer }"></div>
			</div>
			<div class="col">
				<div class="colTit">내용</div>
				<div class="colCnt">
					<textarea rows="" cols="" name="content">
						${dto.content}
					</textarea>
				</div>
			</div>
		</div>
	</div>
</form>

<div class="btn_area">
	<a href="${path }/member/list" class="btn_gray">전체목록</a>
	<a href="#" onClick="save();" class="btn_blue">수정</a>
</div>

<script>

$(document).ready(function(){			
	$("#modifyFile").click(function() { 
		$("#modifyArea").css({"display":"block"});
	})
})


function save() {
	if(confirm('수정할까요?')) {
		document.DirForm.enctype="multipart/form-data";
		document.DirForm.action = "${path}/memo/sujungProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}


</script>
</body>
</html>