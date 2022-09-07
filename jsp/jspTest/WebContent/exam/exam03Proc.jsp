<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String jumin = request.getParameter("jumin");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	
	//123456-1234567
	String imsi01_ = jumin.substring(0, 2);
	int imsi01 = Integer.parseInt(imsi01_);
	String imsi02 = jumin.substring(7, 8);
	
	String gender = "여";
	if(imsi02.equals("1") || imsi02.equals("3")) {
		gender = "남";
	}
	
	int age = 0;
	if(imsi02.equals("1")|| imsi02.equals("2")){ //1900
		age = 2022 - (1900 + imsi01) + 1;
	} else { //2000
		age = 2022 - (2000 + imsi01) + 1;
	}
%>

당신의 이름은 <%=name %>입니다.<br>
당신의 주민번호는 <%=jumin %>입니다.<br>
당신의 연락처은 <%=phone %>입니다.<br>
당신의 이메일은 <%=email %>입니다.<br>
당신의 성별은 <%=gender %>입니다.<br>
당신의 나이는 <%=age %>입니다.<br>