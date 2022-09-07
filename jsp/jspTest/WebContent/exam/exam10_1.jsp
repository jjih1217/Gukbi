<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");

	String dan_ = request.getParameter("dan"); // 출력
	int dan = 0; //계산
	
	if(dan_ == null) { 
		// 현재 페이지에서 처리
		// null 처리 하지 않으면 refresh 했을 때 null
		dan_="";
	} else {
		dan = Integer.parseInt(dan_);
	}
	
	out.println("dan_ : " + dan_ + "<br>");
	out.println("dan : " + dan + "<br>");
	
	int startValue = dan;
	int endValue = 9;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exam10_1.jsp</title>
</head>
<body>

<h2>exam10_1.jsp</h2>

<!-- 입력 : 시작할 단수 -->
<form name="gugudan">
	시작할 단수 입력 :
	<input type="text" name="dan" value=<%=dan_ %>>
	<button type="button" onClick="formSubmit();">확인</button>
</form>

<script>
function formSubmit() {
	document.gugudan.action = "exam10_1.jsp";
	document.gugudan.method = "post";
	document.gugudan.submit();
}
</script>

<hr>

<table border="1">
	<tr>
		<%	
			if(dan <= 0 ) { return; }
			for (int i=startValue; i <= endValue; i++) { 
		%>	
				<td style="padding: 10px;">
					 <table border="1" style="background: #fffdd9;">
					 	<% for (int j=1; j<=9; j++) {%>
						<tr>
							<td><%=i %></td>
							<td>*</td>
							<td><%=j %></td>
							<td>=</td>
							<td><%=i * j %></td>
						</tr>
						<% } %>
					</table>
					
					<%--  
					<% if(i < endValue) { %>
						<hr>
					<% } %>	 
					--%>
				</td>
		<% 
			} 
		%>
	</tr>
</table>


</body>
</html>

