<!-- WebContent/memberBasic/sakje.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1" width="80%" align="center">
	<tr>
		<td height="100px;" align="center">
			<jsp:include page="../include/inc_menu.jsp" flush="true"></jsp:include> <!-- 변수공유 x -->
		</td>
	</tr>
	<tr>
		<td align="center" style="padding: 0 0 20px 0;">
			<!-- 본문 내용 시작 -->
			<jsp:include page="sakje_sub.jsp" flush="true"></jsp:include>
			<!-- 본문 내용 종료 -->
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

