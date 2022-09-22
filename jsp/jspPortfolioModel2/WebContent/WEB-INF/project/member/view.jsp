<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h2>회원상세정보</h2>  
<table border="1" width="80%">
	<tr>
		<td width="100px">아이디</td>
		<td>${dto.id }</td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td>${dto.passwd }</td>
	</tr>
	<tr>
		<td>이름</td>
		<td>${dto.name }</td>
	</tr>
	<tr>
		<td>생년월일</td>
		<td>${dto.jumin1 } - ${dto.jumin2 }</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>${dto.phone1 } - ${dto.phone2 } - ${dto.phone3 }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${dto.email1 } @ ${dto.email2 } </td>
	</tr>
	<tr>
		<td>주소</td>
		<td>
			${dto.postcode }
			<br>
			${dto.address } ${dto.detailAddress } ${dto.extraAddress }
		</td>
	</tr>
	<tr>
		<td>등록일</td>
		<td>${dto.regiDate }</td>
	</tr>
</table>
<div style="width: 80%; margin-top: 10px;" align="right">
	<a href="#" onClick="move('member_list.do','');">목록</a>
	<a href="#" onClick="move('member_chuga.do','');">등록</a>
	<a href="#" onClick="move('member_sujung.do','${dto.no}');">수정</a>
	<a href="#" onClick="move('member_sakje.do','${dto.no}');">삭제</a>
</div>

<script>
function move (value1, value2) {
	location.href = "${path}/member_servlet/" + value1 + "?no=" + value2;
}
</script>