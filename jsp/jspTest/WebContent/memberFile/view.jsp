<!-- memberFile/view.jsp -->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");

	String attachPath = "C:/jih/attach";
	String uploadPath = attachPath + request.getContextPath();
	String uploadFile = uploadPath + "/member.txt";
	
	String info = "";
	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()) {
			String data = sReader.nextLine();//1명 정보
			//out.println(data);
			int loc = data.indexOf(",");//첫번째 , 위치
			//out.println(loc);
			String imsi_id = data.substring(0,loc);
			//out.println(imsi_id);
			if(id.equals(imsi_id)) {
				info = data;
				break;
			}
		}
		
	} catch (Exception e ) {
		//e.printStackTrace();
	}
	String[] tempArray = info.split(",");
	//String name = tempArray[0];
	String passwd = tempArray[1];
	String name = tempArray[2];
	String phone = tempArray[3];
	String email = tempArray[4];
	String address = tempArray[5];

	//out.println(info);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>상세보기</h2>
<table border="1" width="50%">
	<tr>
		<td>아이디 : </td>
		<td><%=id %></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td><%=passwd %></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td><%=name %></td>
	</tr>
	<tr>
		<td>전화번호 : </td>
		<td><%=phone %></td>
	</tr>
	<tr>
		<td>이메일 : </td>
		<td><%=email %></td>
	</tr>
	<tr>
		<td>주소 : </td>
		<td><%=address %></td>
	</tr>
</table>
<div style="borer : 0px solid blue; width: 50%; margin-top: 10px;" align="right">
	<button type="button" onClick="move('list.jsp', '');">목록</button>
	<button type="button" onClick="move('chuga.jsp', '');">등록</button>
	<button type="button" onClick="move('sujung.jsp', '<%=id %>');">수정</button>
	<button type="button" onClick="move('sakje.jsp', '<%=id %>');">삭제</button>
</div>
 
<script>
function move(value1, value2) {
	location.href =  value1 + "?id="  + value2;
}
</script>

</body>
</html>