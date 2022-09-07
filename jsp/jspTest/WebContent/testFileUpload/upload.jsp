<!-- textFileUpload/upload.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>파일 업로드</h2>

<form name="uploadForm" method="post" action="uploadProc.jsp" enctype="multipart/form-data">
이름 : <input type="text" name="name"><br>
제목 : <input type="text" name="subject"><br>
파일1 : <input type="file" name="file1"><br>
파일2 : <input type="file" name="file2"><br>
<button type="submit">업로드</button>
</form>

</body>
</html>

