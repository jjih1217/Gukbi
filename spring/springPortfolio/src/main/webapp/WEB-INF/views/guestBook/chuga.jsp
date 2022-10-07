<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>

<h2 class="tit">${title}</h2>
<form name="DirForm">
	<c:choose>
		<c:when test="${sessionScope.sessionNo == null || sessionScope.sessionNo == ''}">
			<input type="hidden" name="memberNo" value="0">
		</c:when>
		<c:otherwise>
			<input type="hidden" name="memberNo" value="${sessionScope.sessionNo }">
		</c:otherwise>
	</c:choose>
	<div class="board">
		<div class="board_write_head">
			<div class="col">
				<div class="colTit">이름</div>
				<div class="colCnt">
				<input type="text" name="name"></div>
			</div>
			<div class="col">
				<div class="colTit">이메일</div>
				<div class="colCnt">
				<input type="text" name="email1">
				@
				<select name="email2" >
					<option value="" selected>- 선택 -</option>
					<option value="@gmail.com">gmail.com</option>
					<option value="@naver.com">naver.com</option>
					<option value="@hanmail.com">hanmail.com</option>
					<option value="@nate.com">nate.com</option>
				</select>
				</div>
			</div>
			<div class="col">
				<div class="colTit">비밀번호</div>
				<div class="colCnt"><input type="password" name="passwd"></div>
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
	<a href="${path }/guestBook/list" class="btn_gray">전체목록</a>
	<a href="#" onClick="save();" class="btn_blue">저장하기</a>
</div>


<script>
function save() {
	if(confirm('저장하시겠습니까??')) {
		document.DirForm.action = "${path}/guestBook/chugaProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>

