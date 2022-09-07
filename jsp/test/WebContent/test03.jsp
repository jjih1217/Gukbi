<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<table border="1">
<% 
	int sum = 0;
	for(int i=1; i<=10; i++) {
		sum += i;
%>
	<tr>
		<td><%=i %></td>
		<td><%=sum %></td>
	</tr>
	
<% } %>
</table>


