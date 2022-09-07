<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String imsiInfo01 = "홍길동/90/80/70";
	String imsiInfo02 = "이성순/99/88/77";
	String imsiInfo03 = "장천용/100/100/100";
	
	String[] array = new String[3];
	array[0] = imsiInfo01; //"홍길동/90/80/70"
	array[1] = imsiInfo02;
	array[2] = imsiInfo03;
	
	//out.print(array[0]);
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test07.jsp</title>
</head>
<body>

<h2>test07.jsp</h2>

<table border="1">
	<tr>
		<td>이름</td>
		<td>국어</td>
		<td>영어</td>
		<td>수학</td>
	</tr>
	<%	
		int sumKor = 0;
		int sumEng = 0;
		int sumMat = 0;
		
		for(int i=0; i<array.length; i++) {
			String[] array2 = array[i].split("/");
			String name = array2[0];
			String kor = array2[1];
			String eng = array2[2];
			String mat = array2[3];
			
			int kor_ = Integer.parseInt(kor);
			int eng_ = Integer.parseInt(eng);
			int mat_ = Integer.parseInt(mat);

			sumKor += kor_;
			sumEng += eng_; 
			sumMat += mat_; 
			
	%>
		<tr>
			<td><%=name %></td>
			<td><%=kor %></td>
			<td><%=eng %></td>
			<td><%=mat %></td>
		</tr>
		
	<%
		}
		
		double avgKor = sumKor / 3.0;
		double avgEng =  sumEng / 3.0;
		double avgMat = sumMat / 3.0;
		
		int tot = sumKor + sumEng + sumMat;
		double avg = tot / 3.0;
	%>
	
	<tr>
		<td>과목별 합계</td>
		<td><%=sumKor %> / <%=avgKor %></td>
		<td><%=sumEng %></td>
		<td><%=sumMat %></td>
	</tr>
	<tr>
		<td>과목별 평균</td>
		<td><%=avgKor %></td>
		<td><%=avgEng %></td>
		<td><%=avgMat %></td>
	</tr>
	
</table>

<hr>
전체 총점 및 평균 : 총점 (<%=tot %>) 평균(<%=avg %>)

</body>
</html>