<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>

<h2 class="tit">${title}</h2>
<form name="DirForm">
	<c:if test="${dto.no > 0 }">
		<input type="text" name="no" value="${dto.no }">
	</c:if>
	<div class="board">
		<div class="board_write_head">
			<div class="col">
				<div class="colTit">제목</div>
				<div class="colCnt"><input type="text" name="subject"></div>
			</div>
			<div class="col">
				<div class="colTit">공지글 여부</div>
				<div class="colCnt">
					<input type="radio" name="noticeGubun" value="T"> 공지 &nbsp;
					<input type="radio" name="noticeGubun" value="F" checked> 일반 &nbsp;
				</div>
			</div>
			<div class="col">
				<div class="colTit">작성자</div>
				<div class="colCnt">
				<input type="text" name="writer"></div>
			</div>
			<div class="col">
				<div class="colTit">비밀번호</div>
				<div class="colCnt"><input type="password" name="passwd"></div>
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
				<div class="colTit">내용</div>
				<div class="colCnt">
					<textarea rows="" cols="" name="content"></textarea>
				</div>
			</div>
			<div class="col">
				<div class="colTit">비밀글 여부</div>
				<div class="colCnt">
					<input type="radio" name="secretGubun" value="T"> 비밀글 &nbsp;
					<input type="radio" name="secretGubun" value="F" checked> 비밀글아님 &nbsp;
				</div>
			</div>
			<div class="col">
				<div class="colTit">첨부파일</div>
				<div class="colCnt">
					<input type="file" name="file" >
				</div>
			</div>
		</div>
	</div>
</form>

<div class="btn_area">
	<a href="${path }/board/list" class="btn_gray">전체목록</a>
	<a href="#" onClick="save();" class="btn_blue">저장하기</a>
</div>


<script>
function save() {
	if(confirm('저장하시겠습니까??')) {
		document.DirForm.enctype="multipart/form-data";
		document.DirForm.action = "${path}/board/chugaAttachProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
