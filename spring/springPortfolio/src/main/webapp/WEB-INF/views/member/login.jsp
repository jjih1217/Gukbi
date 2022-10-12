<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "../_include/inc_header.jsp" %>

<div class="member-login">
	<div class="box-title">
		<h3>${title}</h3>
		<p>로그인하시면 게시판의 서비스를 이용하실 수 있습니다.</p>
	</div>
	<div class="inner-box">
		<form name="DirForm">
			<div class="loginForm">
				<input type="text" name="id" class="input-id input-login"></td>
				<input type="password" name="passwd" class="input-pw input-login">
				<button type="button" Onclick="save();" class="btn-login">로그인</button>
			</div>
		</form>
	</div>
</div>
<script>
function save() {
	if(confirm('로그인할까요?')) {
		document.DirForm.action = "${path}/member/loginProc";
		document.DirForm.method = "post";
		document.DirForm.submit();
	}
}
</script>

