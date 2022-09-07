<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>exam10.jsp</title>
</head>
<body>

<h2>exam10.jsp</h2>

<%
	for(int j=2; j<=9; j++) {
%>
	<table border="1">
		<% 
			for(int i=1; i<=9; i++) { 
		%>
			<tr>
				<td><%=j %></td>
				<td> * </td>
				<td><%=i %></td>
				<td>=</td>	
				<td><%=j * i%> </td>	
			</tr>	
		<% 
			} 
		%>
	
	</table>
	
	<% 
		out.print("<hr>");
		} 
	%>

</body>
</html>