<!-- _04_readLineFile.jsp  -->
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="java.util.Scanner"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2>파일 읽기</h2>

<%
	String attachPath = "C:/jih/attach";
	String uploadPath = attachPath + "/testFile/aaa";
	String uploadFile = uploadPath + "/test01.txt";
	
	try {
		java.io.File f = new java.io.File(uploadFile);
		Scanner sReader = new Scanner(f);
		while(sReader.hasNextLine()) {
			String data = sReader.nextLine();
			//data = data.replace("\n", "<br>");
			String[] imsiArray = data.split(",");

			String name = imsiArray[0];
			String kor_ = imsiArray[1];
			String eng_ = imsiArray[2];
			String mat_ = imsiArray[3];
			String sci_ = imsiArray[4];
			String his_ = imsiArray[5];
			
			int kor = Integer.parseInt(kor_);
			int eng = Integer.parseInt(eng_);
			int mat = Integer.parseInt(mat_);
			int sci = Integer.parseInt(sci_);
			int his = Integer.parseInt(his_);
			
			out.println(name + "\t" + kor + "\t" + eng + "\t" + mat + "\t" + sci + "\t" + his);
			
			int tot = kor + eng + mat + sci + his;
			double avg = tot / 5.0;
			
			String grade = "가";
			if(avg >= 90) {
				grade = "수";
			} else if(avg >= 80) {
				grade = "우";
			} else if(avg >= 70) {
				grade = "미";
			} else if(avg >= 60) {
				grade = "양";
			}
			
			out.println("이름\t국어\t 영어\t 수학\t 과학\t 역사\t 총점\t 평균\t등급<br>");
			out.println(name + "\t" + kor + "\t" + eng + "\t" + mat + "\t" + sci + "\t" + his + "\t" + tot + "\t" + avg + "\t" + grade);
			
		}
		
	} catch (Exception e ) {
		//e.printStackTrace();
	}
%>

</body>
</html>