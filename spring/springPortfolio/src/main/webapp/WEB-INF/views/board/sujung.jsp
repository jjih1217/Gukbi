<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ include file = "../_include/inc_header.jsp" %> --%>
<%@ include file = "_inc_top.jsp" %>

<h2 class="tit">${title}</h2>
<form name="DirForm">
	<input type="hidden" name="no" value="${dto.no}">
	<div class="board">
		<div class="board_view_head">
			<div class="col">
				<div class="colTit">no</div>
				<div class="colCnt">${dto.no}</div>
			</div>
			<div class="col">
				<div class="colTit">제목</div>
				<div class="colCnt">
					<input type="text" name="subject" maxlength="30" style="width:100%;" value="${dto.subject}">
				</div>
			</div>
			<div class="col">
				<div class="colTit">작성자</div>
				<div class="colCnt">
					<input type="text" name="writer" maxlength="8" value="${dto.writer }">
				</div>
			</div>
			<div class="col">
				<div class="colTit">비밀번호</div>
				<div class="colCnt">
					<c:choose>
						<c:when test="${sessionScope.sessionNo != null && sessionScope.sessionNo == '3' && sessionScope.sessionId == 'admin'}">
							<input type="password" name="passwd" maxlength="8" value="${dto.passwd }" readonly>
						</c:when>
						<c:otherwise>
							<input type="password" name="passwd" maxlength="8" placeholder="비밀번호를 입력해주세요">
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="col">
				<div class="colTit">이메일</div>
				<div class="colCnt">
					<c:set var="tempArray1" value="${fn:split(dto.email, '@') }"></c:set>
					<input type="text" name="email1" value="${tempArray1[0]}">
					@
					<select name="email2" >
						<c:choose>
							<c:when test="${tempArray1[1] == 'gmail.com'}">
								<option value="" >- 선택 -</option>
								<option value="@gmail.com" selected>gmail.com</option>
								<option value="@naver.com">naver.com</option>
								<option value="@hanmail.com">hanmail.com</option>
								<option value="@nate.com">nate.com</option>
							</c:when>
							<c:when test="${tempArray1[1] == 'naver.com'}">
								<option value="" >- 선택 -</option>
								<option value="@gmail.com">gmail.com</option>
								<option value="@naver.com" selected>naver.com</option>
								<option value="@hanmail.com">hanmail.com</option>
								<option value="@nate.com">nate.com</option>
							</c:when>
							<c:when test="${tempArray1[1] == 'hanmail.com'}">
								<option value="" >- 선택 -</option>
								<option value="@gmail.com">gmail.com</option>
								<option value="@naver.com">naver.com</option>
								<option value="@hanmail.com" selected>hanmail.com</option>
								<option value="@nate.com">nate.com</option>
							</c:when>
							<c:otherwise>
								<option value="" >- 선택 -</option>
								<option value="@gmail.com">gmail.com</option>
								<option value="@naver.com">naver.com</option>
								<option value="@hanmail.com">hanmail.com</option>
								<option value="@nate.com" selected>nate.com</option>
							</c:otherwise>
						</c:choose>
					</select>
				</div>
			</div>
			<div class="col">
				<div class="colTit">내용</div>
				<div class="colCnt" style="height: 20rem">
					<textarea rows="" cols="" name="content" style="width:100%;" value="">
						${dto.content }
					</textarea>
				</div>
			</div>
			
			<div class="col">
				<div class="colTit">공지글</div>
				<div class="colCnt">
				<c:choose>
					<c:when test="${dto.noticeNo > 0}">
						<input type="radio" name="noticeGubun" value="T" checked> 공지 &nbsp;
						<input type="radio" name="noticeGubun" value="F"> 일반 &nbsp;
					</c:when>
					<c:otherwise>
						<input type="radio" name="noticeGubun" value="T" disabled> 공지 &nbsp;
						<input type="radio" name="noticeGubun" value="F" checked> 일반 &nbsp;
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<div class="col">
				<div class="colTit">비밀글</div>
				<div class="colCnt">
					<c:choose>
					<c:when test="${dto.secretGubun == 'T'}">
						<input type="radio" name="secretGubun" value="T" checked> 비밀글 &nbsp;
						<input type="radio" name="secretGubun" value="F" > 비밀글아님 &nbsp;
					</c:when>
					<c:otherwise>
						<input type="radio" name="secretGubun" value="T"> 비밀글 &nbsp;
						<input type="radio" name="secretGubun" value="F" checked> 비밀글아님 &nbsp;
					</c:otherwise>
				</c:choose>
				</div>
			</div>
			<div class="col">
				<div class="colTit">등록일</div>
				<div class="colCnt">${dto.regiDate}</div>
			</div>
			<div class="col">
				<div class="colTit">첨부파일</div>
				<div class="colCnt">
					<c:choose>
						<c:when test="${dto.attachInfo == '-' }">
							이미지 없음
							<a href="#" id="modifyFile" class="btnBasic">파일추가</a>
							<span id="modifyArea" style="display:none;">
								<input type="file" name="file" >
							</span>
						</c:when>
						<c:otherwise>
							<c:set var="tempArray1" value="${fn:split(dto.attachInfo, ',') }"></c:set>
							<c:set var="temp1" value="${tempArray1[0]}"></c:set>
							<c:set var="temp2" value="${tempArray1[1]}"></c:set>
							${temp1 }
							<a href="#" id="modifyFile" class="btnBasic">파일수정</a>
							<span id="modifyArea" style="display:none;">
								<input type="file" name="file" >
							</span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
	
</form>
<div class="btn_area">
	<a href="${path }/board/list" class="btn_clear">전체목록</a>
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
		document.DirForm.action = "${path}/board/sujungProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}


</script>