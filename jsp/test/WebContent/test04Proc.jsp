<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String address = request.getParameter("address");
	String age = request.getParameter("age");
	
%>

<table border="1">
	<tr>
		<td>이름</td>
		<td><%=name %></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=address %></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><%=age %></td>
	</tr>
</table>