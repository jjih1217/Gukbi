<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	
	//리스트 저장 : list
	/*
	ArrayList<String> list = new ArrayList<>();
	String imsi = "";
	
	String name1 = "홍길동";
	int kor1 = 90;
	int eng1 = 80;
	int mat1 = 70;
	
	imsi = name1 + "|" + kor1 +  "|" +  eng1 +  "|" + mat1;
	list.add(imsi);
	
	String name2 = "이성순";
	int kor2 = 99;
	int eng2 = 88;
	int mat2 = 77;
	
	imsi = name2 + "|" + kor2 +  "|" +  eng2 +  "|" + mat2;
	list.add(imsi);
	
	String name3 = "장천용";
	int kor3 = 100;
	int eng3 = 100;
	int mat3 = 100;
	
	imsi = name3 + "|" + kor3 +  "|" +  eng3 +  "|" + mat3;
	list.add(imsi);
	*/
	
	ArrayList<String> list = new ArrayList<>();
	for(int i=0; i<3; i++) {
		String name; 
		int kor; 
		int eng;
		int mat;
		String imsi;
		
		if(i == 1) {
			name = "홍길동";
			kor = 90;
			eng = 80;
			mat = 70;
		} else if (i == 2) {
			name = "이성순";
			kor = 99;
			eng = 88;
			mat = 77;
		} else {
			name = "장천용";
			kor = 100;
			eng = 100;
			mat = 100;
		} 
		
		imsi = name + "|" + kor + "|" + eng + "|" + mat;
		list.add(imsi);
	}
	
	out.print(list);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test08.jsp</title>
</head>
<body>


<h2>test08.jsp</h2>

<table border="1">
	<tr>
		<td>이름</td>
		<td>국어</td>
		<td>영어</td>
		<td>수학</td>
	</tr>
	
	<%
		for(int i=0; i<list.size(); i++) {
	
		String[] arrImsi = list.get(i).split("[|]");
		String name = arrImsi[0];
		String kor = arrImsi[1];
		String eng = arrImsi[2];
		String mat = arrImsi[3];
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