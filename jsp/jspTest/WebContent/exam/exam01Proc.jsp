<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String age_ = request.getParameter("age");
	String gender = request.getParameter("gender");
	
	int age = Integer.parseInt(age_);
	
	out.println("당신의 이름은 " + name + "입니다. <br>");
	out.println("당신의 나이는 " + age + "입니다. <br>");
	out.println("당신의 성별은 " + gender + "입니다. <br>");
%>

<hr>

당신의 이름은 <%=name %>입니다.<br>
당신의 나이는 <%=age %>입니다.<br>
당신의 성별은 <%=gender %>입니다.<br>

<hr>

<table border="1">
	<tr>
		<td>당신의 이름은 <%=name %>입니다.</td>
	</tr>
	<tr>
		<td>당신의 나이는 <%=age %>입니다.</td>
	</tr>
	<tr>
		<td>당신의 성별은 <%=gender %>입니다.</td>
	</tr>
</table>