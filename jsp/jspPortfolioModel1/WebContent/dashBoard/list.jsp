<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../_include/inc_sessionChk.jsp" %>
   
<div style="border: 0px solid red; width: 60%">
	
	
	<% if(sessionNo == 0) { %>
		<font style="font-size: 100px; font-weight: bold;">here we go!</font>
		<div style="padding: 20px 0">
			<form name="loginForm">
			아이디 : <input type="text" name="id" style="width:80px;"> &nbsp;
			비밀번호: <input type="password" name="passwd" style="width:80px;"> &nbsp;
			<button type="button" onClick="login();">로그인</button>
			</form>
	 	</div>
	    	
		<script>
		function login() {
			if(confirm('로그인할까요?')) {
				document.loginForm.action = 'mainProc.jsp?menuGubun=noLogin_loginProc';
				document.loginForm.method = 'post';
				document.loginForm.submit();
			}
		}
		</script>
	<% } else { %>	
		<font style="font-size: 100px; font-weight: bold;">here we are!</font>
	<% } %>
</div>