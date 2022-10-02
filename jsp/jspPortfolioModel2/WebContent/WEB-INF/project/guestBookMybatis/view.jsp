<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/inc_header.jsp" %>
<%@ include file = "_inc_top.jsp" %>

<h2>방명록(Mybatis) 상세보기</h2>  
<form name="DirForm">
<table border="1" align="center" width="80%">
	<tr>
		<td width="150">이름</td>
		<td>
			<input type="text" name="name" value="">
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>
			<input type="text" name="email" value="">
		</td>
	</tr>
	<!-- <tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="passwd" value="">
		</td>
	</tr> -->
	<tr>
		<td colspan="2">
			<textarea name="content" rows="5" cols="55" ></textarea>
		</td>
	</tr>
</table>
</form>

<div style="width: 80%; margin-top: 10px;" align="right">
	|
	<a href="${path }/memoMybatis_servle/'memoMybatis_list.do">전체목록</a>
	|
	<a href="#" onClick="move('memoMybatis_list.do','');">목록</a>
	|
	<a href="#" onClick="move('memoMybatis_chuga.do','');">등록</a>
	|
	<a href="#" onClick="move('memoMybatis_sujung.do','${dto.no}');">수정</a>
	|
	<a href="#" onClick="move('memoMybatis_sakje.do','${dto.no}');">삭제</a>
	|
</div>

<script>
function save() {
	if(confirm('OK?')){
		document.DirForm.action = "${path}/guestBookMybatis_servlet/guestBookMybatis_chugaProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>
    