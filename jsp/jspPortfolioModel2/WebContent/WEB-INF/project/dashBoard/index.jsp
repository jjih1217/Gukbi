<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file = "../include/inc_header.jsp" %>   

<div style="width:60%">
	<font style="font-size: 100px; font-weight: bold">Here<br>we<br>go!!</font>
	
	<%-- 
	sessionNo : ${sessionScope.sessionNo }<br>
	sessionId : ${sessionScope.sessionId }<br>
	sessionName : ${sessionScope.sessionName }<br>
	--%>
	
	<c:if test="${sessionScope.sessionNo == null || sessionScope.sessionNo == '' || sessionScope.sessionNo == 0 }">
	<div style="padding: 20px 0">
		<form name="loginForm">
			아이디 : <input type="text" name="id" style="width:  80px;"> &nbsp;
			아이디 : <input type="password" name="passwd" style="width:  80px;"> &nbsp;
			<button type="button" onClick="login();">로그인</button>
		</form>
	</div>
	<script>
	function login(){
		if(confirm('로그인?')) {
			document.loginForm.action = "${path}/noLogin_servlet/noLogin_loginProc";
			document.loginForm.method = "post";
			document.loginForm.submit();
		}
	}
	</script>
	</c:if>
</div>

