<!-- memberFile/sakje.jsp -->
<%@page import="java.util.Scanner"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String id = request.getParameter("id");
	
	String attachPath = "C:/jih/attach";
	String uploadPath = attachPath + request.getContextPath();
	String uploadFile = uploadPath + "/member.txt";
	
	String info ="";
	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()) {
			String data = sReader.nextLine();
			int loc = data.indexOf(",");
			String imsi_id = data.substring(0,loc);
			//out.println(imsi_id);
			
			if(id.equals(imsi_id)) {
				info = data;
				sReader.close();
				break;
			}
		}
	} catch (Exception e ) {
		//e.printStackTrace();
	}
	//out.println(info);
	
	String[] imsiArray = info.split(",");
	//String id = imsiArray[0];
	String passwd = imsiArray[1];
	String name = imsiArray[2];
	String phone = imsiArray[3];
	String email = imsiArray[4];
	String address = imsiArray[5];
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>회원정보삭제</h2>
<form name="sakjeForm">

<table border="1">
	<tr>
		<td>아이디 : </td>
		<td><%=id %><input type="hidden" name="id" value="<%=id %>" readonly></td>
	</tr>
	<tr>
		<td>비밀번호 : </td>
		<td><%=passwd %><input type="hidden" name="passwd" value="<%=passwd %>" readonly></td>
	</tr>
	<tr>
		<td>이름 : </td>
		<td><%=name %><input type="hidden" name="name" value="<%=name %>" readonly></td>
	</tr>
	<tr>
		<td>전화번호 : </td>
		<td><%=phone %><input type="hidden" name="phone" value="<%=phone %>" readonly></td>
	</tr>
	<tr>
		<td>이메일 : </td>
		<td><%=email %><input type="hidden" name="email" value="<%=email %>" readonly></td>
	</tr>
	<tr>
		<td>주소 : </td>
		<td><%=address %><input type="hidden" name="address" value="<%=address %>" readonly></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="sakje();">삭제하기</button>
		</td>
	</tr>
</table>
</form>

<script>
function sakje() {
	document.sakjeForm.action = "sakjeProc.jsp";
	document.sakjeForm.method = "post";
	document.sakjeForm.submit();
}

</script>
</body>
</html>