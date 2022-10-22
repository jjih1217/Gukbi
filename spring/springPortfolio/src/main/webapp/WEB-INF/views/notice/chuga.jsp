<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ include file = "../_include/inc_header.jsp" %> --%>
<%@ include file = "_inc_top.jsp" %>

<h2 class="tit">${title}</h2>
<form name="DirForm">
	<div class="board">
		<div class="board_write_head">
			<div class="col">
				<div class="colTit">제목</div>
				<div class="colCnt"><input type="text" name="subject" maxlength="30" style="width:100%;" placeholder="30자 이내로 입력해주세요"></div>
			</div>
			<div class="col">
				<div class="colTit">공지글 여부</div>
				<div class="colCnt">
				<c:choose>
					<c:when test="${sessionScope.sessionNo != null && sessionScope.sessionNo == '3' && sessionScope.sessionId == 'admin'}">
						<input type="radio" name="noticeGubun" value="T" > 공지 &nbsp;
						<input type="radio" name="noticeGubun" value="F" checked> 일반 &nbsp;
					</c:when>
					<c:otherwise>
						<input type="radio" name="noticeGubun" value="T" disabled> 공지 &nbsp;
						<input type="radio" name="noticeGubun" value="F" checked> 일반 &nbsp;
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<div class="col">
				<div class="colTit">작성자</div>
				<div class="colCnt">
				<input type="text" name="writer" maxlength="8" value="관리자" readonly></div>
			</div>
			<div class="col">
				<div class="colTit">비밀번호</div>
				<div class="colCnt"><input type="password" name="passwd" maxlength="8" placeholder="8자 이내로 입력해주세요"></div>
			</div>
			<div class="col">
				<div class="colTit">내용</div>
				<div class="colCnt">
					<textarea rows="" cols="" name="content" style="width:100%;"></textarea>
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
	
	var frm = document.DirForm;
	if(frm.subject.value.length == 0) {
		alert("제목은 필수입력 값입니다");
		frm.subject.focus();
		return false;
	} else if (frm.passwd.value.length == 0) {
		alert("비밀번호는 필수입력 값입니다");
		frm.passwd.focus();
		return false;
	} else if (frm.content.value.length == 0) {
		alert("내용은 필수입력 값입니다");
		frm.content.focus();
		return false;
	} 
	

	if(confirm('저장하시겠습니까??')) {
		document.DirForm.enctype="multipart/form-data";
		document.DirForm.action = "${path}/notice/chugaAttachProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}

</script>
