<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../_include/inc_header.jsp" %>

<h2 class="tit">${title}</h2>
<div class="board">
	<div class="board_list_head">
		<div class="col-10">순번</div>
		<div class="col-60 al-left" >내용</div>
		<div class="col-10">작성자</div>
		<div class="col-20">등록일</div>
	</div>
	<div class="board_list_body">
		<c:if test="${list.size() == 0 }">
			<div class="empty">
				등록된 내용이 없습니다
			</div>
		</c:if>
		<c:forEach var="memoDto" items="${list }">
			<div class="item">
				<div class="col-10">${memoDto.no }</div>
				<div class="col-60 al-left">
					<a href="#" onClick="move('view','${memoDto.no}')">${memoDto.content}</a>
				</div>
				<div class="col-10">${memoDto.writer}</div>
				<div class="col-20">${memoDto.regiDate}</div>
			</div>
	</c:forEach>
	</div>
</div>

<div class="btn_area">
	<a href="${path }/memo/list" class="btn_gray">전체목록</a>
	<a href="#" onClick="move('list','');" class="btn_gray">목록</a>
	<a href="#" onClick="move('chuga','');" class="btn_blue">등록</a>
</div>

<div class="paging">

</div>
<script>
function move(value1, value2){
	location.href="${path}/memo/" + value1 + '?no=' + value2;
}
</script>
