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
				<div class="colCnt"><input type="text" name="name" value="${dto.name}"></div>
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
				<div class="colCnt">
					<textarea rows="" cols="" name="content">
							${dto.content}
					</textarea>
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
		document.DirForm.action = "${path}/guestBook/sujungProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}


</script>
</body>
</html>