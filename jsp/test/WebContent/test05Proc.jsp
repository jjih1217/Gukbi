<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String eno = request.getParameter("eno");
	String ename = request.getParameter("ename");
	String dname = request.getParameter("dname");
	String salary = request.getParameter("salary");
	String manager = request.getParameter("manager");
	
%>

<table border="1">
	<tr>
		<td>사원번호</td>
		<td><%=eno %></td>
	</tr>
	<tr>
		<td>사원명</td>
		<td><%=ename %></td>
	</tr>
	<tr>
		<td>부서명</td>
		<td><%=dname %></td>
	</tr>
	<tr>
		<td>급여</td>
		<td><%=salary %></td>
	</tr>
	<tr>
		<td>부서장명</td>
		<td><%=manager %></td>
	</tr>
</table>

