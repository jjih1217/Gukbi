<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test04.jsp</title>
</head>
<body>

<h2>test04.jsp</h2>

<%
	for(int i=1; i<10 ; i++) {
		out.println(i);
	}
%>

<hr>

<table border="1" width="100px">
	<% 
		for(int i=1; i<10 ; i++) { 
	%>
		<tr>
			<td><%=i %></td>
			<td>--</td>
		</tr>
	<% 
		} 
	%>
</table>

<hr>

<table border="1" width="100px">
	<% 
		int sum = 0;
		for(int i=1; i<10 ; i++) { 
			sum += i;
	%>
		<tr>
			<td><%=i %></td>
			<td><%=sum %></td>
		</tr>
	<% 
		//sum += i;
		} 
	%>
</table>

<hr>

<table border="1" width="500px">
	<tr bgcolor="#fff333">
		<th>순번</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<%	
		for(int i=0; i<10; i++){
			String imsiBg = "";
			if(i%2 == 0) {//홀수
				imsiBg = "bgcolor=\"gray\"";
			}
	%>
		<tr <%=imsiBg %>>
			<td><%=i+1 %></td>
			<td>연습입니다.</td>
			<td>홍길동</td>
			<td>2022-08-02</td>
			<td>21</td>
		<tr>
		
	<% 
		}
	%>
</table>

<hr>

<table border="1" width="500px">
	
	<tr bgcolor="#fff333">
		<th>순번</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<%	
		for(int i=0; i<10; i++){
	%>
		<% if(i%2 == 0) {//홀수 %>
			<tr bgcolor="gray";>
		<% } else { %>
			<tr bgcolor="magenta";>
		<%  } %>
			
			<td><%=i+1 %></td>
			<td>연습입니다.</td>
			<td>홍길동</td>
			<td>2022-08-02</td>
			<td>21</td>
		<tr>
		
	<% 
		}
	%>
</table>

<hr>

<table border="1" width="500px">
	<tr bgcolor="#fff333">
		<th>순번</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성일</th>
		<th>조회수</th>
	</tr>
	<%
		int k = 0;
		while (k < 10) {
	%>
			<tr>
				<td><%=k+1 %></td>
				<td>연습입니다.</td>
				<td>홍길동</td>
				<td>2022-08-02</td>
				<td>21</td>
			<tr>
	<%
			k++;
		}
	%>
</table>

</body>
</html>