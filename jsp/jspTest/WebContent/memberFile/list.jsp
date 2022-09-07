<!-- memberFile/list.jsp -->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String attachPath = "C:/jih/attach";
	String uploadPath = attachPath + request.getContextPath();
	String uploadFile = uploadPath + "/member.txt";
	
	ArrayList<String> list = new ArrayList<>();
	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()) {
			String data = sReader.nextLine();
			list.add(data);
		}
		sReader.close();
	} catch (Exception e ) {
		//e.printStackTrace();
	}
	//out.println(list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>회원목록</h2>
<table border="1" width="70%">
	<tr>
		<th>순번</th>
		<th>아이디</th>
		<th>이름</th>
		<th>전화번호</th>
		<th>주소</th>
	</tr>
	<%
		int totalCounter = list.size();
		for(int i=0; i<list.size(); i++) {
			String imsi = list.get(i);
			String[] imsiArray = imsi.split(",");
			
			String id = imsiArray[0];
			String passwd = imsiArray[1];
			String name = imsiArray[2];
			String phone = imsiArray[3];
			String email = imsiArray[4];
			String address = imsiArray[5];
	%>
	
	<tr>
		<td><%=totalCounter %></td>
		<td><a href="#" onClick="move('view.jsp', '<%=id %>');"><%=id %></a></td>
		<td><%=name %></td>
		<td><%=phone %></td>
		<td><%=address %></td>
	</tr>
	
	<% 
			totalCounter--;
		} 
	%>
	
</table>
<div style="border : 0px solid blue; width: 70%; margin-top: 10px;" align="right">
	<button type="button" onClick="move('list.jsp', '');">목록</button>
	<button type="button" onClick="move('chuga.jsp', '');">등록</button>
</div>


<script>
function move(value1, value2) {
	location.href =  value1 + "?id=" + value2;
}
</script>

</body>
</html>

