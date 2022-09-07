<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String[] array = new String[2];
	
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String nickName = request.getParameter("nickName");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String jumin = request.getParameter("jumin");
	String address = request.getParameter("address");
	
	String id2 = request.getParameter("id2");
	String passwd2 = request.getParameter("passwd2");
	String name2 = request.getParameter("name2");
	String nickName2 = request.getParameter("nickName2");
	String phone2 = request.getParameter("phone2");
	String email2 = request.getParameter("email2");
	String jumin2 = request.getParameter("jumin2");
	String address2 = request.getParameter("address2");
	
	String human1 = "";
	human1 += id + "/";
	human1 += passwd + "/";
	human1 += name + "/";
	human1 += nickName + "/";
	human1 += phone + "/";
	human1 += email + "/";
	human1 += jumin + "/";
	human1 += address;
	
	String human2 = "";
	human2 += id2 + "/";
	human2 += passwd2 + "/";
	human2 += name2 + "/";
	human2 += nickName2 + "/";
	human2 += phone2 + "/";
	human2 += email2 + "/";
	human2 += jumin2 + "/";
	human2 += address2;
	
	String human3 = human1 + "|" +  human2;
	
	array[0] = human1;
	array[1] = human2;

%>

<%=human1  %>
<hr>
<%=human2  %>
<hr>
<%=human3 %>
<hr>
<%=array.length %> / <%=array[0] %> / <%=array[1] %> 
