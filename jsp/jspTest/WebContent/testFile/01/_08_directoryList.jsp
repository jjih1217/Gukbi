<!-- _08_directoryList.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>파일 목록</h2>

<%
	String attachPath = "C:/jih/attach";
	String uploadPath = attachPath + "/testFile";
	
	String directory = uploadPath;
	String[] files = new java.io.File(directory).list();
	
	int num = 1;
	for (String file : files) {
		//out.print(num + "." + file + "<br>");
		//num++;
		
		//out.print("<a href='#' onClick="move('" +  file + "');">" + file + "</a><br>");
	
%>
	<a href='#' onClick="move('<%=file%>');"> <%=file %> </a><br>
<%
	}
%>

<form name="form">
	<input type="hidden" name="fileName">
</form>


<script>
function move(value1) {
	if(confirm('정말 삭제할까요?')) {
		//location.href = 'aaa.jsp?fileName=' + value1; 
		document.form.fileName.value = value1;
		
		document.form.action = "aaa.jsp";
		document.form.method = "post";
		document.form.submit();
	}
}
</script>
</body>
</html>

