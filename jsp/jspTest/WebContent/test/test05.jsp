<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String[] guamoks = new String[5]; //{"","","","",""}
	guamoks[0] = "국어";
	guamoks[1] = "영어";
	guamoks[2] = "수학";
	guamoks[3] = "과학";
	guamoks[4] = "역사";
	
	int[] jumsus = new int[5];
	jumsus[0] = 90;
	jumsus[1] = 80;
	jumsus[2] = 70;
	jumsus[3] = 60;
	jumsus[4] = 50;
	
	/*
	for(int i=0; i<guamoks.length; i++) {
		out.println(guamoks[i] + "<br>");
	}
	*/
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test05.jsp</title>
</head>
<body>

<h2>test05.jsp</h2>

<table border="1">
	<tr>
		<td>과목</td>
		<td>점수</td>
	</tr>
	
	<%
		for(int i=0; i<guamoks.length; i++) {
	%>
		<tr>
			<td><%=guamoks[i] %></td>
			<td><%=jumsus[i] %></td>
		</tr>
	<%
		}
	%>	
</table>


</body>
</html>