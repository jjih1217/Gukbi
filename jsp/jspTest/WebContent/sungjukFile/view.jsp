<!-- sungjukFile/view.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String pageName = "viewPage";
%>

<%@include file = "_inc_fileInfo.jsp" %> <!-- 변수공유 가능 -->

<%
	String name = request.getParameter("name");

	String info = "";
	try {
		//java.io.file f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while (sReader.hasNextLine()) {
			String imsi = sReader.nextLine();//한줄읽기
			
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
	//out.println(info);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
<h2>성적관리(상세보기)</h2>
<form name="chugaForm">
<table border="1">
	<tr>
		<td>이름 : </td>
		<td><%=name %></td>
	</tr>
	<tr>
		<td>국어 : </td>
		<td><%=kor_ %></td>
	</tr>
	<tr>
		<td>영어 : </td>
		<td><%=eng_ %></td>
	</tr>
	<tr>
		<td>수학 : </td>
		<td><%=mat_ %></td>
	</tr>
	<tr>
		<td>과학 : </td>
		<td><%=sci_ %></td>
	</tr>
	<tr>
		<td>역사 : </td>
		<td><%=his_ %></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" Onclick="move('list','');">목록</button>
			<button type="button" Onclick="move('chuga','');">등록</button>
			<button type="button" Onclick="move('sujung','<%=name %>');">수정</button>
			<button type="button" Onclick="move('sakje','<%=name %>');">삭제</button>
		</td>
	</tr>
</table>
</form>

<script>
function move(value1, value2) {
	location.href = value1 + ".jsp?name=" + value2;
}
</script>
	
</body>
</html>