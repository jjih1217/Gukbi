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
				<div class="colTit">이름</div>
				<div class="colCnt">${dto.name}</div>
			</div>
			<div class="col">
				<div class="colTit">이메일</div>
				<div class="colCnt">${dto.email}</div>
			</div>
			<div class="col">
				<div class="colTit">내용</div>
				<div class="colCnt">
					${fn:replace(guestBookDto.content, newLineChar, "<br/>")}
				</div>
			</div>
			<div class="col">
				<div class="colTit">비밀번호</div>
				<div class="colCnt"><input type="password" name="passwd"></div>
			</div>
		</div>
	</div>
</form>

<div class="btn_area">
	<a href="${path }/guestBook/list" class="btn_gray">전체목록</a>
	<a href="#" onClick="save();" class="btn_blue">삭제</a>
</div>

<script>

$(document).ready(function(){			
	$("#modifyFile").click(function() { 
		$("#modifyArea").css({"display":"block"});
	})
})


function save() {
	if(confirm('삭제할까요?')) {
		document.DirForm.action = "${path}/guestBook/sakjeProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}


</script>
</body>
</html>