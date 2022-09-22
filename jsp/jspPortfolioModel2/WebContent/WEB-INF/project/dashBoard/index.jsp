<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div style="width:60%">
	<font style="font-size: 100px">Here we go!!</font>
	<div style="padding: 20px 0">
		<form name="loginForm">
			아이디 : <input type="text" name="id" style="width:  80px;"> &nbsp;
			아이디 : <input type="password" name="passwd" style="width:  80px;"> &nbsp;
			<butto type="button" onClick="login();">로그인</button>
		</form>
	</div>
	<script>
	function login(){
		if(confirm('로그인할까여?')) {
			document.loginForm.action="aaa";
			document.loginForm.method="post";
			document.loginForm.submit();
		}
	}
	</script>
</div>

