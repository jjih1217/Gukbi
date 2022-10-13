<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>

<h2 class="tit">${title}</h2>
<form name="DirForm">
	<input type="hidden" name="no" value="${dto.no }">
		<div class="board">
			<div class="board_view_head">
			<div class="col">
				<div class="colTit">회원번호</div>
				<div class="colCnt">${dto.no}</div>
			</div>
			<div class="col">
				<div class="colTit">아이디</div>
				<div class="colCnt">${dto.id}</div>
			</div>
			<div class="col">
				<div class="colTit">이름</div>
				<div class="colCnt">${dto.name}</div>
			</div>
			<div class="col">
				<div class="colTit">연락처</div>
				<div class="colCnt">
					<select name="phone1" >
						<c:choose>
							<c:when test="${fn:substring(dto.phone, 0, 3) == '010'}">
								<option value="" >- 선택 -</option>
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
							</c:when>
							<c:when test="${fn:substring(dto.phone, 0, 3) == '011'}">
								<option value="" >- 선택 -</option>
								<option value="010" >010</option>
								<option value="011" selected>011</option>
								<option value="016">016</option>
							</c:when>
							<c:otherwise>
								<option value="" >- 선택 -</option>
								<option value="010" >010</option>
								<option value="011">011</option>
								<option value="016" selected>016</option>
							</c:otherwise>
						</c:choose>
					</select>
					 - 
					<input type="text" name="phone2" value="${fn:substring(dto.phone, 3, 7)}"> - 
					<input type="text" name="phone3" value="${fn:substring(dto.phone, 7, 11)}">
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
				<div class="colTit">주민번호</div>
				<div class="colCnt">
					${fn:substring(dto.jumin, 0, 6)} - ${fn:substring(dto.jumin, 7, 8)}****** 
				</div>
			</div>
			<div class="col">
				<div class="colTit">주소</div>
					<div class="colCnt">
					<input type="text" id="sample6_postcode" placeholder="우편번호" name="juso1" value="${dto.juso1 }">
					<button type="button" onClick="sample6_execDaumPostcode();" class="btnBasic">우편번호 찾기</button><br>
					<input type="text" id="sample6_address" placeholder="주소" name="juso2" value="${dto.juso2 }"><br>
					<input type="text" id="sample6_detailAddress" placeholder="상세주소" name="juso3" value="${dto.juso3 }">
					<input type="text" id="sample6_extraAddress" placeholder="참고항목" name="juso4" value="${dto.juso4 }">
				</div>
			</div>
			<div class="col">
				<div class="colTit">회원등급</div>
				<div class="colCnt">
					<c:choose>
						<c:when test="${dto.grade == '최우수회원'}">
							<input type="radio" name="grade" value="최우수회원" checked> 최우수회원 &nbsp;
							<input type="radio" name="grade" value="우수회원"> 우수회원 &nbsp;
							<input type="radio" name="grade" value="일반회원" > 일반회원
						</c:when>
						<c:when test="${dto.grade == '우수회원'}">
							<input type="radio" name="grade" value="최우수회원"> 최우수회원 &nbsp;
							<input type="radio" name="grade" value="우수회원" checked> 우수회원 &nbsp;
							<input type="radio" name="grade" value="일반회원" > 일반회원
						</c:when>
						<c:otherwise>
							<input type="radio" name="grade" value="최우수회원"> 최우수회원 &nbsp;
							<input type="radio" name="grade" value="우수회원"> 우수회원 &nbsp;
							<input type="radio" name="grade" value="일반회원" checked> 일반회원
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
		document.DirForm.action = "${path}/member/sujungProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}


</script>
