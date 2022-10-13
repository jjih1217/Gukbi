<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../_include/inc_header.jsp" %>

<h2 class="tit">${title}</h2>
<!-- <form name = "chugaForm">
	<input type="text" name="procGubun" id="procGubun" value="chugaProc"><br>
	<div class="chugaBox form-box">
		<div class="form-inline">
			<div class="form-group">
				<label for="tbl">테이블 ID</label>
				<input type="text" name="tbl" id="tbl">
			</div>
			<div class="form-group">
				<label for="tblName">테이블 명</label>
				<input type="text" name="tblName" id="tblName">
			</div>
			<div class="form-group">
				<a href="#" Onclick="save();" class="btn btn_search">등록</a>
				<a href="#" Onclick="goReset();" class="btn btn_reset">초기화</a>
			</div>
		</div>
	</div>
</form>
 -->
<div class="board">
	<div class="board_list_head">
		<div class="col-20">테이블 NO</div>
		<div class="col-20">테이블 ID</div>
		<div class="col-20">테이블명</div>
		<div class="col-20">등록일</div>
		<div class="col-20">비고</div>
	</div>
	<div class="board_list_body">
		<c:if test="${list.size() == 0 }">
			<div class="empty">
				등록된 내용이 없습니다
			</div>
		</c:if>
		
		<c:forEach var="tableDto" items="${list }">
			<div class="item">
				<div class="col-20">${tableDto.boardChkNo }</div>
				<div class="col-20">${tableDto.tbl }</div>
				<div class="col-20">${tableDto.tblName}</div>
				<div class="col-20">${tableDto.regiDate}</div>
				<div class="col-20">
					<a href="#" onClick="move('sujung','${tableDto.boardChkNo }');" >수정</a> / 
					<a href="#" onClick="move('sakje','${tableDto.boardChkNo }');" >삭제</a>
					
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<div class="btn_area">
<%-- 	<a href="${path }/guestBook/list" class="btn_gray">전체목록</a> --%>
	<!-- <a href="#" onClick="move('list','');" class="btn_gray">목록</a> -->
	<!-- <a href="#" onClick="move('chuga','');" class="btn_red">등록</a> -->
	<a href="#" onClick="move('chuga','');" class="btn_blue">등록</a>
</div>


<script>
function move(value1, value2){
	location.href="${path}/boardChk/" + value1 + '?boardChkNo='  + value2;
}

function goSearch() {
	if(confirm('검색하시겠습니까?')){
		document.searchForm.action = "${path}/member/search";
		document.searchForm.method = "post";
		document.searchForm.submit();
	}
}

function goReset() {
	document.searchForm.tbl.value = "";
	document.searchForm.tblName.value= "";
}


function save() {
	document.chugaForm.action = "${path}/boardChk/chugaProc";
	document.chugaForm.method = "post";
	document.chugaForm.submit();
}


</script>