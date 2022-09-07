<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	String path = request.getContextPath();
	String url = request.getRequestURL().toString();
	String uri = request.getRequestURI().toString();
	
	String[] pgNameArray = url.split("/");
	String pgName = pgNameArray[pgNameArray.length - 2];
	
%>
|
<a href="<%=path %>">HOME</a>
|

<% if(pgName.equals("member")) { %>
	<a href="../member/list.jsp"><font style="color:red; font-weight: bold;">회원관리</font></a>
<% } else { %>
	<a href="../member/list.jsp">회원관리</a>
<% } %>

|

<% if(pgName.equals("product")) { %>
	<a href="../product/list.jsp"><font style="color:red; font-weight: bold;">상품관리</font></a>
<% } else { %>
	<a href="../product/list.jsp">상품관리</a>
<% } %>

|
<br>
|

<% if(pgName.equals("useBean")) { %>
	<a href="../useBean/chuga.jsp"><font style="color:red; font-weight: bold;">useBean</font></a>
<% } else { %>
	<a href="../useBean/chuga.jsp">useBean</a>
<% } %>

|
<br>
|
<a href="../main/main.jsp?menuGubun=member2_list">회원관리2</a>
|
<br>
|
<a href="../memberBasic/list.jsp">회원관리(Basic)</a>
|
<br>
|
<a href="../book/list.jsp">도서관리(BOOK)</a>
|
<a href="../bookAuthor/list.jsp">저자관리(BOOK)</a>
|
<a href="../bookProfile/list.jsp">분류관리(BOOK)</a>
|
<a href="../bookInfo/list.jsp">도서정보관리(BOOK)</a>
|
<br>
<a href="../haksaMember/list.jsp">학사관리(Member)</a>
|
<a href="../haksaSihum/list.jsp">학사관리(Sihum)</a>
|
<a href="../haksaSungjuk/list.jsp">학사관리(Sungjuk)</a>
|
