<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String imsiInfo01 = "홍길동/90/80/70";
	String imsiInfo02 = "이성순/99/88/77";
	String imsiInfo03 = "장천용/100/100/100";
	
	String memo = imsiInfo01 + "|" + imsiInfo02 + "|" + imsiInfo03;
	/*out.println(memo);*/
	
	String[] imsiArr01 = memo.split("[|]"); //{"홍길동/90/80/70","이성순/99/88/77","장천용/100/100/100" }
	//out.println(imsiArr01[0]); //"홍길동/90/80/70";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test06.jsp</title>
</head>
<body>
	
<h2>test06.jsp</h2>

<table border="1">
	<tr>
		<td>이름</td>
		<td>국어</td>
		<td>영어</td>
		<td>수학</td>
	</tr>
	<%
		for(int i=0; i<imsiArr01.length; i++) {
			String[] imsiArr02 = imsiArr01[i].split("/"); //{"홍길동", "90", "80", "70"}
			String name = imsiArr02[0]; 
			String kor = imsiArr02[1];
			String eng = imsiArr02[2];
			String mat = imsiArr02[3];
	%>
		<tr>
			<td><%=name %></td>
			<td><%=kor %></td>
			<td><%=eng %></td>
			<td><%=mat %></td>
		</tr>
	<% 
		}
	%>
	
</table>

	
</body>
</html>

