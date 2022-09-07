<!-- sungjukFile/list.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String pageName = "listPage";
%>

<%@include file = "_inc_fileInfo.jsp" %> 

<%	
	ArrayList<String> list = new ArrayList<>();
	try {
		//java.io.file f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while (sReader.hasNextLine()) {
			String imsi = sReader.nextLine();
			list.add(imsi);			
		}
		sReader.close();
	} catch (Exception e) {
		//e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>성적관리(목록)</h2>
<table border="1">
	<tr>
		<th>NO</th>
		<th>이름</th>
		<th>국어</th>
		<th>영어</th>
		<th>수학</th>
		<th>과학</th>
		<th>역사</th>
	</tr>
	<% 
		int imsiNo = 1;
		for (int i = 0; i<list.size(); i++) { 
			//String imsi = list.get(i);
			//String[] imsiArray = imsi.split(",");
			String[] imsiArray =  list.get(i).split(",");
			
			String name = imsiArray[0];
			String kor = imsiArray[1];
			String eng = imsiArray[2];
			String mat = imsiArray[3];
			String sci = imsiArray[4];
			String his = imsiArray[5];
	%>
			<tr>
				<td><%=imsiNo %></td>
				<td><a href="#" onClick="move('view','<%=name %>');"><%=name %></a></td>
				<td><%=kor %></td>
				<td><%=eng %></td>
				<td><%=mat %></td>
				<td><%=sci %></td>
				<td><%=his %></td>
			</tr>
	<% 	
			imsiNo++;
		} 
	%>
	<tr>
		<td colspan="7">
			<button type="button" Onclick="move('list','');">목록</button>
			<button type="button" Onclick="move('chuga','');">등록</button>
		</td>
	</tr>
</table>

<script>
function move(value1, value2) {
	location.href = value1 + ".jsp?name=" + value2;
}
</script>

</body>
</html>