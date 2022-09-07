<!-- sungjukFile/sujung.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "_inc_fileInfo.jsp"%> <!-- 변수공유 가능 -->

<%
	String name = request.getParameter("name");

	String info = "";
	try {
		//java.io.file f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while (sReader.hasNextLine()) {
			String imsi = sReader.nextLine();
			String[] imsiArray = imsi.split(",");
			
			if(name.equals(imsiArray[0])) {
				info = imsi;
				break;
			}
		}
		sReader.close();
	} catch (Exception e) {
		//e.printStackTrace();
	}
	
	String[] tempArray = info.split(",");
	//String name = tempArray[0];
	String kor_ = tempArray[1];
	String eng_ = tempArray[2];
	String mat_ = tempArray[3];
	String sci_ = tempArray[4];
	String his_ = tempArray[5];
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<h2>성적관리(수정)</h2>
<form name="sujungForm">
<table border="1">
	<tr>
		<td>이름 : </td>
		<%--<td><input type="text" name="name" value="<%=name %>" readonly></td> --%>
		<td><%=name %> <input type="hidden" name="name" value="<%=name %>"></td>
	</tr>
	<tr>
		<td>국어 : </td>
		<td><input type="text" name="kor" value="<%=kor_ %>"></td>
	</tr>
	<tr>
		<td>영어 : </td>
		<td><input type="text" name="eng" value="<%=eng_ %>"></td>
	</tr>
	<tr>
		<td>수학 : </td>
		<td><input type="text" name="mat" value="<%=mat_ %>"></td>
	</tr>
	<tr>
		<td>과학 : </td>
		<td><input type="text" name="sci" value="<%=sci_ %>"></td>
	</tr>
	<tr>
		<td>역사 : </td>
		<td><input type="text" name="his" value="<%=his_ %>"></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onClick="sujung();">확인</button>
		</td>
	</tr>
</table>
</form>

<script>
function sujung() {
	if(confirm('수정하시겠습니까?')) {
		document.sujungForm.action = "sujungProc.jsp";
		document.sujungForm.method  = "post";
		document.sujungForm.submit();
	}
}
</script>
	
</body>
</html>