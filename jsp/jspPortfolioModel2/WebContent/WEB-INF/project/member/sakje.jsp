<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>회원삭제</h2>  
<form name="DirForm">
<input type="text" name="no" value="${dto.no }">
<input type="text" name="searchGubun" id="id" value="${searchGubun }">
<input type="text" name="searchData" id="id" value="${searchData }">
<table border="1" align="center" width="80%">
	<tr>
		<td width="150">아이디</td>
		<td>${dto.id }</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>
			<input type="password" name="passwd" value="">
		</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>
			${dto.name }
		</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>
			${dto.jumin1 } -
			${dto.jumin1 }******
		</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>${dto.phone1}
			-
			${dto.phone2 }
			-
			${dto.phone3 }
		</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>
			${dto.email1}
			@
			${dto.email2}
		</td>
	</tr>
	<tr>
		<td rowspan="3">주소</td>
		<td>
			${dto.postcode }
		</td>
	</tr>
	<tr>
		<td>
		${dto.address }
		</td>
	</tr>
	<tr>
		<td>
			${dto.detailAddress }
			${dto.extraAddress }
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center" style="height: 50px;">
			<button type="button" onClick="save();">삭제하기</button>
			<button type="button" onClick="move('member_list.do','');">목록으로</button>
		</td>
	</tr>
</table>
</form>
<script>
function save() {
	if(confirm('OK?')){
		document.DirForm.action = "${path}/member_servlet/member_sakjeProc.do";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
function move (value1, value2) {
	location.href = "${path}/member_servlet/" + value1 + "?no=" + value2 + "&${searchQuery}";
}
</script>