<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String name = "홍길동";
	int kor = 90;
	int eng = 80;
	int mat = 70;
	int tot = kor + eng + mat;
	double avg = tot / 3.0;
	String grade = "가";
	if (avg >= 90) {
		grade = "수";
	} else if (avg >= 80) {
		grade = "우";
	} else if (avg >= 70) {
		grade = "미";
	} else if (avg >= 60) {
		grade = "양";
	} 
	
	String gradeDisplayText01 = "";
	String gradeDisplayText02 = "";
	if(grade.equals("수") || grade.equals("우")) {
		gradeDisplayText01 = "<font style= \"color: blue; font-weight: bold\">";
		gradeDisplayText02 = "</font>";
	}

	String gradeDisplayText = gradeDisplayText01 +  "(" + grade + ")" + gradeDisplayText02;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>test03.jsp</h2>
	
	<table border="1" align="left">
		<tr>
			<td width="80px">이름 : </td>
			<td width="300px"><font style="color: blue; font-weight: bold"><%=name %></font></td>
		</tr> 
		
		<% if( kor>= 60){ %>
			<tr>
			<td>국어 : </td>
			<td><%=kor %></td>
		</tr>
		<% } %>
		
		<tr>
			<td>영어 : </td>
			<td><%=eng %></td>
		</tr>
		<tr>
			<td>수학 : </td>
			<td><%=mat %></td>
		</tr> 
		<tr>
			<td>총점 : </td>
			<%--<td><%=kor + eng + mat %></td> --%>
			<td><%=tot %></td>
		</tr> 
		<tr>
			<td>평균 : </td>
			<td>
				<%=avg %>
				
				<% if(grade.equals("수") || grade.equals("우")) { %>
					<font style = "color: red; font-weight: bold;"><%=grade %></font>
				<% } else { %>	
					<%=grade %>
				<% } %>
				
				&nbsp; / &nbsp;
				<%=gradeDisplayText01 %> (<%=grade %>)<%=gradeDisplayText02 %>
				&nbsp; / &nbsp;
				<%=gradeDisplayText %>
			</td>
		</tr>
		 
		<tr>
			<td>등급 : </td>
			<td>
				<% if(grade.equals("수") || grade.equals("우")) { %> <%-- avg >= 80 --%>
					<font style = "color: red; font-weight: bold;"><%=grade %></font>
				<% } else { %>
					<%=grade %>
				<% } %>
			</td>
		</tr>
		
	</table>
	
</body>
</html>