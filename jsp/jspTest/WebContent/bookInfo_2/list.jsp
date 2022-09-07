<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1" width ="80%" align = "center">
	<tr>
		<td height="100px;" align="center">
			<jsp:include page="../include/inc_menu.jsp" flush="true"></jsp:include>
		</td>
	</tr>
	<tr>
		<td align="center" style="padding:0px 0px 30px 0px;" >
			<jsp:include page="list_sub.jsp" flush="true"></jsp:include>
		</td>
	</tr>
	<tr>
		<td height="100px;" align="center">
			<jsp:include page="../include/inc_bottom.jsp" flush="true"></jsp:include>
		</td>
	</tr>
</table>

</body>
</html>