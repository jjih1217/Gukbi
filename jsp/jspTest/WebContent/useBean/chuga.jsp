<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	String actionPage = "";
	//actionPage = "chugaProcUseBean.jsp";
	actionPage = "chugaProcDto.jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="80%" align="center">
	<tr>
		<td height="100px" align="center">
		<!-- 상단 메뉴 시작 -->
		<%@ include file = "../include/inc_menu.jsp" %>
		<!-- 상단 메뉴 종료 -->
		</td>
	</tr>
	<tr>
		<td height="300px" align="center">
		<!-- 본문 내용 시작 -->
		<h2>Test useBean</h2>
		<form name="form" method="get" action="<%=actionPage %>">
		<table border="1" width="80%">
			<tr>
				<td>반장</td>
				<td>
					<input type="radio" name="boss_1" value="홍길동"> 홍길동 &nbsp;&nbsp;
					<input type="radio" name="boss_1" value="김철수"> 김철수 &nbsp;&nbsp;
					<input type="radio" name="boss_1" value="이영희"> 이영희 &nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td>부반장</td>
				<td>
					<input type="radio" name="boss_2" value="이승엽"> 이승엽 &nbsp;&nbsp;
					<input type="radio" name="boss_2" value="박찬호"> 박찬호 &nbsp;&nbsp;
					<input type="radio" name="boss_2" value="김병현"> 김병현 &nbsp;&nbsp;
				</td>
			</tr>
			<tr>
				<td>회장</td>
				<td>
					<input type="radio" name="boss_3" value="이문세"> 이문세 &nbsp;&nbsp;
					<input type="radio" name="boss_3" value="안성기"> 안성기 &nbsp;&nbsp;
					<input type="radio" name="boss_3" value="이연복"> 이연복 &nbsp;&nbsp;
				</td>
			</tr>
		</table>
		
		<button type="submit">확인</button>
		</form>
		<!-- 본문 내용 종료 -->
		</td>
	</tr>
	<tr>
		<td height="100px" align="center">
			<%@ include file = "../include/inc_bottom.jsp" %>
		</td>
	</tr>
</table>
</body>
</html>